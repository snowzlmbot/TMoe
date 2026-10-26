package cc.ioctl.tmoe.rtti;

import org.jf.dexlib2.Opcode;
import org.jf.dexlib2.Opcodes;
import org.jf.dexlib2.iface.instruction.Instruction;
import org.jf.dexlib2.immutable.ImmutableClassDef;
import org.jf.dexlib2.immutable.ImmutableDexFile;
import org.jf.dexlib2.immutable.ImmutableField;
import org.jf.dexlib2.immutable.ImmutableMethod;
import org.jf.dexlib2.immutable.ImmutableMethodImplementation;
import org.jf.dexlib2.immutable.ImmutableMethodParameter;
import org.jf.dexlib2.immutable.instruction.ImmutableInstruction10x;
import org.jf.dexlib2.immutable.instruction.ImmutableInstruction11x;
import org.jf.dexlib2.immutable.instruction.ImmutableInstruction21c;
import org.jf.dexlib2.immutable.instruction.ImmutableInstruction22c;
import org.jf.dexlib2.immutable.instruction.ImmutableInstruction35c;
import org.jf.dexlib2.immutable.reference.ImmutableFieldReference;
import org.jf.dexlib2.immutable.reference.ImmutableMethodReference;
import org.jf.dexlib2.immutable.reference.ImmutableTypeReference;

import org.jf.dexlib2.immutable.instruction.ImmutableInstruction3rc;
import org.jf.dexlib2.immutable.instruction.ImmutableInstruction11n;
import org.jf.dexlib2.immutable.instruction.ImmutableInstruction21s;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.Map;
import android.view.ViewGroup;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

import cc.ioctl.tmoe.BuildConfig;
import cc.ioctl.tmoe.util.HostInfo;
import cc.ioctl.tmoe.util.dex.DexFieldDescriptor;
import cc.ioctl.tmoe.util.dex.DexMethodDescriptor;

public class ProxyFragmentImplDexCreator {

    private static final int ACC_CONSTRUCTOR = 0x00010000;
    private static final String PROXY_FRAGMENT_IMPL_CLASS_NAME = "cc.ioctl.tmoe.dynamic.ProxyFragmentImpl";
    private static final String PROXY_FRAGMENT_IMPL_TYPE = "L" + PROXY_FRAGMENT_IMPL_CLASS_NAME.replace(".", "/") + ";";
    private static final String RTTI_HANDLER_TYPE = "L" + ProxyFragmentRttiHandler.class.getName().replace(".", "/") + ";";

    private ProxyFragmentImplDexCreator() {
        throw new AssertionError("no instance for you!");
    }

