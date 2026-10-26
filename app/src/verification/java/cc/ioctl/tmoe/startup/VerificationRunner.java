package cc.ioctl.tmoe.startup;

import android.app.Activity;
import android.app.KeyguardManager;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.reflect.Method;
import io.github.libxposed.api.XposedModule;

/** Included only in the verification flavor. Runs only on explicit local intent. */
public final class VerificationRunner {
    private VerificationRunner(){}
    private static String lastNonce="";
    public static void install(XposedModule module,ClassLoader loader)throws Exception{
        Method resume=Activity.class.getDeclaredMethod("onPostResume");
        module.hook(resume).setId("tmoe.verification.explicit").intercept(chain->{
            Object result=chain.proceed();Activity a=(Activity)chain.getThisObject();
            if(!a.getClass().getName().equals("org.telegram.ui.LaunchActivity"))return result;
            String nonce=a.getIntent().getStringExtra("tmoe_selftest_nonce");
            if(nonce==null||nonce.isEmpty()||nonce.equals(lastNonce))return result;
            lastNonce=nonce;a.getIntent().removeExtra("tmoe_selftest_nonce");
            new Handler(Looper.getMainLooper()).postDelayed(()->{
                KeyguardManager guard=a.getSystemService(KeyguardManager.class);
                if(guard!=null&&guard.isKeyguardLocked()){Log.w("TMoe-Verification","explicit test refused while locked");return;}
                if(nonce.startsWith("profile-live:"))ProfileLiveTest.openAndTest(a);
                else Log.i("TMoe-TEST",ModernRuntimeTests.run(a));
            },800);
            return result;
        });
    }
}
