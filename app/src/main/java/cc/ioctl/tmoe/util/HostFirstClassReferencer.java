package cc.ioctl.tmoe.util;

import android.content.Context;

public class HostFirstClassReferencer extends ClassLoader {

    private static final ClassLoader BOOTSTRAP = Context.class.getClassLoader();
    private final ClassLoader mHostReferencer;

    public HostFirstClassReferencer() {
        super(BOOTSTRAP);
        mHostReferencer = Initiator.getHostClassLoader();
    }

    @Override
    protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
        // Keep module interfaces and dispatchers in the module's defining loader.
        // Host loaders may contain another copy of TMoe (or reject module names).
        ClassLoader plugin = HostFirstClassReferencer.class.getClassLoader();
        if (name.startsWith("cc.ioctl.tmoe.") && plugin != null) {
            return plugin.loadClass(name);
        }
        if (BOOTSTRAP != null) {
            try {
                return BOOTSTRAP.loadClass(name);
            } catch (ClassNotFoundException ignored) {
            }
        }
        if (mHostReferencer != null) {
            try {
                return mHostReferencer.loadClass(name);
            } catch (ClassNotFoundException ignored) {
            }
        }
        if (plugin != null) {
            return plugin.loadClass(name);
        }
        throw new ClassNotFoundException(name);
    }
}
