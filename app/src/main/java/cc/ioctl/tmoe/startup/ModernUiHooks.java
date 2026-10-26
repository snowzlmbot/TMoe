package cc.ioctl.tmoe.startup;

import android.app.Application;
import android.os.Build;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import cc.ioctl.tmoe.R;
import cc.ioctl.tmoe.fragment.ModernSettingsFragment;
import cc.ioctl.tmoe.lifecycle.Parasitics;
import cc.ioctl.tmoe.rtti.ProxyFragmentRttiHandler;
import cc.ioctl.tmoe.util.HostInfo;
import cc.ioctl.tmoe.util.HostSignatureRegistry;
import cc.ioctl.tmoe.util.Initiator;
import io.github.libxposed.api.XposedInterface;
import io.github.libxposed.api.XposedModule;
import io.github.libxposed.api.XposedModuleInterface;
import org.lsposed.hiddenapibypass.HiddenApiBypass;

/** Exact host settings integration; its own resource IDs are generated from source. */
final class ModernUiHooks {
    private static boolean installed;
    private static final int ITEM_ID=0x7f0e0001; // logical ID only, not a resource ID
    private ModernUiHooks(){}
    static void install(XposedModule module,XposedModuleInterface.PackageReadyParam p){
        ClassLoader loader=p.getClassLoader();
        try{
            Class<?> application=Class.forName(p.getApplicationInfo().className,false,loader);
            Method create=application.getMethod("onCreate");
            module.hook(create).setId("tmoe.source.application.ready").intercept(chain->{
                Object result=chain.proceed();prepare(module,loader,(Application)chain.getThisObject());return result;
            });
            try{
                Method current=Class.forName("android.app.ActivityThread").getDeclaredMethod("currentApplication");current.setAccessible(true);
                Application app=(Application)current.invoke(null);
                if(app!=null)prepare(module,loader,app);
            }catch(Throwable ignored){/* normal before Application.onCreate */}
        }catch(Throwable e){ModernFeatureCatalog.fail("SettingsEntry","Application.onCreate",e);}
    }
    private static synchronized void prepare(XposedModule module,ClassLoader loader,Application app){
        if(installed)return;
        try{
            HostInfo.setHostApplication(app);
            if(!ModernHookEntry.HOST_PACKAGE.equals(HostInfo.getPackageName())||HostInfo.getVersionCode()!=ModernHookEntry.HOST_VERSION){Log.w("TMoe-Source","Unsupported host version: "+HostInfo.getVersionCode());return;}
            if(Build.VERSION.SDK_INT>=28)HiddenApiBypass.addHiddenApiExemptions("L");
            Initiator.initWithHostClassLoader(loader);
            Parasitics.setModulePathOverride(module.getModuleApplicationInfo().sourceDir);
            Parasitics.injectModuleResources(app.getResources());
            Class<?> base=Class.forName(HostSignatureRegistry.resolve("org.telegram.ui.ActionBar.BaseFragment"),false,loader);
            ProxyFragmentRttiHandler.initProxyFragmentClass(base);
            installed=true;
            ModernHookEntry.installFunctionalHooks(module,loader);
            hookSettings(module,loader);
            Log.i("TMoe-Source","source initialization finished: "+ModernFeatureCatalog.errors());
        }catch(Throwable e){ModernFeatureCatalog.fail("SettingsEntry","prepare-host",e);}
    }
    private static void hookSettings(XposedModule module,ClassLoader loader)throws Exception{
        Class<?> settings=Class.forName("org.telegram.ui.t91",false,loader),item=Class.forName("org.telegram.ui.Components.f71",false,loader);
        Field id=item.getDeclaredField("d");id.setAccessible(true);
        Method fill=settings.getDeclaredMethod("b0",settings,ArrayList.class);fill.setAccessible(true);
        module.hook(fill).setId("tmoe.source.settings.fill").intercept(chain->{
            Object result=chain.proceed();ArrayList<Object> items=(ArrayList<Object>)chain.getArg(1);
            for(Object it:items)if(item.isInstance(it)&&id.getInt(it)==ITEM_ID)return result;
            Object row=item.getDeclaredConstructor(int.class).newInstance(3);
            id.setInt(row,ITEM_ID);item.getDeclaredField("k").setInt(row,R.drawable.ic_setting_hex_outline_24);item.getDeclaredField("l").set(row,"TMoe 设置");
            int at=items.size();for(int i=0;i<items.size();i++)if(item.isInstance(items.get(i))&&id.getInt(items.get(i))==10){at=i;break;}
            items.add(at,row);return result;
        });module.deoptimize(fill);
        Method click=settings.getDeclaredMethod("f0",settings,item);click.setAccessible(true);
        module.hook(click).setId("tmoe.source.settings.click").intercept(chain->{
            if(id.getInt(chain.getArg(1))!=ITEM_ID)return chain.proceed();
            Object parent=chain.getArg(0);Class<?> base=Class.forName(HostSignatureRegistry.resolve("org.telegram.ui.ActionBar.BaseFragment"),false,loader);
            Method present=base.getMethod("presentFragment",base);
            present.invoke(parent,new ModernSettingsFragment().getProxyObject());
            return null;
        });module.deoptimize(click);
        ModernFeatureCatalog.hooked("SettingsEntry",fill.toGenericString());ModernFeatureCatalog.hooked("SettingsEntry",click.toGenericString());
    }
}
