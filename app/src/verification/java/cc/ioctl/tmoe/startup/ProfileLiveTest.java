package cc.ioctl.tmoe.startup;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import org.json.JSONObject;

/** Explicit operator-triggered test on the local account's own native Profile. */
public final class ProfileLiveTest {
    private ProfileLiveTest(){}
    private static JSONObject report;
    private static Class<?> c(String n)throws Exception{return ModernFeatureHooks.cls(n);}
    private static Object get(Object o,String n)throws Exception{return ModernFeatureHooks.field(o.getClass(),n).get(o);}
    private static Method method(Class<?> owner,String n,Class<?>...p)throws Exception{Method m=owner.getMethod(n,p);m.setAccessible(true);return m;}
    private static void check(boolean pass,String key)throws Exception{report.put(key,pass);if(!pass)throw new AssertionError(key);}
    private static void write(Activity a,Throwable e){
        try{if(e!=null){report.put("status","FAIL");report.put("error",android.util.Log.getStackTraceString(e));}else report.put("status","PASS");report.put("actual_id_recorded",false);java.io.File file=new java.io.File(a.getFilesDir(),"tmoe-profile-live-test.json");try(java.io.FileOutputStream out=new java.io.FileOutputStream(file)){out.write(report.toString(2).getBytes(java.nio.charset.StandardCharsets.UTF_8));}android.util.Log.i("TMoe-ID","LIVE_PROFILE_TEST "+report.getString("status"));}catch(Throwable x){android.util.Log.e("TMoe-ID","write live test",x);}
    }
    public static void openAndTest(Activity a){
        report=new JSONObject();
        try{
            report.put("time",System.currentTimeMillis());report.put("scope","own native profile only; ID value and prior clipboard never logged");
            check(ModernPreferences.isEnabled("ShowIdInProfile"),"persistent_switch_enabled");
            int account=ModernFeatureHooks.account();Object config=c("org.telegram.messenger.UserConfig").getMethod("getInstance",int.class).invoke(null,account);
            long self=((Number)config.getClass().getMethod("getClientUserId").invoke(config)).longValue();check(self>0,"cached_self_id_present");
            Bundle args=new Bundle();args.putLong("user_id",self);
            Object profile=c("org.telegram.ui.ProfileActivity").getConstructor(Bundle.class).newInstance(args);
            profile.getClass().getMethod("setCurrentAccount",int.class).invoke(profile,account);
            Object top=method(a.getClass(),"R").invoke(a);check(top!=null,"native_navigation_parent_present");
            boolean presented=(Boolean)method(top.getClass(),"presentFragment",c("org.telegram.ui.ActionBar.r2")).invoke(top,profile);
            check(presented,"own_profile_presented");
            new Handler(Looper.getMainLooper()).postDelayed(()->runOnVisible(a,profile,self,0),1400);
        }catch(Throwable e){write(a,e);}
    }
    private static void runOnVisible(Activity a,Object p,long self,int attempt){
        try{
            check(((Number)get(p,"e1")).longValue()==self,"profile_matches_cached_self");
            check(Long.toString(self).equals(ModernProfileIds.id(p)),"resolver_matches_cached_self");
            Object adapter=get(p,"d");ModernProfileIds.Row row=ModernProfileIds.rowForAdapter(adapter);check(row!=null,"id_row_allocated");
            ViewGroup list=(ViewGroup)get(p,"a");
            View cell=findCell(list,row.value);
            if(cell==null&&attempt<4){
                try{list.getClass().getMethod("scrollToPosition",int.class).invoke(list,row.index);}catch(Throwable ignored){}
                new Handler(Looper.getMainLooper()).postDelayed(()->runOnVisible(a,p,self,attempt+1),500);return;
            }
            check(cell!=null&&cell.isShown(),"native_id_cell_visible");
            int instances=countCells(list,row.value);check(instances==1,"one_id_cell_before_refresh");
            check(cell.getContentDescription()!=null&&cell.getContentDescription().toString().contains(Long.toString(self)),"native_label_contains_correct_self_id");
            ClipboardManager clipboard=a.getSystemService(ClipboardManager.class);
            ClipData prior=clipboard==null?null:clipboard.getPrimaryClip();boolean copyMatched=false;
            try{
                check(cell.performClick(),"real_cell_click_consumed");
                ClipData now=clipboard.getPrimaryClip();copyMatched=now!=null&&now.getItemCount()>0&&Long.toString(self).contentEquals(now.getItemAt(0).coerceToText(a));
                check(copyMatched,"real_click_copied_exact_self_id");
            }finally{if(clipboard!=null){if(prior!=null)clipboard.setPrimaryClip(prior);else clipboard.clearPrimaryClip();}report.put("previous_clipboard_restored",true);}
            Method refresh=method(p.getClass(),"j5");int n=((Number)get(p,"N2")).intValue(),index=row.index;
            ModernFeatureHooks.runtimeModule.getInvoker(refresh).invoke(p);int first=((Number)get(p,"N2")).intValue();
            ModernFeatureHooks.runtimeModule.getInvoker(refresh).invoke(p);int second=((Number)get(p,"N2")).intValue();
            check(n==first&&first==second,"rebuild_twice_no_row_count_growth");
            ModernProfileIds.Row after=ModernProfileIds.rowForAdapter(adapter);check(after!=null&&after.index==index,"id_index_stable_after_rebuild");
            check(Long.toString(self).equals(after.value),"id_value_stable_after_rebuild");
            ModernPreferences.setTestOverride("ShowIdInProfile",false);
            int disabled;
            try{ModernFeatureHooks.runtimeModule.getInvoker(refresh).invoke(p);disabled=((Number)get(p,"N2")).intValue();check(ModernProfileIds.rowForAdapter(adapter)==null,"disabled_removes_id_row");}
            finally{ModernPreferences.clearTestOverrides();}
            ModernFeatureHooks.runtimeModule.getInvoker(refresh).invoke(p);check(((Number)get(p,"N2")).intValue()==disabled+1,"enabled_restores_one_id_row");
            adapter.getClass().getMethod("l").invoke(adapter);
            report.put("clipboard_value_recorded",false);report.put("native_row_type","Cells.c9");
            write(a,null);
        }catch(Throwable e){ModernPreferences.clearTestOverrides();write(a,e);}
    }
    private static View findCell(ViewGroup list,String value){for(int i=0;i<list.getChildCount();i++){View v=list.getChildAt(i);CharSequence desc=v.getContentDescription();if(desc!=null&&desc.toString().startsWith("用户ID "+value+"，"))return v;}return null;}
    private static int countCells(ViewGroup list,String value){int n=0;for(int i=0;i<list.getChildCount();i++){CharSequence desc=list.getChildAt(i).getContentDescription();if(desc!=null&&desc.toString().startsWith("用户ID "+value+"，"))n++;}return n;}
}
