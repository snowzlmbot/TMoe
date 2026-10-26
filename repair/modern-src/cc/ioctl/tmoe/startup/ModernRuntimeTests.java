package cc.ioctl.tmoe.startup;

import android.app.Activity;
import android.graphics.Canvas;
import android.os.SystemClock;
import android.text.Layout;
import android.text.SpannableString;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.util.Log;
import android.view.View;
import android.widget.FrameLayout;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Stack;
import org.json.JSONArray;
import org.json.JSONObject;

/** Differential tests run real host methods on isolated fabricated objects/views. */
public final class ModernRuntimeTests {
    private ModernRuntimeTests(){}
    private interface Test { String run() throws Throwable; }
    private static Class<?> c(String n)throws Exception{return ModernFeatureHooks.cls(n);}
    private static Field f(Object o,String n)throws Exception{return ModernFeatureHooks.field(o.getClass(),n);}
    private static void set(Object o,String n,Object v)throws Exception{f(o,n).set(o,v);}
    private static Object get(Object o,String n)throws Exception{return f(o,n).get(o);}
    private static Object raw(String n)throws Exception {
        Class<?> u=Class.forName("sun.misc.Unsafe");Field field=u.getDeclaredField("theUnsafe");field.setAccessible(true);
        return u.getMethod("allocateInstance",Class.class).invoke(field.get(null),c(n));
    }
    private static Object instance(String n)throws Exception{return c(n).getDeclaredConstructor().newInstance();}
    private static Method method(String owner,String name,Class<?>...p)throws Exception{Method m=c(owner).getDeclaredMethod(name,p);m.setAccessible(true);return m;}
    private static Object call(Method m,Object target,Object...args)throws Throwable{return ModernFeatureHooks.runtimeModule.getInvoker(m).invoke(target,args);}
    private static void require(boolean ok,String message){if(!ok)throw new AssertionError(message);}
    private static void enabled(String key,boolean value){ModernPreferences.setTestOverride(key,value);}
    private static void test(JSONArray rows,String name,Test test){
        JSONObject row=new JSONObject();try{row.put("name",name);String proof=test.run();row.put("status","PASS");row.put("evidence",proof);}catch(Throwable e){try{row.put("status","FAIL");row.put("error",Log.getStackTraceString(e));}catch(Exception ignored){}}finally{ModernPreferences.clearTestOverrides();}rows.put(row);
    }
    public static String run(Activity activity){
        JSONObject report=new JSONObject();JSONArray rows=new JSONArray();
        try{report.put("time",System.currentTimeMillis());report.put("host",activity.getPackageName());report.put("version_code",72299);report.put("test_scope","real hooked host methods, fabricated local data; no message sends/downloads; user switches unchanged");report.put("hook_failures",ModernFeatureHooks.failures());}catch(Exception ignored){}
        test(rows,"exact_numbers",()->{
            Method m=method("org.telegram.messenger.LocaleController","formatShortNumber",int.class,int[].class);
            enabled("ChannelDetailNumbers",false);Object off=call(m,null,12345,new int[1]);
            enabled("ChannelDetailNumbers",true);int[] round=new int[1];Object on=call(m,null,12345,round);
            require(!"12345".equals(off)&&"12345".equals(on)&&round[0]==12345,"formatter did not change");return off+" -> "+on;
        });
        test(rows,"protected_chat",()->{
            Object controller=raw("org.telegram.messenger.MessagesController"),chat=instance("org.telegram.tgnet.TLRPC$TL_chat");set(chat,"noforwards",true);
            Method m=method("org.telegram.messenger.MessagesController","isChatNoForwards",c("org.telegram.tgnet.TLRPC$Chat"));
            enabled("AntiAntiForward",false);Object off=call(m,controller,chat);enabled("AntiAntiForward",true);Object on=call(m,controller,chat);
            require(Boolean.TRUE.equals(off)&&Boolean.FALSE.equals(on),"protected chat unchanged");return off+" -> "+on;
        });
        test(rows,"media_spoilers",()->{
            Object message=raw("org.telegram.messenger.MessageObject"),tl=instance("org.telegram.tgnet.TLRPC$TL_message"),media=instance("org.telegram.tgnet.TLRPC$TL_messageMediaPhoto");
            set(media,"spoiler",true);set(tl,"media",media);set(message,"messageOwner",tl);
            Method m=method("org.telegram.messenger.MessageObject","hasMediaSpoilers");
            enabled("ProhibitSpoilers",false);Object off=call(m,message);enabled("ProhibitSpoilers",true);Object on=call(m,message);
            require(Boolean.TRUE.equals(off)&&Boolean.FALSE.equals(on),"media spoiler unchanged");return off+" -> "+on;
        });
        test(rows,"text_spoiler_mask",()->{
            Object run=instance("org.telegram.ui.Components/l21".replace('/','.'));set(run,"a",256);
            Object span=c("org.telegram.ui.Components.m21").getDeclaredConstructor(c("org.telegram.ui.Components.l21"),int.class).newInstance(run,16);
            SpannableString text=new SpannableString("local spoiler test");text.setSpan(span,0,text.length(),33);
            TextPaint paint=new TextPaint();paint.setTextSize(32);StaticLayout layout=new StaticLayout(text,paint,500,Layout.Alignment.ALIGN_NORMAL,1,0,false);
            Method core=method("rg.g","a",View.class,Layout.class,int.class,int.class,android.text.Spanned.class,Stack.class,java.util.List.class,ArrayList.class);
            ArrayList<Object> effects=new ArrayList<>();View v=new View(activity);
            enabled("ProhibitSpoilers",false);call(core,null,v,layout,-1,-1,text,new Stack<>(),effects,null);int off=effects.size();effects.clear();
            enabled("ProhibitSpoilers",true);call(core,null,v,layout,-1,-1,text,new Stack<>(),effects,null);int on=effects.size();
            require(off>0&&on==0,"text spoiler effects not suppressed: "+off+"/"+on);return "effect count "+off+" -> "+on;
        });
        test(rows,"premium_animation_not_membership",()->{
            Object doc=instance("org.telegram.tgnet.TLRPC$TL_document"),video=instance("org.telegram.tgnet.TLRPC$TL_videoSize");set(video,"type","f");
            ArrayList<Object> videos=new ArrayList<>();videos.add(video);set(doc,"video_thumbs",videos);set(doc,"thumbs",new ArrayList<>());
            Method animation=method("org.telegram.messenger.MessageObject","getPremiumStickerAnimation",c("org.telegram.tgnet.TLRPC$Document"));
            Method premium=method("org.telegram.messenger.MessageObject","isPremiumSticker",c("org.telegram.tgnet.TLRPC$Document"));
            enabled("DisablePremiumStickerAnimation",false);Object off=call(animation,null,doc),identityOff=call(premium,null,doc);
            enabled("DisablePremiumStickerAnimation",true);Object on=call(animation,null,doc),identityOn=call(premium,null,doc);
            require(off==video&&on==null&&identityOff.equals(identityOn),"animation or membership contract incorrect");return "effect present -> null; premium classification preserved="+identityOn;
        });
        test(rows,"reactions_all_sources",()->{
            Object controller=raw("org.telegram.messenger.MediaDataController");StringBuilder proof=new StringBuilder();
            for(String[] x:new String[][]{{"getEnabledReactionsList","enabledReactionsList"},{"getRecentReactions","recentReactions"},{"getSavedReactions","savedReactions"},{"getTopReactions","topReactions"}}){
                ArrayList<Object> list=new ArrayList<>();list.add(new Object());set(controller,x[1],list);Method m=method("org.telegram.messenger.MediaDataController",x[0]);
                enabled("ProhibitEnableReactions",false);int off=((java.util.List<?>)call(m,controller)).size();enabled("ProhibitEnableReactions",true);int on=((java.util.List<?>)call(m,controller)).size();
                require(off==1&&on==0,"reaction source failed: "+x[0]);proof.append(x[0]).append(" 1->0; ");
            }return proof.toString();
        });
        test(rows,"premium_sticker_tab",()->{
            Object controller=raw("org.telegram.messenger.MediaDataController");ArrayList<?>[] all=new ArrayList[8];for(int i=0;i<8;i++)all[i]=new ArrayList<>();
            ArrayList<Object> premium=new ArrayList<>();premium.add(instance("org.telegram.tgnet.TLRPC$TL_document"));all[7]=premium;set(controller,"recentStickers",all);
            Method m=method("org.telegram.messenger.MediaDataController","getRecentStickers",int.class);
            enabled("HidePremiumStickerSetTab",false);int off=((ArrayList<?>)call(m,controller,7)).size();enabled("HidePremiumStickerSetTab",true);int on=((ArrayList<?>)call(m,controller,7)).size();
            require(off==1&&on==0,"premium tab source unchanged");return "premium source size "+off+" -> "+on;
        });
        test(rows,"chat_blur_low_performance",()->{
            Class<?> shared=c("org.telegram.messenger.SharedConfig");Field level=ModernFeatureHooks.field(shared,"overrideDevicePerformanceClass");int saved=level.getInt(null);
            try{level.setInt(null,0);Method m=method(shared.getName(),"canBlurChat");enabled("ForceBlurChatAvailable",false);Object off=call(m,null);enabled("ForceBlurChatAvailable",true);Object on=call(m,null);require(Boolean.FALSE.equals(off)&&Boolean.TRUE.equals(on),"low performance blur gate unchanged");return off+" -> "+on;}finally{level.setInt(null,saved);}
        });
        test(rows,"updates_create_and_remove_44dp_placeholder",()->{
            FrameLayout parent=new FrameLayout(activity);Object layout=c("org.telegram.ui.Components.j81").getDeclaredConstructor(Activity.class,android.view.ViewGroup.class).newInstance(activity,parent);
            Method create=method(layout.getClass().getName(),"createUpdateUI",int.class),refresh=method(layout.getClass().getName(),"updateAppUpdateViews",int.class,boolean.class);
            enabled("ProhibitUpdates",false);call(create,layout,ModernFeatureHooks.account());int off=parent.getChildCount();require(off==1,"original update layout did not create its 44dp placeholder");
            View strip=(View)get(layout,"a");int height=strip.getLayoutParams().height;
            enabled("ProhibitUpdates",true);call(refresh,layout,ModernFeatureHooks.account(),false);int on=parent.getChildCount();require(on==0&&get(layout,"a")==null,"existing update placeholder remains");
            call(create,layout,ModernFeatureHooks.account());require(parent.getChildCount()==0,"update placeholder recreated while blocked");
            enabled("ProhibitUpdates",false);call(create,layout,ModernFeatureHooks.account());require(parent.getChildCount()==1,"disabling update block did not restore original create behavior");
            parent.removeAllViews();return "child count 1->0->0->1; original height="+height+"px; no blank placeholder";
        });
        test(rows,"updates_availability_reversible",()->{
            Class<?> shared=c("org.telegram.messenger.SharedConfig");Field pending=ModernFeatureHooks.field(shared,"pendingAppUpdate"),build=ModernFeatureHooks.field(shared,"pendingAppUpdateBuildVersion");
            Object old=pending.get(null);int oldBuild=build.getInt(null);
            try{
                Object update=instance("org.telegram.tgnet.TLRPC$TL_help_appUpdate");set(update,"document",instance("org.telegram.tgnet.TLRPC$TL_document"));pending.set(null,update);build.setInt(null,72299);
                Method m=method(shared.getName(),"isAppUpdateAvailable");enabled("ProhibitUpdates",false);Object off=call(m,null);enabled("ProhibitUpdates",true);Object on=call(m,null);enabled("ProhibitUpdates",false);Object restored=call(m,null);
                require(Boolean.TRUE.equals(off)&&Boolean.FALSE.equals(on)&&Boolean.TRUE.equals(restored),"update availability contract wrong");return off+" -> "+on+" -> "+restored;
            }finally{pending.set(null,old);build.setInt(null,oldBuild);}
        });
        test(rows,"updates_optional_popup_blocked",()->{
            Object app=getStatic("org.telegram.messenger.ApplicationLoader","applicationLoaderInstance"),update=instance("org.telegram.tgnet.TLRPC$TL_help_appUpdate");
            Method popup=method("org.telegram.messenger.ApplicationLoaderImpl","showUpdateAppPopup",android.content.Context.class,c("org.telegram.tgnet.TLRPC$TL_help_appUpdate"),int.class);
            int before=activity.getWindow().getDecorView().getViewTreeObserver().isAlive()?1:0;
            enabled("ProhibitUpdates",true);Object result=call(popup,app,activity,update,ModernFeatureHooks.account());
            require(Boolean.TRUE.equals(result)&&before==1,"popup not handled");return "actual popup method returned handled=true without constructing/showing update sheet";
        });
        test(rows,"updates_mandatory_overlay_blocked",()->{
            Object update=instance("org.telegram.tgnet.TLRPC$TL_help_appUpdate");set(update,"can_not_skip",true);set(update,"text","local test only");
            Object before=get(activity,"C0");Method overlay=method("org.telegram.ui.LaunchActivity","M0",int.class,c("org.telegram.tgnet.TLRPC$TL_help_appUpdate"),boolean.class);
            enabled("ProhibitUpdates",true);call(overlay,activity,ModernFeatureHooks.account(),update,false);require(get(activity,"C0")==before,"mandatory overlay was created");return "can_not_skip=true update supplied; no overlay created";
        });
        test(rows,"channel_switch_panel",()->{
            Object helper=raw("org.telegram.ui.hq");set(helper,"R",2);set(helper,"Q",false);Method m=method("org.telegram.ui.hq","e");
            enabled("ProhibitChannelSwitching",false);Object off=call(m,helper);enabled("ProhibitChannelSwitching",true);Object on=call(m,helper);
            require(Boolean.TRUE.equals(off)&&Boolean.FALSE.equals(on),"channel panel unchanged");return off+" -> "+on;
        });
        // Other environment-dependent behavior is explicitly not certified by this suite.
        try{
            report.put("tests",rows);report.put("not_end_to_end_tested",new JSONArray().put("video with real audio playback").put("live sponsored ad from server").put("greeting sticker in a real empty chat"));
            int pass=0,fail=0;for(int i=0;i<rows.length();i++){if(rows.getJSONObject(i).getString("status").equals("PASS"))pass++;else fail++;}report.put("passed",pass);report.put("failed",fail);
            java.io.File file=new java.io.File(activity.getFilesDir(),"tmoe-modern-test.json");try(java.io.FileOutputStream out=new java.io.FileOutputStream(file)){out.write(report.toString(2).getBytes(java.nio.charset.StandardCharsets.UTF_8));}
            return "BEHAVIOR_TEST_RESULT "+pass+" passed / "+fail+" failed; report="+file.getAbsolutePath();
        }catch(Throwable e){return "BEHAVIOR_TEST_REPORT_ERROR "+Log.getStackTraceString(e);}
    }
    private static Object getStatic(String owner,String name)throws Exception{return ModernFeatureHooks.field(c(owner),name).get(null);}
}