    public static synchronized File createProxyFragmentImplDex(Class<?> baseFragmentClass,
            Class<?> actionBar, Class<?> actionBarLayout)
            throws ReflectiveOperationException, IOException {
        // Bump whenever bridge semantics change: never reuse a dex from the APK patch.
        String hashCode = Integer.toHexString(Objects.hash("exact-host-v3",
                baseFragmentClass.getName(), actionBar.getName(), actionBarLayout.getName(),
                HostInfo.getPackageName(), HostInfo.getVersionCode(), BuildConfig.VERSION_NAME,
                BuildConfig.VERSION_CODE, BuildConfig.BUILD_UUID));
        File directory = new File(HostInfo.getApplication().getFilesDir(), "tmoe_dyn_dex");
        if (!directory.isDirectory() && !directory.mkdirs()) {
            throw new IOException("Cannot create dynamic dex directory: " + directory);
        }
        File dexFile = new File(directory, "ProxyFragmentImpl_" + hashCode + ".dex");
        if (dexFile.isFile() && dexFile.length() > 0) {
            ensureReadOnly(dexFile);
            return dexFile;
        }
        String baseType = DexFieldDescriptor.getTypeSig(baseFragmentClass);
        ArrayList<org.jf.dexlib2.iface.Method> methods = new ArrayList<>();
        for (Method bridge : IProxyFragmentObject.class.getDeclaredMethods()) {
            if (!bridge.getName().endsWith("$super")) {
                continue;
            }
            String name = bridge.getName().substring(0, bridge.getName().length() - 6);
            Method host = findHostMethod(baseFragmentClass, name, bridge, actionBar, actionBarLayout);
            if (host == null || Modifier.isAbstract(host.getModifiers())) {
                throw new NoSuchMethodException("Missing host super method for " + bridge);
            }
            // The stable Java interface determines the bridge descriptor, NOT the
            // host's erased descriptor (parentLayout can now be an interface).
            methods.add(generateProxySuperStubMethod(host, bridge));
        }
        Map<String, ImmutableMethod> dispatchers = new LinkedHashMap<>();
        for (Method dispatcher : ProxyFragmentRttiHandler.class.getDeclaredMethods()) {
            if (!Modifier.isPublic(dispatcher.getModifiers())
                    || Modifier.isStatic(dispatcher.getModifiers())
                    || !dispatcher.getName().endsWith("$dispatcher")) {
                continue;
            }
            String name = dispatcher.getName().substring(0, dispatcher.getName().length() - 11);
            Method host = findHostMethod(baseFragmentClass, name, dispatcher, actionBar, actionBarLayout);
            // Obsolete callbacks must not create methods with fictitious signatures.
            if (host == null || Modifier.isFinal(host.getModifiers())) {
                continue;
            }
            ImmutableMethod generated = generateProxyDispatcherMethod(host, dispatcher);
            String key = new DexMethodDescriptor(host).toString();
            if (dispatchers.put(key, generated) != null) {
                throw new IllegalStateException("Ambiguous host dispatcher: " + host);
            }
        }
        methods.addAll(dispatchers.values());
        baseFragmentClass.getDeclaredConstructor(android.os.Bundle.class);
        methods.addAll(generateProxyClassConstructor(baseType));
        ImmutableField handlerField = new ImmutableField(PROXY_FRAGMENT_IMPL_TYPE, "h",
                RTTI_HANDLER_TYPE, Modifier.PRIVATE | Modifier.FINAL, null, null, null);
        ImmutableClassDef definition = new ImmutableClassDef(PROXY_FRAGMENT_IMPL_TYPE,
                Modifier.PUBLIC, baseType,
                Collections.singletonList(DexFieldDescriptor.getTypeSig(IProxyFragmentObject.class)),
                "ProxyFragmentImpl.dexlib2", null, Collections.singletonList(handlerField), methods);
        ImmutableDexFile dex = new ImmutableDexFile(Opcodes.forDexVersion(35),
                Collections.singletonList(definition));
        // Open the fd BEFORE chmod, then write through that fd. Android 14+ requires
        // dynamically loaded code to be read-only; do not reopen a writable file.
        File temporary = File.createTempFile("ProxyFragmentImpl_", ".tmp", directory);
        try {
            try (FileOutputStream output = new FileOutputStream(temporary)) {
                ensureReadOnly(temporary);
                org.jf.dexlib2.writer.io.MemoryDataStore store =
                        new org.jf.dexlib2.writer.io.MemoryDataStore();
                try {
                    org.jf.dexlib2.writer.pool.DexPool.writeTo(store, dex);
                    output.write(store.getBuffer(), 0, store.getSize());
                    output.getFD().sync();
                } finally {
                    store.close();
                }
            }
            if (dexFile.exists() && !dexFile.delete()) {
                throw new IOException("Cannot replace empty dynamic dex: " + dexFile);
            }
            if (!temporary.renameTo(dexFile)) {
                throw new IOException("Cannot publish dynamic dex: " + dexFile);
            }
            ensureReadOnly(dexFile);
            return dexFile;
        } finally {
            if (temporary.exists()) {
                temporary.delete();
            }
        }
    }

    private static void ensureReadOnly(File file) throws IOException {
        if (!file.setReadOnly()) {
            throw new IOException("Cannot make dynamic dex read-only: " + file);
        }
    }

    private static Method findHostMethod(Class<?> base, String name, Method module,
            Class<?> actionBar, Class<?> layout) throws NoSuchMethodException {
        Method best = null;
        int bestScore = -1;
        for (Class<?> owner = base; owner != null; owner = owner.getSuperclass()) {
            for (Method candidate : owner.getDeclaredMethods()) {
                int modifiers = candidate.getModifiers();
                if (!candidate.getName().equals(name) || Modifier.isStatic(modifiers)
                        || Modifier.isPrivate(modifiers) || candidate.isBridge()
                        || (!Modifier.isPublic(modifiers) && !Modifier.isProtected(modifiers))) {
                    continue;
                }
                Class<?>[] hostTypes = candidate.getParameterTypes();
                Class<?>[] moduleTypes = module.getParameterTypes();
                if (hostTypes.length != moduleTypes.length) {
                    continue;
                }
                int score = 0;
                for (int i = 0; i < hostTypes.length; i++) {
                    if (hostTypes[i] == moduleTypes[i]) {
                        score += 4;
                    } else if ((hostTypes[i] == base && moduleTypes[i] == Object.class)
                            || ((hostTypes[i] == actionBar || hostTypes[i] == layout)
                            && moduleTypes[i] == ViewGroup.class)) {
                        score += 2;
                    } else {
                        score = -1;
                        break;
                    }
                }
                Class<?> hostReturn = candidate.getReturnType();
                Class<?> moduleReturn = module.getReturnType();
                if (score < 0 || (hostReturn != moduleReturn && hostReturn != void.class
                        && moduleReturn != void.class
                        && (hostReturn.isPrimitive() || moduleReturn.isPrimitive()))) {
                    continue;
                }
                if (score > bestScore) {
                    best = candidate;
                    bestScore = score;
                } else if (score == bestScore && best != null
                        && best.getDeclaringClass() == owner) {
                    throw new NoSuchMethodException("Ambiguous host overload for " + module);
                }
            }
            // Prefer the closest class; overridden ancestor declarations are not
            // alternative overloads and cannot be invoked as their own super.
            if (best != null) {
                return best;
            }
        }
        return null;
    }

