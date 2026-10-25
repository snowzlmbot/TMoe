package cc.ioctl.tmoe.startup;

import android.app.Application;
import android.content.SharedPreferences;
import android.util.Log;
import cc.ioctl.tmoe.util.HostInfo;

/** API102 configuration must not instantiate legacy IXposed/XC_MethodHook classes. */
public final class ModernPreferences {
    private ModernPreferences() {}
    private static SharedPreferences prefs() {
        Application app = HostInfo.getApplication();
        if (app == null) return null;
        return app.getSharedPreferences("tmoe_modern_api102", 0);
    }
    public static boolean isEnabled(String feature) {
        try {
            SharedPreferences p = prefs();
            return p != null && p.getBoolean(feature + ".enabled", false);
        } catch (Throwable e) {
            Log.e("TMoe-UI", "Modern preference read failed", e);
            return false;
        }
    }
    public static boolean setEnabled(String feature, boolean value) {
        try {
            SharedPreferences p = prefs();
            return p != null && p.edit().putBoolean(feature + ".enabled", value).commit();
        } catch (Throwable e) {
            Log.e("TMoe-UI", "Modern preference write failed", e);
            return false;
        }
    }
}
