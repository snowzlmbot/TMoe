package cc.ioctl.tmoe.startup;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import io.github.libxposed.api.XposedInterface;

/** Synthetic paid queue, account=999, all requests and notifications stay in memory. */
final class VerificationPaidFixture implements AutoCloseable {
    private static final int ACCOUNT=999;
    private final Thread thread=Thread.currentThread();
    private final List<XposedInterface.HookHandle> hooks=new ArrayList<>();
    final Object stars,messages,connections,notifications,message,fragment;
    final List<Object> requests=new ArrayList<>();
    private static Class<?> c(String n)throws Exception{return ModernFeatureHooks.cls(n);}
    private static Object raw(String n)throws Exception{Class<?> u=Class.forName("sun.misc.Unsafe");Field f=u.getDeclaredField("theUnsafe");f.setAccessible(true);return u.getMethod("allocateInstance",Class.class).invoke(f.get(null),c(n));}
    static Object get(Object o,String n)throws Exception{return ModernFeatureHooks.field(o.getClass(),n).get(o);}
    static void set(Object o,String n,Object v)throws Exception{ModernFeatureHooks.field(o.getClass(),n).set(o,v);}
    VerificationPaidFixture()throws Throwable{
        stars=raw("vg.b6");messages=raw("org.telegram.messenger.MessagesController");connections=raw("org.telegram.tgnet.ConnectionsManager");notifications=raw("org.telegram.messenger.NotificationCenter");message=raw("org.telegram.messenger.MessageObject");fragment=raw("org.telegram.ui.ko");
        try{
            set(stars,"a",ACCOUNT);set(stars,"e",false);set(stars,"g",5L);
            Object tl=c("org.telegram.tgnet.TLRPC$TL_message").getConstructor().newInstance(),peer=c("org.telegram.tgnet.TLRPC$TL_peerUser").getConstructor().newInstance();set(peer,"user_id",987654321L);set(tl,"peer_id",peer);set(tl,"dialog_id",987654321L);set(tl,"id",123);set(message,"messageOwner",tl);
            hook("vg.b6","y",new Class<?>[]{int.class,boolean.class},chain->((Number)chain.getArg(0)).intValue()==ACCOUNT?stars:chain.proceed());
            hook("org.telegram.messenger.MessagesController","getInstance",new Class<?>[]{int.class},chain->((Number)chain.getArg(0)).intValue()==ACCOUNT?messages:chain.proceed());
            hook("org.telegram.tgnet.ConnectionsManager","getInstance",new Class<?>[]{int.class},chain->((Number)chain.getArg(0)).intValue()==ACCOUNT?connections:chain.proceed());
            hook("org.telegram.messenger.NotificationCenter","getInstance",new Class<?>[]{int.class},chain->((Number)chain.getArg(0)).intValue()==ACCOUNT?notifications:chain.proceed());
            hook("org.telegram.messenger.NotificationCenter","postNotificationName",new Class<?>[]{int.class,Object[].class},chain->chain.getThisObject()==notifications?null:chain.proceed());
            Object inputPeer=c("org.telegram.tgnet.TLRPC$TL_inputPeerSelf").getConstructor().newInstance();
            hook("org.telegram.messenger.MessagesController","getInputPeer",new Class<?>[]{long.class},chain->chain.getThisObject()==messages?inputPeer:chain.proceed());
            hook("org.telegram.tgnet.ConnectionsManager","sendRequest",new Class<?>[]{c("org.telegram.tgnet.TLObject"),c("org.telegram.tgnet.RequestDelegate")},chain->{if(chain.getThisObject()!=connections)return chain.proceed();requests.add(chain.getArg(0));return 456;});
            hook("org.telegram.tgnet.ConnectionsManager","getCurrentTime",new Class<?>[0],chain->chain.getThisObject()==connections?123456:chain.proceed());
            hook("vg.b6","P",new Class<?>[0],chain->chain.getThisObject()==stars?null:chain.proceed());
            Method submit=c("vg.a6").getDeclaredMethod("b");ModernFeatureHooks.runtimeModule.deoptimize(submit);
            Method create=c("vg.b6").getDeclaredMethod("d0",c("org.telegram.messenger.MessageObject"),c("org.telegram.ui.ko"),long.class,boolean.class,boolean.class,Long.class);ModernFeatureHooks.runtimeModule.deoptimize(create);
        }catch(Throwable e){close();throw e;}
    }
    Object queue()throws Exception{
        Object q=raw("vg.a6"),identity=c("vg.v5").getConstructor(long.class,int.class).newInstance(987654321L,123);
        set(q,"q",stars);set(q,"a",identity);set(q,"b",message);set(q,"c",fragment);set(q,"i",false);set(q,"j",false);set(q,"l",true);set(q,"h",5L);set(q,"k",0L);set(q,"n",0L);
        set(q,"d",raw("org.telegram.ui.Components.qc"));set(q,"p",c("vg.y5").getDeclaredConstructor(c("vg.a6"),int.class).newInstance(q,0));
        set(stars,"B",q);set(stars,"g",5L);return q;
    }
    void submit(Object q)throws Throwable{Method m=c("vg.a6").getDeclaredMethod("b");ModernFeatureHooks.runtimeModule.getInvoker(m).invoke(q);}
    Object createBlocked()throws Throwable{Method m=c("vg.b6").getDeclaredMethod("d0",c("org.telegram.messenger.MessageObject"),c("org.telegram.ui.ko"),long.class,boolean.class,boolean.class,Long.class);return ModernFeatureHooks.runtimeModule.getInvoker(m).invoke(stars,message,fragment,5L,true,true,0L);}
    private void hook(String owner,String name,Class<?>[] p,XposedInterface.Hooker callback)throws Exception{Method m=c(owner).getDeclaredMethod(name,p);m.setAccessible(true);hooks.add(ModernFeatureHooks.runtimeModule.hook(m).setId("tmoe.verification.paid."+owner+"."+name).intercept(chain->Thread.currentThread()==thread?callback.intercept(chain):chain.proceed()));ModernFeatureHooks.runtimeModule.deoptimize(m);}
    @Override public void close(){for(int i=hooks.size()-1;i>=0;i--)hooks.get(i).unhook();}
}
