package cc.ioctl.tmoe.util.dex;

import java.util.Arrays;
import java.util.Collections;
import org.junit.Test;
import static org.junit.Assert.*;

public class DexMethodDescriptorTest {
    @Test public void objectFollowedByPrimitiveIsNotSkipped(){
        assertEquals(Arrays.asList("Landroid/content/Intent;","I"),DexMethodDescriptor.splitParameterTypes("Landroid/content/Intent;I"));
    }
    @Test public void permissionCallbackArraysRemainSeparate(){
        assertEquals(Arrays.asList("I","[Ljava/lang/String;","[I"),DexMethodDescriptor.splitParameterTypes("I[Ljava/lang/String;[I"));
    }
    @Test public void arraysWideWordsAndNestedObjectsRoundTrip(){
        assertEquals(Arrays.asList("[[I","J","D","[[Ljava/lang/Object;","Z"),DexMethodDescriptor.splitParameterTypes("[[IJD[[Ljava/lang/Object;Z"));
        assertEquals(Collections.emptyList(),DexMethodDescriptor.splitParameterTypes(""));
        assertEquals(Arrays.asList("Landroid/view/View;","J","Landroid/os/Bundle;","I"),new DexMethodDescriptor("Lx;","m","(Landroid/view/View;JLandroid/os/Bundle;I)V").getParameterTypes());
    }
    @Test public void rejectsIncompleteDescriptors(){
        for(String input:new String[]{"[","Lbroken","V","[V","L;"}){
            try{DexMethodDescriptor.splitParameterTypes(input);fail("accepted "+input);}catch(IllegalArgumentException expected){}
        }
    }
}
