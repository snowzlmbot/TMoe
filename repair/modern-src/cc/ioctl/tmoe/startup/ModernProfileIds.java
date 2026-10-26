package cc.ioctl.tmoe.startup;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.util.Log;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import io.github.libxposed.api.XposedInterface;
import io.github.libxposed.api.XposedModule;

/** Telegram 72299 Profile IDs, all names/signatures selected from DexSQL. */
public final class ModernProfileIds {
    private ModernProfileIds(){}
    static final int VIEW_TYPE=0x544d4944;
    static final int DIFF_KEY=0x544d4931;
    private static final Map<Object,Row> rows=Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Object,Boolean> profiles=Collections.synchronizedMap(new WeakHashMap<>());
    private static final ArrayList<Field> indexFields=new ArrayList<>();
    private static XposedModule module;
    private static Class<?> profileClass,holderClass;
    private static Method rebuild;
    private static Field count,adapterProfile,holderView;
    private static volatile String lastError="";
    static final class Row {final int index;final String value,label;Row(int i,String v,String l){index=i;value=v;label=l;}}
    private static Class<?> c(String n)throws Exception{return ModernFeatureHooks.cls(n);}
    private static Field f(Class<?> cls,String n)throws Exception{return ModernFeatureHooks.field(cls,n);}
    private static Object get(Object o,String n)throws Exception{return f(o.getClass(),n).get(o);}
    private static void error(String where,Throwable e){lastError=where+":"+e.getClass().getSimpleName();Log.e("TMoe-ID",where,e);}
    public static String status(){return lastError.isEmpty()?"ready":lastError;}
    public static void install(XposedModule api,ClassLoader loader){
        module=api;
        try{
            profileClass=c("org.telegram.ui.ProfileActivity");holderClass=c("n4.h1");
            count=f(profileClass,"N2");adapterProfile=f(c("org.telegram.ui.i11"),"e");holderView=f(holderClass,"a");
            rebuild=profileClass.getDeclaredMethod("j5");rebuild.setAccessible(true);
            indexFields.clear();for(String name:ROW_FIELDS){Field field=f(profileClass,name);if(field.getType()!=int.class)throw new IllegalStateException("Not a row: "+name);indexFields.add(field);}
            api.hook(rebuild).setId("tmoe.72299.id.rows").setExceptionMode(XposedInterface.ExceptionMode.PROTECTIVE).intercept(chain->{
                Object p=chain.getThisObject();profiles.put(p,true);rows.remove(p);
                Object result=chain.proceed();insertAfterRebuild(p);return result;
            });api.deoptimize(rebuild);
            Method type=c("org.telegram.ui.i11").getDeclaredMethod("j",int.class);
            api.hook(type).setId("tmoe.72299.id.type").intercept(chain->{Row r=rowForAdapter(chain.getThisObject());return r!=null&&r.index==((Number)chain.getArg(0)).intValue()?VIEW_TYPE:chain.proceed();});api.deoptimize(type);
            Method create=c("org.telegram.ui.i11").getDeclaredMethod("x",ViewGroup.class,int.class);
            api.hook(create).setId("tmoe.72299.id.create").intercept(chain->{
                if(((Number)chain.getArg(1)).intValue()==VIEW_TYPE)return chain.proceed(new Object[]{chain.getArg(0),2});
                return chain.proceed();
            });api.deoptimize(create);
            Method bind=c("org.telegram.ui.i11").getDeclaredMethod("v",holderClass,int.class);
            api.hook(bind).setId("tmoe.72299.id.bind").intercept(chain->{
                Object adapter=chain.getThisObject(),p=adapterProfile.get(adapter);Row r=rows.get(p);
                if(r==null||r.index!=((Number)chain.getArg(1)).intValue())return chain.proceed();
                View cell=(View)holderView.get(chain.getArg(0));bindCell(cell,p,r);return null;
            });api.deoptimize(bind);
            Method enabled=c("org.telegram.ui.i11").getDeclaredMethod("D",holderClass);
            api.hook(enabled).setId("tmoe.72299.id.enabled").intercept(chain->{
                int typeValue=f(holderClass,"f").getInt(chain.getArg(0));return typeValue==VIEW_TYPE?true:chain.proceed();
            });api.deoptimize(enabled);
            Method clicked=profileClass.getDeclaredMethod("a0",profileClass,Context.class,long.class,View.class,int.class,float.class,float.class);
            api.hook(clicked).setId("tmoe.72299.id.click").intercept(chain->{
                Object p=chain.getArg(0);Row r=rows.get(p);if(r!=null&&r.index==((Number)chain.getArg(4)).intValue()){copy(((View)chain.getArg(3)).getContext(),r.value,true);return null;}return chain.proceed();
            });api.deoptimize(clicked);
            Method fill=c("org.telegram.ui.w01").getDeclaredMethod("f",SparseIntArray.class);
            api.hook(fill).setId("tmoe.72299.id.diff").intercept(chain->{
                Object result=chain.proceed();Object p=get(chain.getThisObject(),"i");Row r=rows.get(p);if(r!=null)((SparseIntArray)chain.getArg(0)).put(r.index,DIFF_KEY);return result;
            });api.deoptimize(fill);
            Log.i("TMoe-ID","installed: row=N2 rebuild=j5 adapter=i11; exact rows="+indexFields.size());
        }catch(Throwable e){error("install",e);}
    }
    static String id(Object p)throws Exception{
        long user=((Number)get(p,"e1")).longValue();if(user!=0)return Long.toString(user);
        Object chat=get(p,"E2");long chatId=chat==null?((Number)get(p,"f1")).longValue():((Number)get(chat,"id")).longValue();
        if(chatId==0)return null;long topic=((Number)get(p,"g1")).longValue();
        return topic==0?Long.toString(chatId):chatId+"/"+topic;
    }
    static void insertAfterRebuild(Object p)throws Exception{
        if(!ModernPreferences.isEnabled("ShowIdInProfile"))return;
        String value=id(p);if(value==null)return;
        int total=count.getInt(p);if(total<=0)return;
        int at=f(profileClass,"f3").getInt(p);
        if(at<0||at>total){int header=f(profileClass,"e3").getInt(p);at=header>=0&&header<total?header+1:Math.min(1,total);}
        for(Field field:indexFields){int position=field.getInt(p);if(position>=at)field.setInt(p,position+1);}
        count.setInt(p,total+1);long user=((Number)get(p,"e1")).longValue();rows.put(p,new Row(at,value,user!=0?"用户ID":"群组/频道ID"));
        Log.i("TMoe-ID","row rebuilt: original="+total+" index="+at+" count="+(total+1));
    }
    static Row rowForAdapter(Object adapter)throws Exception{return rows.get(adapterProfile.get(adapter));}
    static void bindCell(View cell,Object p,Row r)throws Exception{
        Method set=c("org.telegram.ui.Cells.c9").getDeclaredMethod("c",CharSequence.class,CharSequence.class,boolean.class);set.setAccessible(true);set.invoke(cell,r.value,r.label+" · 点按复制",false);
        cell.setContentDescription(r.label+" "+r.value+"，点按复制");cell.setOnClickListener(v->copy(v.getContext(),r.value,true));cell.setOnLongClickListener(v->{copy(v.getContext(),r.value,true);return true;});
        Log.i("TMoe-ID","row bound: sourceMatches="+r.value.equals(id(p))+" length="+r.value.length());
    }
    static boolean copy(Context context,String value,boolean toast){
        ClipboardManager manager=context.getSystemService(ClipboardManager.class);if(manager==null)return false;manager.setPrimaryClip(ClipData.newPlainText("Telegram ID",value));if(toast)Toast.makeText(context,"ID已复制",Toast.LENGTH_SHORT).show();Log.i("TMoe-ID","ID copied; length="+value.length());return true;
    }
    public static void refresh(){
        if(module==null||rebuild==null)return;
        List<Object> targets; synchronized(profiles){targets=new ArrayList<>(profiles.keySet());}
        for(Object p:targets)try{
            Runnable run=()->{try{module.getInvoker(rebuild).invoke(p);Object adapter=get(p,"d");if(adapter!=null)adapter.getClass().getMethod("l").invoke(adapter);}catch(Throwable e){error("refresh",e);}};
            Object list=get(p,"a");if(list instanceof View)((View)list).post(run);else run.run();
        }catch(Throwable e){error("refresh setup",e);}
    }
    // Generated from j5()'s exact -1 row-index resets, not arbitrary int fields.
    private static final String[] ROW_FIELDS = new String[]{
        "O2","P2","S2","T2","U2","V2","W2","Q2","R2",
        "X2","a3","b3","Y2","Z2","c3","d3","e3","f3",
        "g3","c4","d4","e4","f4","g4","h4","h3","i3",
        "j3","k3","l3","m3","n3","o3","p3","q3","r3",
        "s3","t3","u3","v3","w3","x3","y3","z3","i4",
        "n4","botPermissionBiometry","botPermissionEmojiStatus","botPermissionLocation","p4","j4","k4","l4","m4",
        "U3","V3","X3","W3","Z3","A3","B3","D3","E3",
        "F3","G3","H3","J3","I3","K3","L3","q4","r4",
        "M3","Y3","N3","P3","O3","R3","S3","T3","s4",
        "C3","a4","b4","t4","u4","v4","w4","x4","y4",
        "z4","G4","H4","E4","K4","Q3","A4","B4","C4",
        "D4","F4","L4","M4","N4"
    };
}
