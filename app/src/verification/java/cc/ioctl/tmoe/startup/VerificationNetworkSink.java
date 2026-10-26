package cc.ioctl.tmoe.startup;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import io.github.libxposed.api.XposedInterface;

/** Test-only: route only fabricated controller identities to an in-memory sink. */
final class VerificationNetworkSink implements AutoCloseable {
    final Object helper,controller,connections;
    final List<Object> requests=new ArrayList<>();
    private final List<XposedInterface.HookHandle> hooks=new ArrayList<>();
    private static Class<?> c(String n)throws Exception{return ModernFeatureHooks.cls(n);}
    private static Object raw(String n)throws Exception{Class<?> u=Class.forName("sun.misc.Unsafe");Field f=u.getDeclaredField("theUnsafe");f.setAccessible(true);return u.getMethod("allocateInstance",Class.class).invoke(f.get(null),c(n));}
    VerificationNetworkSink()throws Throwable{
        helper=raw("org.telegram.messenger.SendMessagesHelper");controller=raw("org.telegram.messenger.MessagesController");connections=raw("org.telegram.tgnet.ConnectionsManager");
        try{
            install("org.telegram.messenger.BaseController","getMessagesController",new Class<?>[0],chain->chain.getThisObject()==helper?controller:chain.proceed());
            install("org.telegram.messenger.BaseController","getConnectionsManager",new Class<?>[0],chain->chain.getThisObject()==helper?connections:chain.proceed());
            Object peer=c("org.telegram.tgnet.TLRPC$TL_inputPeerSelf").getConstructor().newInstance();
            install("org.telegram.messenger.MessagesController","getInputPeer",new Class<?>[]{long.class},chain->chain.getThisObject()==controller?peer:chain.proceed());
            install("org.telegram.tgnet.ConnectionsManager","sendRequest",new Class<?>[]{c("org.telegram.tgnet.TLObject"),c("org.telegram.tgnet.RequestDelegate")},chain->{
                if(chain.getThisObject()!=connections)return chain.proceed();requests.add(chain.getArg(0));return 123;
            });
        }catch(Throwable e){close();throw e;}
    }
    private void install(String owner,String name,Class<?>[] params,XposedInterface.Hooker fn)throws Exception{
        Method m=c(owner).getDeclaredMethod(name,params);m.setAccessible(true);hooks.add(ModernFeatureHooks.runtimeModule.hook(m).setId("tmoe.verify.fixture."+owner+"."+name).intercept(fn));ModernFeatureHooks.runtimeModule.deoptimize(m);
    }
    @Override public void close(){for(int i=hooks.size()-1;i>=0;i--)hooks.get(i).unhook();hooks.clear();}
}
