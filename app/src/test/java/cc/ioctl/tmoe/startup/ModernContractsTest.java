package cc.ioctl.tmoe.startup;

import static org.junit.Assert.*;
import org.junit.Test;

public class ModernContractsTest {
    @Test public void hostVersionIsExact(){assertEquals("org.telegram.messenger.web",ModernHookEntry.HOST_PACKAGE);assertEquals(72299,ModernHookEntry.HOST_VERSION);}
    @Test public void paidUndoRejectsUnsafeStates(){
        assertTrue(ModernPaidReactionGuard.shouldCancel(false,false,true,5,0,5));
        assertFalse(ModernPaidReactionGuard.shouldCancel(true,false,true,5,0,5));
        assertFalse(ModernPaidReactionGuard.shouldCancel(false,true,true,5,0,5));
        assertFalse(ModernPaidReactionGuard.shouldCancel(false,false,false,5,0,5));
        assertFalse(ModernPaidReactionGuard.shouldCancel(false,false,true,5,1,5));
        assertFalse(ModernPaidReactionGuard.shouldCancel(false,false,true,6,0,5));
        assertFalse(ModernPaidReactionGuard.shouldCancel(false,false,true,0,0,5));
        assertFalse(ModernPaidReactionGuard.shouldCancel(false,false,true,Long.MAX_VALUE,0,Long.MAX_VALUE));
    }
    @Test public void healthDoesNotPretendPreferencesProveSupport(){
        assertFalse(ModernFeatureCatalog.available("unit-test-unmapped"));
        ModernFeatureCatalog.hooked("unit-test-feature","target1");
        assertTrue(ModernFeatureCatalog.available("unit-test-feature"));
        ModernFeatureCatalog.fail("unit-test-feature","target2",new NoSuchMethodException("test"));
        assertFalse(ModernFeatureCatalog.available("unit-test-feature"));
    }
}
