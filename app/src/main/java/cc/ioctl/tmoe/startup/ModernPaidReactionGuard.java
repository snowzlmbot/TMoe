package cc.ioctl.tmoe.startup;

import android.os.Looper;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;
import io.github.libxposed.api.XposedInterface;
import io.github.libxposed.api.XposedModule;

/**
 * Paid-reaction boundary for Telegram 72299, classes4.dex (DexSQL 0.1.1).
 * d0/18882 creates or extends a queue AND reserves Stars; returning null before
 * its body is safe: ko.eb and voip.g.run null-check, other callers ignore it.
 * a6.b/18805 submits independently of SendMessagesHelper.sendReaction.
 * a6.a/18804 is the native Undo: it subtracts h, restores the chosen flag g,
 * releases h from b6.g, notifies observers, and clears b6.B by identity.
 *
 * i = committed/request started (NOT server success), j = cancelled,
 * l = locally applied/reserved, h = total amount, k = deferred unapplied amount.
 * Calling a() with l=false, or twice, can corrupt accounting. Unknown states
 * therefore suppress submission but report failure, rather than invent Undo.
 * No network request, account balance write, or synthetic callback is made here.
 */
public final class ModernPaidReactionGuard {
    private static final String FEATURE = "ProhibitEnableReactions";
    private static final String TARGET = "paid-reaction-72299";
    private static final Set<ClassLoader> INSTALLED =
            Collections.newSetFromMap(new WeakHashMap<ClassLoader, Boolean>());

    private ModernPaidReactionGuard() {}

    /** Pure accounting precondition; the caller also checks identity and UI thread. */
    public static boolean shouldCancel(boolean committed, boolean cancelled,
            boolean locallyApplied, long amount, long deferred, long reserved) {
        return !committed && !cancelled && locallyApplied
                && amount > 0 && amount <= Integer.MAX_VALUE
                && deferred == 0 && reserved >= amount;
    }

    public static synchronized void install(XposedModule api, ClassLoader loader) {
        if (INSTALLED.contains(loader)) return;
        try {
            Class<?> queue = Class.forName("vg.a6", false, loader);
            Class<?> controller = Class.forName("vg.b6", false, loader);
            Class<?> message = Class.forName("org.telegram.messenger.MessageObject", false, loader);
            Class<?> chat = Class.forName("org.telegram.ui.ko", false, loader);
            Method submit = exact(queue, "b", void.class);
            Method create = exact(controller, "d0", queue, message, chat,
                    long.class, boolean.class, boolean.class, Long.class);

            // Even an unprovable rollback must NOT fall through to b()/sendRequest.
            Rollback resolved = null;
            try {
                resolved = new Rollback(api, queue, controller, message);
            } catch (Throwable error) {
                fail("rollback-contract", error);
            }
            final Rollback rollback = resolved;
            api.hook(submit).setId("tmoe.72299.reactions.paid.submit")
                    .setExceptionMode(XposedInterface.ExceptionMode.PROTECTIVE)
                    .intercept(chain -> {
                        if (!blocked()) return chain.proceed();
                        // Catch INSIDE the protective hook: throwing would let the
                        // framework run the paid original as a protective fallback.
                        try {
                            if (rollback == null) {
                                fail("rollback-unavailable", new IllegalStateException("Submission suppressed"));
                            } else {
                                rollback.cancelIfSafe(chain.getThisObject());
                            }
                        } catch (Throwable error) {
                            fail("rollback", error);
                        }
                        return null;
                    });
            ModernFeatureCatalog.hooked(FEATURE, "vg.a6.b()V [18805]");
            api.hook(create).setId("tmoe.72299.reactions.paid.create")
                    .setExceptionMode(XposedInterface.ExceptionMode.PROTECTIVE)
                    .intercept(chain -> blocked() ? null : chain.proceed());
            ModernFeatureCatalog.hooked(FEATURE,
                    "vg.b6.d0(MessageObject,ko,long,boolean,boolean,Long):a6 [18882]");
            // Deoptimize boundaries and every defined direct caller across all DEXes.
            deoptimize(api, submit);
            deoptimize(api, create);
            if (rollback != null) deoptimize(api, rollback.cancel);
            deoptimizeCallers(api, loader, message, chat);
            INSTALLED.add(loader);
        } catch (Throwable error) {
            fail("install", error);
        }
    }

    private static boolean blocked() {
        try {
            return ModernPreferences.isEnabled(FEATURE);
        } catch (Throwable error) {
            fail("preference", error);
            return true;
        }
    }

    private static final class Rollback {
        final Method cancel;
        final XposedInterface.Invoker<?, Method> original;
        final Field committed, cancelled, applied, amount, deferred;
        final Field owner, message, active, reserved, bulletin, pending;
        final Set<Object> attempted = Collections.newSetFromMap(new WeakHashMap<Object, Boolean>());