    private static ArrayList<ImmutableMethod> generateProxyClassConstructor(String hostBaseFragmentTypeSig) {
        // smali for constructor
        // .method public constructor <init>(Lcc/ioctl/tmoe/rtti/ProxyFragmentRttiHandler;Landroid/os/Bundle;)V
        //     .registers 3
        //     .parameter "handler"
        //     .parameter "args"
        //     .prologue
        //     invoke-direct {p0, p2}, LBaseFragment;-><init>(Landroid/os/Bundle;)V
        //     iput-object p1, p0, Lcc/ioctl/tmoe/dynamic/ProxyFragmentImpl;->h:Lcc/ioctl/tmoe/rtti/ProxyFragmentRttiHandler;
        //     return-void
        // .end method
        ArrayList<ImmutableMethod> constructors = new ArrayList<>();
        ArrayList<Instruction> insCtor = new ArrayList<>();
        // invoke-direct {p0, p2}, LBaseFragment;-><init>(Landroid/os/Bundle;)V
        insCtor.add(new ImmutableInstruction35c(Opcode.INVOKE_DIRECT, 2, 0, 2, 0, 0, 0,
                referenceMethod(hostBaseFragmentTypeSig, "<init>", "(Landroid/os/Bundle;)V")));
        // iput-object p1, p0, LProxyFragmentImpl;->h:Lcc/ioctl/tmoe/rtti/ProxyFragmentRttiHandler;
        insCtor.add(new ImmutableInstruction22c(Opcode.IPUT_OBJECT, 1, 0,
                referenceField(PROXY_FRAGMENT_IMPL_TYPE, "h", RTTI_HANDLER_TYPE)));
        // return-void
        insCtor.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        ImmutableMethodImplementation ctorMethodImpl = new ImmutableMethodImplementation(3, insCtor, null, null);
        ImmutableMethod ctorMethod = new ImmutableMethod(PROXY_FRAGMENT_IMPL_TYPE, "<init>", Arrays.asList(
                new ImmutableMethodParameter(RTTI_HANDLER_TYPE, null, "handler"),
                new ImmutableMethodParameter("Landroid/os/Bundle;", null, "args")),
                "V", Modifier.PUBLIC | ACC_CONSTRUCTOR, null, null, ctorMethodImpl);
        constructors.add(ctorMethod);
        return constructors;
    }

    private static ImmutableMethod generateProxySuperStubMethod(Method host, Method bridge) {
        Class<?>[] bridgeTypes = bridge.getParameterTypes();
        Class<?>[] hostTypes = host.getParameterTypes();
        List<Instruction> instructions = new ArrayList<>();
        int register = 3; // two result locals, then this, then parameters
        for (int i = 0; i < bridgeTypes.length; i++) {
            if (bridgeTypes[i] != hostTypes[i]) {
                instructions.add(new ImmutableInstruction21c(Opcode.CHECK_CAST, register,
                        new ImmutableTypeReference(DexFieldDescriptor.getTypeSig(hostTypes[i]))));
            }
            register += wordCount(bridgeTypes[i]);
        }
        instructions.add(new ImmutableInstruction3rc(Opcode.INVOKE_SUPER_RANGE,
                2, 1 + parameterWords(hostTypes), referenceMethod(new DexMethodDescriptor(host))));
        appendReturn(instructions, host.getReturnType(), bridge.getReturnType());
        return immutableMethod(bridge.getName(), bridgeTypes, bridge.getReturnType(),
                3 + parameterWords(bridgeTypes), instructions);
    }

