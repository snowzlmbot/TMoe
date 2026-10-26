package cc.ioctl.tmoe.startup;

import android.app.Activity;
import io.github.libxposed.api.XposedModule;

/** Production bridge is deliberately inert and references no verification classes. */
public final class ModernVerification {
    private ModernVerification(){}
    static void install(XposedModule module,ClassLoader loader){}
    public static String run(Activity activity){return "生产版不包含行为测试工具";}
}
