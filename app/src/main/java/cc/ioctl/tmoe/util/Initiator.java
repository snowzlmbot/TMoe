package cc.ioctl.tmoe.util;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

/**
 * Host class reference.
 */
public class Initiator {
    private static volatile ClassLoader sHostClassLoader;
    private static ClassLoader sPluginParentClassLoader = Initiator.class.getClassLoader();

    private Initiator() {
        throw new AssertionError("No instance for you!");
    }

    public static void initWithHostClassLoader(ClassLoader classLoader) {
        sHostClassLoader = classLoader;
        sPluginParentClassLoader = Initiator.class.getClassLoader();
    }

    public static ClassLoader getPluginClassLoader() {
        return Initiator.class.getClassLoader();
    }

    public static ClassLoader getHostClassLoader() {
        return sHostClassLoader;
    }

    @NonNull
    public static Class<?> loadClass(@NonNull String className) throws ClassNotFoundException {
        Class<?> clazz = load(className);
        if (clazz == null) {
            throw new ClassNotFoundException(className);
        }
        return clazz;
    }

    @Nullable
    public static Class<?> load(String className) {
        if (className == null || className.isEmpty()) {
            return null;
        }
        className = className.replace('/', '.');
        if (className.endsWith(";")) {
            if (className.charAt(0) == 'L') {
                className = className.substring(1, className.length() - 1);
            } else {
                className = className.substring(0, className.length() - 1);
            }
        }
        if (className.startsWith(".")) {
            className = HostInfo.getPackageName() + className;
        }
        Class<?> direct = loadDirect(className);
        if (direct != null) {
            return direct;
        }
        // Obfuscated aliases are tied to an exact package/version; never guess them.
        if (HostInfo.getApplication() == null) {
            return null;
        }
        for (String alias : HostSignatureRegistry.aliases(HostInfo.getPackageName(),
                HostInfo.getVersionCode(), className)) {
            Class<?> resolved = loadDirect(alias);
            if (resolved != null) {
                return resolved;
            }
        }
        return null;
    }

    @Nullable
    static Class<?> loadDirect(@NonNull String className) {
        ClassLoader host = sHostClassLoader;
        if (host != null) {
            try {
                return host.loadClass(className);
            } catch (ClassNotFoundException ignored) {
            }
        }
        ClassLoader plugin = sPluginParentClassLoader;
        if (plugin != null && plugin != host) {
            try {
                return plugin.loadClass(className);
            } catch (ClassNotFoundException ignored) {
            }
        }
        return null;
    }
}
