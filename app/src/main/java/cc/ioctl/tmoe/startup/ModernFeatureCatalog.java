package cc.ioctl.tmoe.startup;

import android.util.Log;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

/** Installed-target health is separate from user preferences and test coverage. */
public final class ModernFeatureCatalog {
    private ModernFeatureCatalog(){}
    private static final Map<String,ArrayList<String>> targets=new LinkedHashMap<>();
    private static final Map<String,ArrayList<String>> failures=new LinkedHashMap<>();
    public static synchronized void hooked(String feature,String target){targets.computeIfAbsent(feature,k->new ArrayList<>()).add(target);}
    public static synchronized void fail(String feature,String target,Throwable e){failures.computeIfAbsent(feature,k->new ArrayList<>()).add(target+": "+e.getClass().getSimpleName());Log.e("TMoe-Health",feature+" target failed: "+target,e);}
    public static synchronized boolean available(String feature){return targets.containsKey(feature)&&!failures.containsKey(feature);}
    public static synchronized String summary(String feature){
        if(failures.containsKey(feature))return "适配失败，开关禁用："+failures.get(feature);
        if(!targets.containsKey(feature))return "未安装适配目标，开关禁用";
        return "目标已安装 "+targets.get(feature).size()+" 项；这不等同于端到端验收";
    }
    public static synchronized String errors(){return failures.toString();}
}