        Rollback(XposedModule api, Class<?> queue, Class<?> controller, Class<?> mo)
                throws Exception {
            cancel = exact(queue, "a", void.class);
            committed = checked(queue, "i", boolean.class);
            cancelled = checked(queue, "j", boolean.class);
            applied = checked(queue, "l", boolean.class);
            amount = checked(queue, "h", long.class);
            deferred = checked(queue, "k", long.class);
            checked(queue, "g", boolean.class); // chosen state restored by native Undo
            owner = checked(queue, "q", controller);
            message = checked(queue, "b", mo);
            active = checked(controller, "B", queue);
            reserved = checked(controller, "g", long.class); // reservation, not balance
            bulletin = checked(queue, "d", Class.forName("org.telegram.ui.Components.qc", false, queue.getClassLoader()));
            pending = checked(queue, "p", Class.forName("vg.y5", false, queue.getClassLoader()));
            original = api.getInvoker(cancel).setType(XposedInterface.Invoker.Type.ORIGIN);
            if (original == null) throw new IllegalStateException("No original Undo invoker");
        }

        void cancelIfSafe(Object queue) throws Throwable {
            if (queue == null) throw new IllegalStateException("Missing paid queue");
            synchronized (queue) {
                // Never invoke the non-idempotent Undo on sent/cancelled objects.
                if (committed.getBoolean(queue) || cancelled.getBoolean(queue)) return;
                synchronized (attempted) {
                    if (attempted.contains(queue)) return;
                }
                Object controller = owner.get(queue);
                if (controller == null || active.get(controller) != queue
                        || message.get(queue) == null || bulletin.get(queue) == null
                        || pending.get(queue) == null
                        || Looper.myLooper() != Looper.getMainLooper()
                        || Looper.getMainLooper() == null
                        || !shouldCancel(committed.getBoolean(queue), cancelled.getBoolean(queue),
                                applied.getBoolean(queue), amount.getLong(queue),
                                deferred.getLong(queue), reserved.getLong(controller))) {
                    throw new IllegalStateException("Cannot prove paid Undo accounting; submission suppressed");
                }
                // A partially throwing native Undo must not be retried either.
                synchronized (attempted) { attempted.add(queue); }
                original.invoke(queue);
                if (!cancelled.getBoolean(queue) || active.get(controller) == queue) {
                    throw new IllegalStateException("Native Undo did not finish; submission suppressed");
                }
            }
        }
    }

    private static Method exact(Class<?> owner, String name, Class<?> returns,
            Class<?>... parameters) throws ReflectiveOperationException {
        Method method = owner.getDeclaredMethod(name, parameters);
        if (method.getReturnType() != returns || Modifier.isStatic(method.getModifiers())) {
            throw new NoSuchMethodException(owner.getName() + "." + name + " contract");
        }
        method.setAccessible(true);
        return method;
    }

    private static Field checked(Class<?> owner, String name, Class<?> type)
            throws ReflectiveOperationException {
        Field field = ModernFeatureHooks.field(owner, name);
        if (field.getDeclaringClass() != owner || field.getType() != type
                || Modifier.isStatic(field.getModifiers())) {
            throw new NoSuchFieldException(owner.getName() + "." + name + " contract");
        }
        return field;
    }

    private static void deoptimize(XposedModule api, Method method) {
        try {
            if (!api.deoptimize(method)) {
                throw new IllegalStateException("Deoptimization rejected: " + method);
            }
        } catch (Throwable error) {
            fail("deoptimize:" + method.getDeclaringClass().getName() + "." + method.getName(), error);
        }
    }

    private static void deoptimizeCallers(XposedModule api, ClassLoader loader,
            Class<?> message, Class<?> chat) {
        for (String owner : new String[]{"cf.q2", "vg.f5", "vg.y5", "vg.z5",
                "org.telegram.messenger.voip.g", "v2.d0"}) {
            deoptimizeCaller(api, loader, owner, "run");
        }
        deoptimizeCaller(api, loader, "vg.i4", "a");
        deoptimizeCaller(api, loader, "vg.i4", "d", float.class, float.class, boolean.class);
        try {
            Class<?> view = Class.forName("android.view.View", false, loader);
            Class<?> cell = Class.forName("org.telegram.ui.Cells.c0", false, loader);
            Class<?> count = Class.forName("org.telegram.tgnet.TLRPC$ReactionCount", false, loader);
            Class<?> box = Class.forName("org.telegram.ui.Components.yl0", false, loader);
            Class<?> reaction = Class.forName("vf.p0", false, loader);
            deoptimizeCaller(api, loader, chat.getName(), "Z7", cell, count,
                    boolean.class, float.class, float.class);
            deoptimizeCaller(api, loader, chat.getName(), "eb", view, message, box, view,
                    float.class, float.class, reaction, boolean.class, boolean.class,
                    boolean.class, boolean.class);
        } catch (Throwable error) {
            fail("deoptimize:chat-callers", error);
        }
    }

    private static void deoptimizeCaller(XposedModule api, ClassLoader loader,
            String owner, String name, Class<?>... parameters) {
        try {
            deoptimize(api, exact(Class.forName(owner, false, loader), name, void.class, parameters));
        } catch (Throwable error) {
            fail("deoptimize:" + owner + "." + name, error);
        }
    }

    private static void fail(String stage, Throwable error) {
        // Diagnostics must never throw through a PROTECTIVE paid-send hook.
        try {
            ModernFeatureCatalog.fail(FEATURE, TARGET + ":" + stage, error);
        } catch (Throwable ignored) {
            // Remain closed even if logging itself is unavailable.
        }
    }
}
