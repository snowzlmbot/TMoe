package cc.ioctl.tmoe.startup;

import android.util.Log;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import cc.ioctl.tmoe.util.HostInfo;
import io.github.libxposed.api.XposedInterface;
import io.github.libxposed.api.XposedModule;
import io.github.libxposed.api.XposedModuleInterface;

/** Modern API102 entry. Built from app sources; never loads legacy hook singletons. */
public final class ModernHookEntry extends XposedModule {
    public static final String HOST_PACKAGE="org.telegram.messenger.web";
    public static final int HOST_VERSION=72299;
    private static final String MO="org.telegram.messenger.MessageObject";
    private boolean installed;
    @Override public void onModuleLoaded(XposedModuleInterface.ModuleLoadedParam p){
        Log.i("TMoe-Source","API102 source module loaded: "+p.getProcessName());
    }
    @Override public void onPackageReady(XposedModuleInterface.PackageReadyParam p){
        if(installed||!HOST_PACKAGE.equals(p.getPackageName()))return;
        // Validate PackageInfo after Application creation before installing
        // any version-sensitive hook. ApplicationInfo is not the version source.
        installed=true;
        ModernUiHooks.install(this,p);
    }
    static void installFunctionalHooks(XposedModule module,ClassLoader loader){
        constant(module,loader,"AntiAntiForward","org.telegram.messenger.MessagesController","isChatNoForwards",false,"org.telegram.tgnet.TLRPC$Chat");
        constant(module,loader,"AntiAntiForward","org.telegram.messenger.MessagesController","isChatNoForwards",false,"long");
        constant(module,loader,"AntiAntiForward",MO,"canForwardMessage",true);
        constant(module,loader,"AntiAntiForward",MO,"isSecretMedia",false);
        constant(module,loader,"ProhibitSpoilers",MO,"hasMediaSpoilers",false);
        constant(module,loader,"ForceBlurChatAvailable","org.telegram.messenger.SharedConfig","canBlurChat",true);
        constant(module,loader,"KeepVideoMuted","org.telegram.ui.ko","R9",false);
        constant(module,loader,"HideSponsoredMsg","org.telegram.ui.ko","w6",null);
        hook(module,loader,"ChannelDetailNumbers","org.telegram.messenger.LocaleController","formatShortNumber",chain->{
            if(!ModernPreferences.isEnabled("ChannelDetailNumbers"))return chain.proceed();
            int value=((Number)chain.getArg(0)).intValue();Object rounded=chain.getArg(1);
            if(rounded instanceof int[]&&((int[])rounded).length>0)((int[])rounded)[0]=value;
            return Integer.toString(value);
        },"int","[I");
        hook(module,loader,"HideSponsoredMsg","org.telegram.messenger.MessagesController","getSponsoredMessages",chain->ModernPreferences.isEnabled("HideSponsoredMsg")?null:chain.proceed(),"long");
        hook(module,loader,"ProhibitEnableReactions","org.telegram.messenger.MediaDataController","getEnabledReactionsList",chain->ModernPreferences.isEnabled("ProhibitEnableReactions")?new ArrayList<>():chain.proceed());
        for(int n=1;n<=2;n++){
            hook(module,loader,"HidePremiumStickerSetTab","org.telegram.messenger.MediaDataController","getRecentStickers",chain->{
                if(ModernPreferences.isEnabled("HidePremiumStickerSetTab")&&((Number)chain.getArg(0)).intValue()==7)return new ArrayList<>();
                return chain.proceed();
            },n==1?new String[]{"int"}:new String[]{"int","boolean"});
        }
        constant(module,loader,"ProhibitChannelSwitching","org.telegram.ui.hq","c",null,"long","int","int","boolean","[I");
        constant(module,loader,"ProhibitChannelSwitching","org.telegram.ui.hq","a",null,"android.graphics.Canvas","org.telegram.ui.ek","float","float");
        constant(module,loader,"ProhibitChannelSwitching","org.telegram.ui.hq","b",null,"android.graphics.Canvas","int","int");
        constant(module,loader,"ProhibitChannelSwitching","org.telegram.ui.hq","e",false);
        hook(module,loader,"ProhibitChannelSwitching","org.telegram.ui.hq","g",chain->ModernPreferences.isEnabled("ProhibitChannelSwitching")?chain.proceed(new Object[]{chain.getArg(0),false}):chain.proceed(),"android.view.View","boolean");
        ModernFeatureHooks.install(module,loader);
    }
    static Class<?> type(ClassLoader loader,String name)throws ClassNotFoundException{
        switch(name){case "int":return int.class;case "long":return long.class;case "boolean":return boolean.class;case "float":return float.class;case "void":return void.class;default:return Class.forName(name,false,loader);}
    }
    private static void constant(XposedModule module,ClassLoader loader,String key,String owner,String name,Object value,String...params){
        hook(module,loader,key,owner,name,chain->ModernPreferences.isEnabled(key)?value:chain.proceed(),params);
    }
    private static void hook(XposedModule module,ClassLoader loader,String key,String owner,String name,XposedInterface.Hooker callback,String...params){
        String signature=owner+"."+name+java.util.Arrays.toString(params);
        try{
            Class<?>[] types=new Class<?>[params.length];for(int i=0;i<types.length;i++)types[i]=type(loader,params[i]);
            Method method=type(loader,owner).getDeclaredMethod(name,types);method.setAccessible(true);
            module.hook(method).setId("tmoe.source."+key+"."+signature).setExceptionMode(XposedInterface.ExceptionMode.PROTECTIVE).intercept(callback);
            module.deoptimize(method);
            ModernFeatureCatalog.hooked(key,signature);
        }catch(Throwable e){ModernFeatureCatalog.fail(key,signature,e);}
    }
}
