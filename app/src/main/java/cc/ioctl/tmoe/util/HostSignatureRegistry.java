package cc.ioctl.tmoe.util;

import java.util.Collections;
import java.util.List;

/** Per-host exact aliases. Never reuse short obfuscated names across versions. */
public final class HostSignatureRegistry {
    private HostSignatureRegistry(){}
    public static List<String> aliases(String pkg,int version,String name){
        if(!"org.telegram.messenger.web".equals(pkg))return Collections.emptyList();
        String mapped=null;
        if(version==72299){switch(name){
            case "org.telegram.ui.ActionBar.BaseFragment":mapped="org.telegram.ui.ActionBar.r2";break;
            case "org.telegram.ui.ActionBar.ActionBar":mapped="org.telegram.ui.ActionBar.l";break;
            case "org.telegram.ui.ActionBar.Theme":mapped="org.telegram.ui.ActionBar.n6";break;
            case "org.telegram.ui.ChatActivity":mapped="org.telegram.ui.ko";break;
            case "org.telegram.ui.ProfileActivity":mapped=name;break;
        }}else if(version==71839){switch(name){
            case "org.telegram.ui.ActionBar.BaseFragment":mapped="org.telegram.ui.ActionBar.s2";break;
            case "org.telegram.ui.ActionBar.ActionBar":mapped="org.telegram.ui.ActionBar.m";break;
            case "org.telegram.ui.ActionBar.Theme":mapped="org.telegram.ui.ActionBar.o6";break;
            case "org.telegram.ui.ChatActivity":mapped="org.telegram.ui.lo";break;
            case "org.telegram.ui.Cells.DrawerProfileCell":mapped="org.telegram.ui.Cells.i5";break;
            case "org.telegram.ui.Components.SharedMediaLayout":mapped="org.telegram.ui.Components.lw0";break;
            case "org.telegram.ui.Adapters.MentionsAdapter":mapped="bf.u1";break;
        }}
        return mapped==null?Collections.emptyList():Collections.singletonList(mapped);
    }
    public static String resolve(String name){
        if(HostInfo.getApplication()==null)return name;
        List<String> candidates=aliases(HostInfo.getPackageName(),HostInfo.getVersionCode(),name);
        return candidates.isEmpty()?name:candidates.get(0);
    }
}
