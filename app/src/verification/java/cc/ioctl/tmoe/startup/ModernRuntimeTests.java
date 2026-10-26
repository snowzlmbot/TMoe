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
        test(rows,"feature_target_health",()->{
            String[] keys={"ShowIdInProfile","ProhibitUpdates","AntiAntiForward","HideSponsoredMsg","ProhibitSpoilers","ForceBlurChatAvailable","ChannelDetailNumbers","DisablePremiumStickerAnimation","ProhibitEnableReactions","HidePremiumStickerSetTab","ProhibitChatGreetings","KeepVideoMuted","ProhibitChannelSwitching"};
            for(String key:keys)require(ModernFeatureCatalog.available(key),key+": "+ModernFeatureCatalog.summary(key));
            require(ModernFeatureCatalog.errors().equals("{}"),ModernFeatureCatalog.errors());return "13 feature families fully resolved; hook-registration health only, separate from behavior cases";
        });
        test(rows,"source_dynamic_fragment_verifier",()->{
            Object proxy=new cc.ioctl.tmoe.fragment.ModernSettingsFragment().getProxyObject();
            require(c("org.telegram.ui.ActionBar.r2").isInstance(proxy),"source proxy is not host BaseFragment");
            proxy.getClass().getMethod("startActivityForResult$super",android.content.Intent.class,int.class);
            proxy.getClass().getMethod("onRequestPermissionsResultFragment",int.class,String[].class,int[].class);
            return "source-generated DEX instantiated; object+primitive and array callback descriptors verified by ART";
        });
        test(rows,"video_volume_autoplay_boundary",()->{
            try(VerificationVideoFixture fixture=new VerificationVideoFixture(activity)){
                enabled("KeepVideoMuted",false);Object off=fixture.invoke();require(Boolean.TRUE.equals(off)&&fixture.playbackCalls==1,"original video path never reached playMessage");
                enabled("KeepVideoMuted",true);Object on=fixture.invoke();require(Boolean.FALSE.equals(on)&&fixture.playbackCalls==1,"enabled still entered video playback");
                enabled("KeepVideoMuted",false);Object restored=fixture.invoke();require(Boolean.TRUE.equals(restored)&&fixture.playbackCalls==2,"video path did not restore");return "actual ko.R9 -> MediaController.playMessage sink 1->0->1; no audio/video file played";
            }
        });
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
            set(update,"document",instance("org.telegram.tgnet.TLRPC$TL_document"));set(update,"version","99.99-local-test");set(update,"text","Local test: no download requested");
            long before=ModernFeatureHooks.updatePopupConstructions;
            android.app.Dialog created=null;
            try{
                enabled("ProhibitUpdates",false);call(popup,app,activity,update,ModernFeatureHooks.account());created=ModernFeatureHooks.lastUpdatePopup.get();
                require(ModernFeatureHooks.updatePopupConstructions==before+1&&created!=null&&created.isShowing(),"original popup was not visible");
                enabled("ProhibitUpdates",true);ModernFeatureHooks.onToggleChanged("ProhibitUpdates");require(!created.isShowing(),"enabling did not close existing update popup");Object result=call(popup,app,activity,update,ModernFeatureHooks.account());
                require(Boolean.TRUE.equals(result)&&ModernFeatureHooks.updatePopupConstructions==before+1&&!created.isShowing(),"popup still created while enabled");
                enabled("ProhibitUpdates",false);call(popup,app,activity,update,ModernFeatureHooks.account());created=ModernFeatureHooks.lastUpdatePopup.get();
                require(ModernFeatureHooks.updatePopupConstructions==before+2&&created!=null&&created.isShowing(),"popup did not restore");
                return "real update sheet visible -> no construction -> visible; dismissed, no download clicked";
            }finally{if(created!=null&&created.isShowing())created.getClass().getMethod("dismissInternal").invoke(created);}
        });
        test(rows,"updates_mandatory_overlay_blocked",()->{
            Object update=instance("org.telegram.tgnet.TLRPC$TL_help_appUpdate");set(update,"can_not_skip",true);set(update,"text","local test only");
            Object before=get(activity,"C0");require(before==null,"existing mandatory update view: skip destructive synthetic test");
            Method overlay=method("org.telegram.ui.LaunchActivity","M0",int.class,c("org.telegram.tgnet.TLRPC$TL_help_appUpdate"),boolean.class);
            View created=null;android.view.ViewGroup parent=null;
            try{
                enabled("ProhibitUpdates",false);call(overlay,activity,ModernFeatureHooks.account(),update,false);created=(View)get(activity,"C0");
                require(created!=null&&created.getVisibility()==View.VISIBLE,"original mandatory overlay not shown");parent=(android.view.ViewGroup)created.getParent();
                enabled("ProhibitUpdates",true);ModernFeatureHooks.onToggleChanged("ProhibitUpdates");require(created.getVisibility()==View.GONE,"enabling did not hide existing mandatory overlay");
                enabled("ProhibitUpdates",false);ModernFeatureHooks.onToggleChanged("ProhibitUpdates");require(created.getVisibility()==View.VISIBLE,"disabling did not restore mandatory overlay");
                created.setVisibility(View.GONE);parent.removeView(created);set(activity,"C0",null);
                enabled("ProhibitUpdates",true);call(overlay,activity,ModernFeatureHooks.account(),update,false);require(get(activity,"C0")==null,"mandatory overlay created while blocked");
                return "existing mandatory overlay VISIBLE->GONE->VISIBLE by switch; enabled prevents creation; host state restored";
            }finally{Object current=get(activity,"C0");if(current instanceof View){View v=(View)current;v.setVisibility(View.GONE);if(v.getParent() instanceof android.view.ViewGroup)((android.view.ViewGroup)v.getParent()).removeView(v);}set(activity,"C0",before);}
        });
        test(rows,"sponsored_cached_model",()->{
            Object controller=raw("org.telegram.messenger.MessagesController"),map=instance("z.f");
            Object info=c("org.telegram.messenger.MessagesController$SponsoredMessagesInfo").getDeclaredConstructor(c("org.telegram.messenger.MessagesController")).newInstance(controller);
            set(info,"loading",false);set(info,"loadTime",SystemClock.elapsedRealtime());
            c("z.f").getDeclaredMethod("k",Object.class,long.class).invoke(map,info,54321L);set(controller,"sponsoredMessages",map);
            Method getter=method("org.telegram.messenger.MessagesController","getSponsoredMessages",long.class);
            enabled("HideSponsoredMsg",false);Object off=call(getter,controller,54321L);enabled("HideSponsoredMsg",true);Object on=call(getter,controller,54321L);enabled("HideSponsoredMsg",false);Object restore=call(getter,controller,54321L);
            require(off==info&&on==null&&restore==info,"cached ad model not filtered reversibly");return "existing sponsored model -> null -> original, no network request";
        });
        test(rows,"greeting_real_children",()->{
            Class<?> viewClass=c("org.telegram.ui.Components.ap");
            enabled("ProhibitChatGreetings",false);Object object=c("org.telegram.ui.aj").getDeclaredConstructor(c("org.telegram.ui.ko"),Activity.class,int.class,c("org.telegram.tgnet.TLRPC$Document"),c("org.telegram.ui.ActionBar.j6")).newInstance(null,activity,ModernFeatureHooks.account(),instance("org.telegram.tgnet.TLRPC$TL_document"),null);
            View view=(View)object;Method measure=method(viewClass.getName(),"onMeasure",int.class,int.class);
            int w=View.MeasureSpec.makeMeasureSpec(1000,View.MeasureSpec.EXACTLY),h=View.MeasureSpec.makeMeasureSpec(1800,View.MeasureSpec.AT_MOST);
            call(measure,object,w,h);View text=(View)get(object,"c"),sticker=(View)get(object,"h");int off=sticker.getVisibility();
            enabled("ProhibitChatGreetings",true);call(measure,object,w,h);int on=sticker.getVisibility();require(off==View.VISIBLE&&on==View.GONE&&text.getVisibility()==View.GONE,"greeting children were not hidden");
            enabled("ProhibitChatGreetings",false);call(measure,object,w,h);require(sticker.getVisibility()==View.VISIBLE,"greeting view did not restore");return "real sticker View VISIBLE -> GONE -> VISIBLE; description removed";
        });
        test(rows,"reactions_invalid_input_contract",()->{
            Object helper=raw("org.telegram.messenger.SendMessagesHelper");final int[] callbacks={0};Runnable done=()->callbacks[0]++;
            Method send=method("org.telegram.messenger.SendMessagesHelper","sendReaction",c("org.telegram.messenger.MessageObject"),ArrayList.class,c("vf.p0"),boolean.class,boolean.class,c("org.telegram.ui.ActionBar.r2"),Runnable.class);
            for(boolean state:new boolean[]{false,true,false}){enabled("ProhibitEnableReactions",state);call(send,helper,null,new ArrayList<>(),null,false,false,null,done);}
            require(callbacks[0]==0,"invalid-input path invented callback");return "null input no-op preserved 0->0->0; not claimed as valid-send coverage";
        });
        test(rows,"reactions_valid_input_send_boundary",()->{
            try(VerificationNetworkSink sink=new VerificationNetworkSink()){
                Object mo=raw("org.telegram.messenger.MessageObject"),tl=instance("org.telegram.tgnet.TLRPC$TL_message"),peer=instance("org.telegram.tgnet.TLRPC$TL_peerUser");
                set(peer,"user_id",987654321L);set(tl,"peer_id",peer);set(tl,"dialog_id",987654321L);set(tl,"id",123);set(mo,"messageOwner",tl);
                Object fragment=raw("org.telegram.ui.ko");Method send=method("org.telegram.messenger.SendMessagesHelper","sendReaction",c("org.telegram.messenger.MessageObject"),ArrayList.class,c("vf.p0"),boolean.class,boolean.class,c("org.telegram.ui.ActionBar.r2"),Runnable.class);
                enabled("ProhibitEnableReactions",false);call(send,sink.helper,mo,new ArrayList<>(),null,false,false,fragment,null);require(sink.requests.size()==1,"valid baseline never reached sendRequest");
                enabled("ProhibitEnableReactions",true);call(send,sink.helper,mo,new ArrayList<>(),null,false,false,fragment,null);require(sink.requests.size()==1,"enabled sent valid reaction");
                enabled("ProhibitEnableReactions",false);call(send,sink.helper,mo,new ArrayList<>(),null,false,false,fragment,null);require(sink.requests.size()==2,"valid send did not restore");
                require(sink.requests.get(0).getClass().getSimpleName().equals("TL_messages_sendReaction"),"wrong request sink payload");return "valid message + fragment; request sink 1->0->1; no request reached actual network";
            }
        });
        test(rows,"channel_switch_panel",()->{
            Object helper=raw("org.telegram.ui.hq");set(helper,"R",2);set(helper,"Q",false);Method m=method("org.telegram.ui.hq","e");
            enabled("ProhibitChannelSwitching",false);Object off=call(m,helper);enabled("ProhibitChannelSwitching",true);Object on=call(m,helper);
            require(Boolean.TRUE.equals(off)&&Boolean.FALSE.equals(on),"channel panel unchanged");return off+" -> "+on;
        });
        test(rows,"profile_id_long_user_chat_topic",()->{
            Object profile=raw("org.telegram.ui.ProfileActivity");
            set(profile,"e1",6387654321L);set(profile,"f1",9988776655L);set(profile,"g1",12345678901L);
            require("6387654321".equals(ModernProfileIds.id(profile)),"64-bit user ID lost priority or precision");
            set(profile,"e1",0L);require("9988776655/12345678901".equals(ModernProfileIds.id(profile)),"chat/topic mapping wrong");
            set(profile,"g1",0L);set(profile,"i1",987654321L);require("9988776655".equals(ModernProfileIds.id(profile)),"dialog ID leaked into raw chat ID");
            set(profile,"f1",0L);require(ModernProfileIds.id(profile)==null,"zero ID should not be shown");
            return "64-bit user first; raw chat/topic correct; dialog ID ignored; zero hidden";
        });
        test(rows,"profile_id_native_adapter_pipeline",()->{
            Object profile=raw("org.telegram.ui.ProfileActivity");set(profile,"e1",6387654321L);set(profile,"N2",8);
            Field names=ModernProfileIds.class.getDeclaredField("ROW_FIELDS");names.setAccessible(true);
            for(String name:(String[])names.get(null))set(profile,name,-1);
            set(profile,"f3",2);set(profile,"e3",1);set(profile,"P2",0);set(profile,"N3",7);
            Object adapter=c("org.telegram.ui.i11").getDeclaredConstructor(c("org.telegram.ui.ProfileActivity"),android.content.Context.class).newInstance(profile,activity);
            enabled("ShowIdInProfile",false);ModernProfileIds.insertAfterRebuild(profile);require(((Number)get(profile,"N2")).intValue()==8,"disabled ID changed count");
            enabled("ShowIdInProfile",true);ModernProfileIds.insertAfterRebuild(profile);ModernProfileIds.Row row=ModernProfileIds.rowForAdapter(adapter);
            require(row!=null&&row.index==2&&((Number)get(profile,"N2")).intValue()==9,"row insertion/count mismatch");
            require(((Number)get(profile,"f3")).intValue()==3&&((Number)get(profile,"N3")).intValue()==8&&((Number)get(profile,"P2")).intValue()==0,"native row positions not preserved");
            Method count=method("org.telegram.ui.i11","h"),type=method("org.telegram.ui.i11","j",int.class);
            require(((Number)call(count,adapter)).intValue()==9&&((Number)call(type,adapter,2)).intValue()==ModernProfileIds.VIEW_TYPE,"adapter not wired to ID row");
            Method create=method("org.telegram.ui.i11","x",android.view.ViewGroup.class,int.class);Object holder=call(create,adapter,new FrameLayout(activity),ModernProfileIds.VIEW_TYPE);
            set(holder,"f",ModernProfileIds.VIEW_TYPE);
            Method bind=method("org.telegram.ui.i11","v",c("n4.h1"),int.class);call(bind,adapter,holder,2);
            View cell=(View)get(holder,"a");require(cell.getContentDescription()!=null&&cell.getContentDescription().toString().contains("6387654321"),"real native cell did not show ID");
            require(Boolean.TRUE.equals(call(method("org.telegram.ui.i11","D",c("n4.h1")),adapter,holder)),"ID row not enabled for click");
            android.util.SparseIntArray sparse=new android.util.SparseIntArray();Object diff=c("org.telegram.ui.w01").getDeclaredConstructor(c("org.telegram.ui.ProfileActivity")).newInstance(profile);
            call(method("org.telegram.ui.w01","f",android.util.SparseIntArray.class),diff,sparse);require(sparse.get(2)==ModernProfileIds.DIFF_KEY,"ID missing from native diff snapshot");
            enabled("ShowIdInProfile",false);require(!ModernProfileIds.validBinding(profile,row),"old bound ID listener remains eligible when disabled");
            enabled("ShowIdInProfile",true);require(ModernProfileIds.validBinding(profile,row),"current binding did not reactivate");
            ModernProfileIds.insertAfterRebuild(profile);require(!ModernProfileIds.validBinding(profile,row),"stale ID row still eligible after replacement");
            return "count8->9; native c9 binding/diff key; current binding on-off-on verified; replaced binding invalid; no clipboard writes";
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
