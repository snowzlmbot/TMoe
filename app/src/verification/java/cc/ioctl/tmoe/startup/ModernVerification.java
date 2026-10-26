package cc.ioctl.tmoe.startup;

import android.app.Activity;
import io.github.libxposed.api.XposedModule;

/** Test-only flavor implementation; no reflection strings in the production APK. */
public final class ModernVerification {
    private ModernVerification(){}
    static void install(XposedModule module,ClassLoader loader){
        try{VerificationRunner.install(module,loader);}catch(Throwable e){android.util.Log.e("TMoe-Verification","install",e);}
    }
    public static String run(Activity activity){return ModernRuntimeTests.run(activity);}
}
