package cc.ioctl.tmoe.startup;

import android.app.Activity;
import android.view.View;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import io.github.libxposed.api.XposedInterface;

/** Verifies ko.R9 crosses playMessage only when enabled=false, without audio or a real file. */
final class VerificationVideoFixture implements AutoCloseable {
    private final List<XposedInterface.HookHandle> hooks=new ArrayList<>();
    private final Object chat,message,animation,receiver,cell,media;
    int playbackCalls;
    private static Class<?> c(String n)throws Exception{return ModernFeatureHooks.cls(n);}
    private static Object raw(String n)throws Exception{Class<?> u=Class.forName("sun.misc.Unsafe");Field f=u.getDeclaredField("theUnsafe");f.setAccessible(true);return u.getMethod("allocateInstance",Class.class).invoke(f.get(null),c(n));}
    private static void set(Object o,String n,Object value)throws Exception{ModernFeatureHooks.field(o.getClass(),n).set(o,value);}
    VerificationVideoFixture(Activity activity)throws Throwable{
        chat=raw("org.telegram.ui.ko");message=raw("org.telegram.messenger.MessageObject");animation=raw("org.telegram.ui.Components.f6");receiver=raw("cf.n1");cell=raw("org.telegram.ui.Cells/u1".replace('/','.'));media=raw("org.telegram.messenger.MediaController");
        try{
            Object list=c("org.telegram.ui.ek").getDeclaredConstructor(c("org.telegram.ui.ko"),android.content.Context.class,c("org.telegram.ui.io")).newInstance(chat,activity,null);
            View hint=(View)c("org.telegram.ui.Components.j50").getDeclaredConstructor(android.content.Context.class,int.class).newInstance(activity,0);hint.setTag(true);
            set(hint,"d",cell);set(cell,"x7",message);set(cell,"R0",receiver);set(chat,"w0",list);set(chat,"s2",hint);
            hook("org.telegram.messenger.MediaController","getInstance",new Class<?>[0],chain->media);
            hook("org.telegram.messenger.MediaController","isPlayingMessage",new Class<?>[]{c("org.telegram.messenger.MessageObject")},chain->chain.getThisObject()==media?false:chain.proceed());
            hook("org.telegram.messenger.MediaController","playMessage",new Class<?>[]{c("org.telegram.messenger.MessageObject")},chain->{if(chain.getThisObject()==media&&chain.getArg(0)==message){playbackCalls++;return true;}return chain.proceed();});
            hook("org.telegram.messenger.ImageReceiver","getAnimation",new Class<?>[0],chain->chain.getThisObject()==receiver?animation:chain.proceed());
            hook("org.telegram.messenger.MessageObject","isRoundVideo",new Class<?>[0],chain->chain.getThisObject()==message?false:chain.proceed());
            hook("org.telegram.ui.ko","m9",new Class<?>[]{boolean.class},chain->chain.getThisObject()==chat?null:chain.proceed());
            hook("org.telegram.ui.Components.f6","n",new Class<?>[0],chain->chain.getThisObject()==animation?0.0f:chain.proceed());
            hook("org.telegram.ui.Components.f6","o",new Class<?>[0],chain->chain.getThisObject()==animation?0:chain.proceed());
            hook("org.telegram.ui.Components.f6","stop",new Class<?>[0],chain->chain.getThisObject()==animation?null:chain.proceed());
            hook("org.telegram.ui.PhotoViewer","L1",new Class<?>[]{c("org.telegram.messenger.MessageObject")},chain->chain.getArg(0)==message?false:chain.proceed());
            hook("org.telegram.messenger.SharedConfig","setNoSoundHintShowed",new Class<?>[]{boolean.class},chain->null);
        }catch(Throwable e){close();throw e;}
    }
    Object invoke()throws Throwable{Method m=c("org.telegram.ui.ko").getDeclaredMethod("R9");return ModernFeatureHooks.runtimeModule.getInvoker(m).invoke(chat);}
    private void hook(String owner,String name,Class<?>[] p,XposedInterface.Hooker callback)throws Exception{Method m=c(owner).getDeclaredMethod(name,p);m.setAccessible(true);hooks.add(ModernFeatureHooks.runtimeModule.hook(m).setId("tmoe.verification.video."+name).intercept(callback));ModernFeatureHooks.runtimeModule.deoptimize(m);}
    @Override public void close(){for(int i=hooks.size()-1;i>=0;i--)hooks.get(i).unhook();}
}
