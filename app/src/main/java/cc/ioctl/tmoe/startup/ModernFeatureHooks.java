package cc.ioctl.tmoe.startup;

import android.app.Activity;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;
import io.github.libxposed.api.XposedInterface;
import io.github.libxposed.api.XposedModule;

/** Exact Telegram 72299 contracts, selected with DexSQL 0.1.1. */
public final class ModernFeatureHooks {
    private ModernFeatureHooks() {}
    static ClassLoader loader;
    static XposedModule runtimeModule;
    static volatile long updatePopupConstructions;
    static volatile java.lang.ref.WeakReference<android.app.Dialog> lastUpdatePopup=new java.lang.ref.WeakReference<>(null);
    private static final Map<Object,Boolean> updateLayouts=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Activity,Boolean> activities=Collections.synchronizedMap(new WeakHashMap<>());
    private static final class ReactionState {
        final int height,visibility;final Object[] arguments;final Method bind;
        ReactionState(View v,Method m,Object[] a){this(v.getLayoutParams()==null?ViewGroup.LayoutParams.WRAP_CONTENT:v.getLayoutParams().height,v.getVisibility(),m,a);}
        ReactionState(int h,int visibility,Method m,Object[] a){this.height=h;this.visibility=visibility;bind=m;arguments=a.clone();}
    }
    private static final Map<View,ReactionState> reactionViews=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Activity,Object> hiddenMandatory=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<View,int[]> greetingViews=Collections.synchronizedMap(new WeakHashMap<>());
    private static final ArrayList<String> failures=new ArrayList<>();
    static Class<?> cls(String name) throws ClassNotFoundException { return Class.forName(name,false,loader); }
    static Field field(Class<?> c,String n) throws NoSuchFieldException {
        for(Class<?> p=c;p!=null;p=p.getSuperclass())try{Field f=p.getDeclaredField(n);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}
        throw new NoSuchFieldException(c.getName()+"."+n);
    }
    static Object get(Object o,String n) throws Exception{return field(o.getClass(),n).get(o);}
    private static void register(XposedModule module,String owner,String name,String feature,Object result,Class<?>... params){
        try{
            Method m=cls(owner).getDeclaredMethod(name,params);m.setAccessible(true);
            module.hook(m).setId("tmoe.72299."+feature+"."+owner+"."+name+"."+params.length).setExceptionMode(XposedInterface.ExceptionMode.PROTECTIVE).intercept(chain->{
                if(!ModernPreferences.isEnabled(feature))return chain.proceed();
                return result;
            });
            module.deoptimize(m);
            Log.i("TMoe-UI","EXACT_HOOK "+owner+"."+name+"/"+params.length);
            ModernFeatureCatalog.hooked(feature,owner+"."+name);
        }catch(Throwable e){ModernFeatureCatalog.fail(feature,owner+"."+name,e);failed(owner+"."+name,e);}
    }
    private static void failed(String target,Throwable e){failures.add(target+": "+e.getClass().getSimpleName());Log.e("TMoe-UI","EXACT_HOOK_FAILED "+target,e);}
    public static String failures(){return failures.toString();}
    public static void install(XposedModule module,ClassLoader host){
        loader=host;
        runtimeModule=module;
        ModernVerification.install(module,host);
        ModernProfileIds.install(module,host);
        ModernPaidReactionGuard.install(module,host);
        try{
            Class<?> app=cls("org.telegram.messenger.ApplicationLoader"), upd=cls("org.telegram.tgnet.TLRPC$TL_help_appUpdate");
            register(module,"org.telegram.messenger.SharedConfig","isAppUpdateAvailable","ProhibitUpdates",false);
            register(module,"org.telegram.messenger.SharedConfig","setNewAppVersionAvailable","ProhibitUpdates",false,upd);
            // true means 'handled'; false would allow caller's fallback popup.
            register(module,"org.telegram.messenger.ApplicationLoader","showUpdateAppPopup","ProhibitUpdates",true,android.content.Context.class,upd,int.class);
            register(module,"org.telegram.messenger.ApplicationLoaderImpl","showUpdateAppPopup","ProhibitUpdates",true,android.content.Context.class,upd,int.class);
            register(module,"org.telegram.messenger.ApplicationLoader","showCustomUpdateAppPopup","ProhibitUpdates",true,android.content.Context.class,cls("org.telegram.messenger.BetaUpdate"),int.class);
            register(module,"org.telegram.messenger.ApplicationLoader","checkForUpdates","ProhibitUpdates",null);
            register(module,"org.telegram.messenger.ApplicationLoaderImpl","checkForUpdatesInternal","ProhibitUpdates",null);
            register(module,"org.telegram.ui.LaunchActivity","M0","ProhibitUpdates",null,int.class,upd,boolean.class);
            register(module,"org.telegram.ui.LaunchActivity","z","ProhibitUpdates",null,boolean.class);
            hookUpdates(module);
        }catch(Throwable e){ModernFeatureCatalog.fail("ProhibitUpdates","update-family",e);failed("update-family",e);}
        try{
            // Text spoilers: actual span flag and core effect generation, not media-only.
            register(module,"org.telegram.ui.Components.m21","c","ProhibitSpoilers",false);
            Method core=cls("rg.g").getDeclaredMethod("a",View.class,android.text.Layout.class,int.class,int.class,android.text.Spanned.class,java.util.Stack.class,java.util.List.class,ArrayList.class);
            module.hook(core).setId("tmoe.72299.text_spoilers").intercept(chain->{
                if(!ModernPreferences.isEnabled("ProhibitSpoilers"))return chain.proceed();
                Object list=chain.getArg(6);if(list instanceof java.util.List)((java.util.List<?>)list).clear();
                return null;
            });module.deoptimize(core);
        }catch(Throwable e){ModernFeatureCatalog.fail("ProhibitSpoilers","text-spoilers",e);failed("text-spoilers",e);}
        try{
            // Cover saved/recent/top/custom reaction sources and the send boundary.
            for(String name:new String[]{"getRecentReactions","getSavedReactions","getTopReactions"}){
                Method m=cls("org.telegram.messenger.MediaDataController").getDeclaredMethod(name);
                module.hook(m).setId("tmoe.72299.reactions."+name).intercept(chain->ModernPreferences.isEnabled("ProhibitEnableReactions")?new ArrayList<>():chain.proceed());module.deoptimize(m);
            }
            Class<?> mo=cls("org.telegram.messenger.MessageObject"), fragment=cls("org.telegram.ui.ActionBar.r2"), reaction=cls("vf.p0"), box=cls("org.telegram.ui.Components.yl0");
            Method send=cls("org.telegram.messenger.SendMessagesHelper").getDeclaredMethod("sendReaction",mo,ArrayList.class,reaction,boolean.class,boolean.class,fragment,Runnable.class);
            module.hook(send).setId("tmoe.72299.reactions.send").intercept(chain->{
                if(!ModernPreferences.isEnabled("ProhibitEnableReactions"))return chain.proceed();
                // Native invalid-input path is a no-op; do not invent a
                // 'success' callback for an action that was never sent.
                return null;
            });module.deoptimize(send);
            Method click=cls("org.telegram.ui.ko").getDeclaredMethod("eb",View.class,mo,box,View.class,float.class,float.class,reaction,boolean.class,boolean.class,boolean.class,boolean.class);
            module.hook(click).setId("tmoe.72299.reactions.click").intercept(chain->ModernPreferences.isEnabled("ProhibitEnableReactions")?null:chain.proceed());module.deoptimize(click);
            Method bind=box.getDeclaredMethod("p",mo,cls("org.telegram.tgnet.TLRPC$ChatFull"),boolean.class);
            module.hook(bind).setId("tmoe.72299.reactions.layout").intercept(chain->{
                View v=(View)chain.getThisObject();
                if(ModernPreferences.isEnabled("ProhibitEnableReactions")){hideReaction(v,bind,chain.getArgs().toArray());return null;}
                restoreReaction(v,false);return chain.proceed();
            });module.deoptimize(bind);
        }catch(Throwable e){ModernFeatureCatalog.fail("ProhibitEnableReactions","reaction-family",e);failed("reaction-family",e);}
        try{
            Class<?> mo=cls("org.telegram.messenger.MessageObject"), doc=cls("org.telegram.tgnet.TLRPC$Document");
            register(module,"org.telegram.messenger.MessageObject","getPremiumStickerAnimation","DisablePremiumStickerAnimation",null,doc);
            register(module,"org.telegram.messenger.MessageObject","getPremiumStickerAnimation","DisablePremiumStickerAnimation",null);
            Method overlay=cls("org.telegram.ui.nz").getDeclaredMethod("d",String.class,int.class,doc,mo,int.class,boolean.class,boolean.class,float.class,float.class,boolean.class);
            module.hook(overlay).setId("tmoe.72299.premium.effect").intercept(chain->{
                if(ModernPreferences.isEnabled("DisablePremiumStickerAnimation")){
                    Object message=chain.getArg(3),document=chain.getArg(2);
                    boolean premium=message!=null?(Boolean)mo.getMethod("isPremiumSticker").invoke(message):document!=null&&(Boolean)mo.getMethod("isPremiumSticker",doc).invoke(null,document);
                    if(premium)return false;
                }
                return chain.proceed();
            });module.deoptimize(overlay);
        }catch(Throwable e){ModernFeatureCatalog.fail("DisablePremiumStickerAnimation","premium-effect",e);failed("premium-effect",e);}
        try {
            Method measure=cls("org.telegram.ui.Components.ap").getDeclaredMethod("onMeasure",int.class,int.class);
            module.hook(measure).setId("tmoe.72299.greetings.real_children").intercept(chain->{
                View root=(View)chain.getThisObject();
                if(!ModernPreferences.isEnabled("ProhibitChatGreetings"))restoreGreeting(root);
                Object result=chain.proceed();
                if(ModernPreferences.isEnabled("ProhibitChatGreetings"))hideGreeting(root);
                return result;
            });module.deoptimize(measure);
            ModernFeatureCatalog.hooked("ProhibitChatGreetings",measure.toGenericString());
        }catch(Throwable e){ModernFeatureCatalog.fail("ProhibitChatGreetings","greeting-view",e);failed("greeting-view",e);}
        Log.i("TMoe-UI","EXACT_INSTALL_DONE failures="+failures);
    }
    private static void hookUpdates(XposedModule module)throws Exception{
        Constructor<?> popup=cls("org.telegram.ui.Components.i81").getDeclaredConstructor(android.content.Context.class,cls("org.telegram.tgnet.TLRPC$TL_help_appUpdate"),int.class);
        module.hook(popup).setId("tmoe.72299.update.popup.observe").intercept(chain->{Object r=chain.proceed();updatePopupConstructions++;lastUpdatePopup=new java.lang.ref.WeakReference<>((android.app.Dialog)chain.getThisObject());return r;});
        Class<?> layout=cls("org.telegram.ui.Components.j81");
        Constructor<?> ctor=layout.getDeclaredConstructor(Activity.class,ViewGroup.class);
        module.hook(ctor).setId("tmoe.72299.update.layout.ctor").intercept(chain->{Object r=chain.proceed();updateLayouts.put(chain.getThisObject(),true);return r;});
        for(String name:new String[]{"createUpdateUI","updateAppUpdateViews","updateFileProgress"}){
            Class<?>[] p=name.equals("createUpdateUI")?new Class[]{int.class}:name.equals("updateAppUpdateViews")?new Class[]{int.class,boolean.class}:new Class[]{Object[].class};
            Method m=layout.getDeclaredMethod(name,p);module.hook(m).setId("tmoe.72299.update.layout."+name).intercept(chain->{
                Object o=chain.getThisObject();updateLayouts.put(o,true);
                if(ModernPreferences.isEnabled("ProhibitUpdates")){removeUpdateStrip(o);return null;}
                return chain.proceed();
            });module.deoptimize(m);
        }
        Method resume=cls("org.telegram.ui.LaunchActivity").getDeclaredMethod("onResume");
        module.hook(resume).setId("tmoe.72299.update.resume").intercept(chain->{
            Activity a=(Activity)chain.getThisObject();activities.put(a,true);
            if(ModernPreferences.isEnabled("ProhibitUpdates"))hideMandatory(a);
            Object r=chain.proceed();if(ModernPreferences.isEnabled("ProhibitUpdates"))hideMandatory(a);return r;
        });module.deoptimize(resume);
    }
    static void removeUpdateStrip(Object layout){
        try{
            Object o=get(layout,"a");if(o instanceof View){View v=(View)o;v.animate().cancel();v.clearAnimation();v.setTag(null);v.setVisibility(View.GONE);if(v.getParent() instanceof ViewGroup){ViewGroup p=(ViewGroup)v.getParent();p.removeView(v);p.requestLayout();}}
            for(String key:new String[]{"a","b","c","d"})field(layout.getClass(),key).set(layout,null);
        }catch(Throwable e){Log.e("TMoe-UI","remove update strip failed",e);}
    }
    static void hideMandatory(Activity a){try{Object o=get(a,"C0");if(o instanceof View&&((View)o).getVisibility()==View.VISIBLE){hiddenMandatory.put(a,o);((View)o).animate().cancel();((View)o).setVisibility(View.GONE);}}catch(Throwable e){Log.e("TMoe-UI","hide mandatory update failed",e);}}
    private static void restoreMandatory(Activity a){try{Object hidden=hiddenMandatory.remove(a);if(hidden==null||get(a,"C0")!=hidden||a.isFinishing())return;Object update=get(hidden,"n");if(update==null)return;int account=((Number)get(hidden,"s")).intValue();a.getClass().getMethod("M0",int.class,cls("org.telegram.tgnet.TLRPC$TL_help_appUpdate"),boolean.class).invoke(a,account,update,false);}catch(Throwable e){Log.e("TMoe-UI","restore mandatory update",e);}}
    private static void closeExistingUpdatePopup(){try{android.app.Dialog dialog=lastUpdatePopup.get();if(dialog!=null&&dialog.isShowing())dialog.getClass().getMethod("dismissInternal").invoke(dialog);}catch(Throwable e){Log.e("TMoe-UI","close active update popup",e);}}
    private static void hideReaction(View v,Method bind,Object[] arguments){
        ReactionState previous=reactionViews.get(v);ReactionState state=new ReactionState(v,bind,arguments);
        if(previous!=null)state=new ReactionState(previous.height,previous.visibility,bind,arguments);
        reactionViews.put(v,state);v.setVisibility(View.GONE);ViewGroup.LayoutParams p=v.getLayoutParams();if(p!=null){p.height=0;v.setLayoutParams(p);}v.requestLayout();
    }
    private static void restoreReaction(View v,boolean rebind){
        ReactionState state=reactionViews.remove(v);if(state==null)return;
        ViewGroup.LayoutParams p=v.getLayoutParams();if(p!=null){p.height=state.height;v.setLayoutParams(p);}v.setVisibility(state.visibility);
        if(rebind)try{runtimeModule.getInvoker(state.bind).invoke(v,state.arguments);}catch(Throwable e){Log.e("TMoe-UI","restore reaction binding",e);}
        v.requestLayout();
    }
    private static void hideGreeting(View root){try{View text=(View)get(root,"c"),sticker=(View)get(root,"h");if(!greetingViews.containsKey(root))greetingViews.put(root,new int[]{text.getVisibility(),sticker.getVisibility()});text.setVisibility(View.GONE);sticker.setVisibility(View.GONE);}catch(Throwable e){Log.e("TMoe-UI","hide greeting",e);}}
    private static void restoreGreeting(View root){try{int[] state=greetingViews.remove(root);if(state!=null){((View)get(root,"c")).setVisibility(state[0]);((View)get(root,"h")).setVisibility(state[1]);}}catch(Throwable e){Log.e("TMoe-UI","restore greeting",e);}}
    public static void onToggleChanged(String name){
        if(name.equals("ProhibitEnableReactions")&&!ModernPreferences.isEnabled(name))synchronized(reactionViews){for(View v:new ArrayList<>(reactionViews.keySet()))restoreReaction(v,true);}
        if(name.equals("ProhibitChatGreetings")&&!ModernPreferences.isEnabled(name))synchronized(greetingViews){for(View v:new ArrayList<>(greetingViews.keySet()))restoreGreeting(v);}
        if(name.equals("ShowIdInProfile"))ModernProfileIds.refresh();
        if(name.equals("ProhibitUpdates")){
            if(ModernPreferences.isEnabled(name))closeExistingUpdatePopup();
            synchronized(updateLayouts){for(Object l:new ArrayList<>(updateLayouts.keySet()))try{if(ModernPreferences.isEnabled(name))removeUpdateStrip(l);else l.getClass().getMethod("updateAppUpdateViews",int.class,boolean.class).invoke(l,account(),false);}catch(Throwable e){Log.e("TMoe-UI","refresh update UI",e);}}
            synchronized(activities){for(Activity a:new ArrayList<>(activities.keySet())){if(ModernPreferences.isEnabled(name))hideMandatory(a);else restoreMandatory(a);}}
        }
    }
    static int account(){try{return cls("org.telegram.messenger.UserConfig").getField("selectedAccount").getInt(null);}catch(Throwable e){return 0;}}
}
