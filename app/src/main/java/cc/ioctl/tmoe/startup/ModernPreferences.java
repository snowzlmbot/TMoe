package cc.ioctl.tmoe.startup;

import android.app.Application;
import android.content.SharedPreferences;
import android.util.Log;
import cc.ioctl.tmoe.util.HostInfo;
import cc.ioctl.tmoe.BuildConfig;

/** API102 configuration must not instantiate legacy IXposed/XC_MethodHook classes. */
public final class ModernPreferences {
    private ModernPreferences() {}
    private static SharedPreferences prefs() {
        Application app = HostInfo.getApplication();
        if (app == null) return null;
        return app.getSharedPreferences("tmoe_modern_api102", 0);
    }
    private static final ThreadLocal<java.util.Map<String, Boolean>> TEST_OVERRIDES = new ThreadLocal<>();
    public static void setTestOverride(String feature, boolean value) {
        if(!BuildConfig.VERIFICATION_ENABLED)throw new IllegalStateException("Verification flavor required");
        java.util.Map<String,Boolean> map = TEST_OVERRIDES.get();
        if (map == null) { map = new java.util.HashMap<>(); TEST_OVERRIDES.set(map); }
        map.put(feature, value);
    }
    public static void clearTestOverrides() { TEST_OVERRIDES.remove(); }
    public static boolean isEnabled(String feature) {
        java.util.Map<String,Boolean> map = TEST_OVERRIDES.get();
        if (map != null && map.containsKey(feature)) return map.get(feature);
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