    private static ImmutableMethod generateProxyDispatcherMethod(Method host, Method dispatcher) {
        Class<?>[] hostTypes = host.getParameterTypes();
        Class<?>[] moduleTypes = dispatcher.getParameterTypes();
        List<Instruction> instructions = new ArrayList<>();
        // Reserve v0/v1 for results. v2 (this) becomes the handler, leaving a
        // contiguous handler+argument range even with long/double parameters.
        instructions.add(new ImmutableInstruction22c(Opcode.IGET_OBJECT, 2, 2,
                referenceField(PROXY_FRAGMENT_IMPL_TYPE, "h", RTTI_HANDLER_TYPE)));
        int register = 3;
        for (int i = 0; i < hostTypes.length; i++) {
            if (hostTypes[i] != moduleTypes[i] && !moduleTypes[i].isAssignableFrom(hostTypes[i])) {
                instructions.add(new ImmutableInstruction21c(Opcode.CHECK_CAST, register,
                        new ImmutableTypeReference(DexFieldDescriptor.getTypeSig(moduleTypes[i]))));
            }
            register += wordCount(hostTypes[i]);
        }
        instructions.add(new ImmutableInstruction3rc(Opcode.INVOKE_VIRTUAL_RANGE,
                2, 1 + parameterWords(moduleTypes), referenceMethod(new DexMethodDescriptor(dispatcher))));
        appendReturn(instructions, dispatcher.getReturnType(), host.getReturnType());
        return immutableMethod(host.getName(), hostTypes, host.getReturnType(),
                3 + parameterWords(hostTypes), instructions);
    }

    private static ImmutableMethod immutableMethod(String name, Class<?>[] types,
            Class<?> returnType, int registers, List<Instruction> instructions) {
        ArrayList<ImmutableMethodParameter> parameters = new ArrayList<>();
        for (int i = 0; i < types.length; i++) {
            parameters.add(new ImmutableMethodParameter(DexFieldDescriptor.getTypeSig(types[i]),
                    null, "p" + (i + 1)));
        }
        return new ImmutableMethod(PROXY_FRAGMENT_IMPL_TYPE, name, parameters,
                DexFieldDescriptor.getTypeSig(returnType), Modifier.PUBLIC, null, null,
                new ImmutableMethodImplementation(registers, instructions, null, null));
    }

    private static int wordCount(Class<?> type) {
        return type == long.class || type == double.class ? 2 : 1;
    }

    private static int parameterWords(Class<?>[] types) {
        int result = 0;
        for (Class<?> type : types) {
            result += wordCount(type);
        }
        return result;
    }

    private static void appendReturn(List<Instruction> instructions,
            Class<?> invokedType, Class<?> declaredType) {
        if (declaredType == void.class) {
            // In particular finishFragment(boolean): host returns Z, Java bridge V.
            instructions.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
            return;
        }
        if (invokedType == void.class) {
            if (declaredType == long.class || declaredType == double.class) {
                instructions.add(new ImmutableInstruction21s(Opcode.CONST_WIDE_16, 0, 0));
            } else {
                instructions.add(new ImmutableInstruction11n(Opcode.CONST_4, 0,
                        declaredType == boolean.class ? 1 : 0));
            }
        } else if (!invokedType.isPrimitive()) {
            instructions.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
            if (!declaredType.isAssignableFrom(invokedType)) {
                // Must precede return-object, not follow unreachable after it.
                instructions.add(new ImmutableInstruction21c(Opcode.CHECK_CAST, 0,
                        new ImmutableTypeReference(DexFieldDescriptor.getTypeSig(declaredType))));
            }
        } else if (wordCount(invokedType) == 2) {
            instructions.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE, 0));
        } else {
            instructions.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT, 0));
        }
        Opcode opcode = !declaredType.isPrimitive() ? Opcode.RETURN_OBJECT
                : wordCount(declaredType) == 2 ? Opcode.RETURN_WIDE : Opcode.RETURN;
        instructions.add(new ImmutableInstruction11x(opcode, 0));
    }

    private static ImmutableMethodReference referenceMethod(String declaringClass, String name, String descriptor) {
        return referenceMethod(new DexMethodDescriptor(declaringClass, name, descriptor));
    }

    private static ImmutableMethodReference referenceMethod(DexMethodDescriptor md) {
        return new ImmutableMethodReference(md.declaringClass, md.name, md.getParameterTypes(), md.getReturnType());
    }

    public static ImmutableFieldReference referenceField(String declaringClass, String name, String type) {
        return new ImmutableFieldReference(declaringClass, name, type);
    }
}
