package cc.ioctl.tmoe.startup;

import android.app.Activity;
import android.util.Log;
import cc.ioctl.tmoe.BuildConfig;
import io.github.libxposed.api.XposedModule;

/** Optional verification flavor only; production APK has no account/clipboard test. */
final class ModernVerification {
    private ModernVerification(){}
    static void install(XposedModule module,ClassLoader loader){
        if(!BuildConfig.VERIFICATION_ENABLED)return;
        try{Class<?> test=Class.forName("cc.ioctl.tmoe.startup.VerificationRunner");test.getMethod("install",XposedModule.class,ClassLoader.class).invoke(null,module,loader);}
        catch(Throwable e){Log.e("TMoe-Verification","verification flavor unavailable",e);}
    }
    static String run(Activity activity){
        if(!BuildConfig.VERIFICATION_ENABLED)return "生产版不包含账号/剪贴板验收代码；请使用验证变体";
        try{return (String)Class.forName("cc.ioctl.tmoe.startup.ModernRuntimeTests").getMethod("run",Activity.class).invoke(null,activity);}
        catch(Throwable e){Log.e("TMoe-Verification","test failed",e);return "验证异常："+e.getClass().getSimpleName();}
    }
}
