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
    private static final ThreadLocal<java.util.Map<String, Boolean>> TEST_OVERRIDES = new ThreadLocal<>();
    public static void setTestOverride(String feature, boolean value) {
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
    /** Calls only a pure formatting method: no account, network or chat mutation. */
    public static String selfTest() {
        try {
            Application app = HostInfo.getApplication();
            Class<?> formatter = app.getClassLoader().loadClass("org.telegram.messenger.LocaleController");
            java.lang.reflect.Method method = formatter.getDeclaredMethod("formatShortNumber", int.class, int[].class);
            method.setAccessible(true);
            int[] rounded = new int[1];
            String formatted = String.valueOf(method.invoke(null, 12345, rounded));
            boolean enabled = isEnabled("ChannelDetailNumbers");
            boolean pass = enabled ? "12345".equals(formatted) && rounded[0] == 12345 : !"12345".equals(formatted);
            String report = "显示精确人数=" + enabled + "；12345 → " + formatted + "；" + (pass ? "通过" : "未通过");
            Log.i("TMoe-UI", "SELF_TEST " + report);
            return report;
        } catch (Throwable e) {
            Log.e("TMoe-UI", "SELF_TEST failed", e);
            return "自检异常：" + e.getClass().getSimpleName();
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
