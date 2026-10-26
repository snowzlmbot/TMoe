package cc.ioctl.tmoe.startup;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Switch;
import org.json.JSONObject;

/** Verification-only real navigation and source-built setting widgets. */
final class SourceUiTest {
    static void run(Activity activity){
        JSONObject report=new JSONObject();
        try{
            Object top=activity.getClass().getMethod("R").invoke(activity);
            cc.ioctl.tmoe.fragment.ModernSettingsFragment page=new cc.ioctl.tmoe.fragment.ModernSettingsFragment();
            Object proxy=page.getProxyObject();
            boolean result=(Boolean)top.getClass().getMethod("presentFragment",ModernFeatureHooks.cls("org.telegram.ui.ActionBar.r2")).invoke(top,proxy);
            report.put("presented",result);report.put("time",System.currentTimeMillis());
            new Handler(Looper.getMainLooper()).postDelayed(()->{
                try{
                    View root=(View)ModernFeatureHooks.field(proxy.getClass(),"fragmentView").get(proxy);if(root==null||!root.isShown())throw new AssertionError("source settings not visible");
                    int[] count={0,0};widgets(root,count);report.put("visible",true);report.put("switches",count[0]);report.put("enabled_switches",count[1]);
                    if(count[0]!=13||count[1]!=13)throw new AssertionError("feature targets not completely supported "+ModernFeatureCatalog.errors());
                    report.put("all_targets",ModernFeatureCatalog.errors());report.put("status","PASS");
                }catch(Throwable e){try{report.put("status","FAIL");report.put("error",android.util.Log.getStackTraceString(e));}catch(Exception ignored){}}
                write(activity,report);
            },1000);
        }catch(Throwable e){try{report.put("status","FAIL");report.put("error",android.util.Log.getStackTraceString(e));}catch(Exception ignored){}write(activity,report);}
    }
    private static void widgets(View view,int[] out){if(view instanceof Switch){out[0]++;if(view.isEnabled())out[1]++;}if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)widgets(group.getChildAt(i),out);}}
    private static void write(Activity a,JSONObject report){try(java.io.FileOutputStream output=new java.io.FileOutputStream(new java.io.File(a.getFilesDir(),"tmoe-source-ui-test.json"))){output.write(report.toString(2).getBytes(java.nio.charset.StandardCharsets.UTF_8));}catch(Throwable e){android.util.Log.e("TMoe-Verification","write ui result",e);}}
}
