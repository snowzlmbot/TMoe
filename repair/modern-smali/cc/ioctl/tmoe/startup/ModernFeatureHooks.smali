.class public final Lcc/ioctl/tmoe/startup/ModernFeatureHooks;
.super Ljava/lang/Object;
.source "ModernFeatureHooks.java"


# static fields
.field private static final activities:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Activity;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final failures:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final greetingViews:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "[I>;"
        }
    .end annotation
.end field

.field private static volatile lastTestNonce:Ljava/lang/String;

.field static volatile lastUpdatePopup:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Dialog;",
            ">;"
        }
    .end annotation
.end field

.field static loader:Ljava/lang/ClassLoader;

.field private static final reactionViews:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field static runtimeModule:Lio/github/libxposed/api/XposedModule;

.field private static final updateLayouts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field static volatile updatePopupConstructions:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 22
    const-string v0, ""

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->lastTestNonce:Ljava/lang/String;

    .line 24
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->lastUpdatePopup:Ljava/lang/ref/WeakReference;

    .line 25
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->updateLayouts:Ljava/util/Map;

    .line 26
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->activities:Ljava/util/Map;

    .line 27
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->reactionViews:Ljava/util/Map;

    .line 28
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->greetingViews:Ljava/util/Map;

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->failures:Ljava/util/ArrayList;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static account()I
    .locals 2

    .line 195
    :try_start_0
    const-string v0, "org.telegram.messenger.UserConfig"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "selectedAccount"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v0

    :catchall_0
    move-exception v0

    const/4 v0, 0x0

    return v0
.end method

.method static cls(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 30
    const/4 v0, 0x0

    sget-object v1, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->loader:Ljava/lang/ClassLoader;

    invoke-static {p0, v0, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method

.method private static failed(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3

    .line 47
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->failures:Ljava/util/ArrayList;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "EXACT_HOOK_FAILED "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "TMoe-UI"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public static failures()Ljava/lang/String;
    .locals 1

    .line 48
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->failures:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchFieldException;
        }
    .end annotation

    .line 32
    move-object v0, p0

    :goto_0
    if-eqz v0, :cond_0

    :try_start_0
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v1

    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0

    .line 33
    :cond_0
    new-instance v0, Ljava/lang/NoSuchFieldException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, "."

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static hideGreeting(Landroid/view/View;)V
    .locals 5

    .line 185
    :try_start_0
    const-string v0, "c"

    invoke-static {p0, v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    const-string v1, "h"

    invoke-static {p0, v1}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    sget-object v2, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->greetingViews:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    sget-object v2, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->greetingViews:Ljava/util/Map;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v3

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v4

    filled-new-array {v3, v4}, [I

    move-result-object v3

    invoke-interface {v2, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const/16 p0, 0x8

    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, p0}, Landroid/view/View;->setVisibility(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    const-string v0, "TMoe-UI"

    const-string v1, "hide greeting"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method static hideMandatory(Landroid/app/Activity;)V
    .locals 2

    .line 182
    :try_start_0
    const-string v0, "C0"

    invoke-static {p0, v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Landroid/view/View;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    check-cast p0, Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    const-string v0, "TMoe-UI"

    const-string v1, "hide mandatory update failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method private static hideReaction(Landroid/view/View;)V
    .locals 2

    .line 183
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->reactionViews:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->reactionViews:Ljava/util/Map;

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, -0x2

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_2

    const/4 v1, 0x0

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method private static hookUpdates(Lio/github/libxposed/api/XposedModule;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 156
    const-string v0, "org.telegram.ui.Components.i81"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-class v1, Landroid/content/Context;

    const-string v2, "org.telegram.tgnet.TLRPC$TL_help_appUpdate"

    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v1, v2, v3}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 157
    invoke-virtual {p0, v0}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v0

    const-string v1, "tmoe.72299.update.popup.observe"

    invoke-interface {v0, v1}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v0

    new-instance v1, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda9;

    invoke-direct {v1}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda9;-><init>()V

    invoke-interface {v0, v1}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 158
    const-string v0, "org.telegram.ui.Components.j81"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 159
    const-class v1, Landroid/app/Activity;

    const-class v2, Landroid/view/ViewGroup;

    filled-new-array {v1, v2}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 160
    invoke-virtual {p0, v1}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    const-string v2, "tmoe.72299.update.layout.ctor"

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    new-instance v2, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda10;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda10;-><init>()V

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 161
    const-string v1, "updateFileProgress"

    const-string v2, "createUpdateUI"

    const-string v3, "updateAppUpdateViews"

    filled-new-array {v2, v3, v1}, [Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    const/4 v6, 0x3

    if-ge v5, v6, :cond_2

    aget-object v6, v1, v5

    .line 162
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const/4 v8, 0x1

    if-eqz v7, :cond_0

    new-array v7, v8, [Ljava/lang/Class;

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v7, v4

    goto :goto_1

    :cond_0
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Class;

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v9, v7, v4

    sget-object v9, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v9, v7, v8

    goto :goto_1

    :cond_1
    new-array v7, v8, [Ljava/lang/Class;

    const-class v8, [Ljava/lang/Object;

    aput-object v8, v7, v4

    .line 163
    :goto_1
    invoke-virtual {v0, v6, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    invoke-virtual {p0, v7}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "tmoe.72299.update.layout."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v8, v6}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v6

    new-instance v8, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda11;

    invoke-direct {v8}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda11;-><init>()V

    invoke-interface {v6, v8}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 167
    invoke-virtual {p0, v7}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z

    .line 161
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 169
    :cond_2
    const-string v0, "org.telegram.ui.LaunchActivity"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "onResume"

    new-array v2, v4, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 170
    invoke-virtual {p0, v0}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    const-string v2, "tmoe.72299.update.resume"

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    new-instance v2, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda12;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda12;-><init>()V

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 174
    invoke-virtual {p0, v0}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z

    .line 175
    return-void
.end method

.method public static install(Lio/github/libxposed/api/XposedModule;Ljava/lang/ClassLoader;)V
    .locals 21

    .line 50
    move-object/from16 v7, p0

    const-string v8, "org.telegram.messenger.MessageObject"

    sput-object p1, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->loader:Ljava/lang/ClassLoader;

    .line 51
    sput-object v7, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->runtimeModule:Lio/github/libxposed/api/XposedModule;

    .line 52
    invoke-static/range {p0 .. p0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->registerSelfTestLifecycle(Lio/github/libxposed/api/XposedModule;)V

    .line 54
    const/4 v9, 0x0

    :try_start_0
    const-string v0, "org.telegram.messenger.ApplicationLoader"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    const-string v0, "org.telegram.tgnet.TLRPC$TL_help_appUpdate"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 55
    const-string v2, "org.telegram.messenger.SharedConfig"

    const-string v3, "isAppUpdateAvailable"

    const-string v4, "ProhibitUpdates"

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/Class;

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v6}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->register(Lio/github/libxposed/api/XposedModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;)V

    .line 56
    const-string v2, "org.telegram.messenger.SharedConfig"

    const-string v3, "setNewAppVersionAvailable"

    const-string v4, "ProhibitUpdates"

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v6

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v6}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->register(Lio/github/libxposed/api/XposedModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;)V

    .line 58
    const-string v2, "org.telegram.messenger.ApplicationLoader"

    const-string v3, "showUpdateAppPopup"

    const-string v4, "ProhibitUpdates"

    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    const-class v1, Landroid/content/Context;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v1, v0, v6}, [Ljava/lang/Class;

    move-result-object v6

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v6}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->register(Lio/github/libxposed/api/XposedModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;)V

    .line 59
    const-string v2, "org.telegram.messenger.ApplicationLoaderImpl"

    const-string v3, "showUpdateAppPopup"

    const-string v4, "ProhibitUpdates"

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    const-class v1, Landroid/content/Context;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v1, v0, v6}, [Ljava/lang/Class;

    move-result-object v6

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v6}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->register(Lio/github/libxposed/api/XposedModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;)V

    .line 60
    const-string v2, "org.telegram.messenger.ApplicationLoader"

    const-string v3, "showCustomUpdateAppPopup"

    const-string v4, "ProhibitUpdates"

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    const-class v1, Landroid/content/Context;

    const-string v6, "org.telegram.messenger.BetaUpdate"

    invoke-static {v6}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v1, v6, v10}, [Ljava/lang/Class;

    move-result-object v6

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v6}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->register(Lio/github/libxposed/api/XposedModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;)V

    .line 61
    const-string v2, "org.telegram.messenger.ApplicationLoader"

    const-string v3, "checkForUpdates"

    const-string v4, "ProhibitUpdates"

    new-array v6, v9, [Ljava/lang/Class;

    const/4 v5, 0x0

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v6}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->register(Lio/github/libxposed/api/XposedModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;)V

    .line 62
    const-string v2, "org.telegram.messenger.ApplicationLoaderImpl"

    const-string v3, "checkForUpdatesInternal"

    const-string v4, "ProhibitUpdates"

    new-array v6, v9, [Ljava/lang/Class;

    const/4 v5, 0x0

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v6}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->register(Lio/github/libxposed/api/XposedModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;)V

    .line 63
    const-string v2, "org.telegram.ui.LaunchActivity"

    const-string v3, "M0"

    const-string v4, "ProhibitUpdates"

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v1, v0, v5}, [Ljava/lang/Class;

    move-result-object v6

    const/4 v5, 0x0

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v6}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->register(Lio/github/libxposed/api/XposedModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;)V

    .line 64
    const-string v2, "org.telegram.ui.LaunchActivity"

    const-string v3, "z"

    const-string v4, "ProhibitUpdates"

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v6

    const/4 v5, 0x0

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v6}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->register(Lio/github/libxposed/api/XposedModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;)V

    .line 65
    invoke-static/range {p0 .. p0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->hookUpdates(Lio/github/libxposed/api/XposedModule;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    goto :goto_0

    :catchall_0
    move-exception v0

    const-string v1, "update-family"

    invoke-static {v1, v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->failed(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 69
    :goto_0
    :try_start_1
    const-string v2, "org.telegram.ui.Components.m21"

    const-string v3, "c"

    const-string v4, "ProhibitSpoilers"

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/Class;

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v6}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->register(Lio/github/libxposed/api/XposedModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;)V

    .line 70
    const-string v0, "rg.g"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "a"

    const-class v10, Landroid/view/View;

    const-class v11, Landroid/text/Layout;

    sget-object v12, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v13, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-class v14, Landroid/text/Spanned;

    const-class v15, Ljava/util/Stack;

    const-class v16, Ljava/util/List;

    const-class v17, Ljava/util/ArrayList;

    filled-new-array/range {v10 .. v17}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 71
    invoke-virtual {v7, v0}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    const-string v2, "tmoe.72299.text_spoilers"

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    new-instance v2, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda2;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda2;-><init>()V

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 75
    invoke-virtual {v7, v0}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 76
    goto :goto_1

    :catchall_1
    move-exception v0

    const-string v1, "text-spoilers"

    invoke-static {v1, v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->failed(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 79
    :goto_1
    :try_start_2
    const-string v0, "getRecentReactions"

    const-string v1, "getSavedReactions"

    const-string v2, "getTopReactions"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    move v1, v9

    :goto_2
    const/4 v2, 0x3

    if-ge v1, v2, :cond_0

    aget-object v2, v0, v1

    .line 80
    const-string v3, "org.telegram.messenger.MediaDataController"

    invoke-static {v3}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    new-array v4, v9, [Ljava/lang/Class;

    invoke-virtual {v3, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 81
    invoke-virtual {v7, v3}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "tmoe.72299.reactions."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v2

    new-instance v4, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda3;

    invoke-direct {v4}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda3;-><init>()V

    invoke-interface {v2, v4}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    invoke-virtual {v7, v3}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z

    .line 79
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 83
    :cond_0
    invoke-static {v8}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "org.telegram.ui.ActionBar.r2"

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v15

    const-string v1, "vf.p0"

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "org.telegram.ui.Components.yl0"

    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 84
    const-string v3, "org.telegram.messenger.SendMessagesHelper"

    invoke-static {v3}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-string v4, "sendReaction"

    const-class v11, Ljava/util/ArrayList;

    sget-object v13, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    sget-object v14, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const-class v16, Ljava/lang/Runnable;

    move-object v10, v0

    move-object v12, v1

    filled-new-array/range {v10 .. v16}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 85
    invoke-virtual {v7, v3}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v4

    const-string v5, "tmoe.72299.reactions.send"

    invoke-interface {v4, v5}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v4

    new-instance v5, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda4;

    invoke-direct {v5}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda4;-><init>()V

    invoke-interface {v4, v5}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 88
    invoke-virtual {v7, v3}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z

    .line 89
    const-string v3, "org.telegram.ui.ko"

    invoke-static {v3}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-string v4, "eb"

    const-class v10, Landroid/view/View;

    const-class v13, Landroid/view/View;

    sget-object v14, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    sget-object v15, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    sget-object v17, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    sget-object v18, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    sget-object v19, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    sget-object v20, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object v11, v0

    move-object v12, v2

    move-object/from16 v16, v1

    filled-new-array/range {v10 .. v20}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v3, v4, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 90
    invoke-virtual {v7, v1}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v3

    const-string v4, "tmoe.72299.reactions.click"

    invoke-interface {v3, v4}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v3

    new-instance v4, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda5;

    invoke-direct {v4}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda5;-><init>()V

    invoke-interface {v3, v4}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    invoke-virtual {v7, v1}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z

    .line 91
    const-string v1, "p"

    const-string v3, "org.telegram.tgnet.TLRPC$ChatFull"

    invoke-static {v3}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v0, v3, v4}, [Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v2, v1, v0}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 92
    invoke-virtual {v7, v0}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    const-string v2, "tmoe.72299.reactions.layout"

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    new-instance v2, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda6;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda6;-><init>()V

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 96
    invoke-virtual {v7, v0}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 97
    goto :goto_3

    :catchall_2
    move-exception v0

    const-string v1, "reaction-family"

    invoke-static {v1, v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->failed(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 99
    :goto_3
    :try_start_3
    invoke-static {v8}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "org.telegram.tgnet.TLRPC$Document"

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 100
    const-string v2, "org.telegram.messenger.MessageObject"

    const-string v3, "getPremiumStickerAnimation"

    const-string v4, "DisablePremiumStickerAnimation"

    filled-new-array {v8}, [Ljava/lang/Class;

    move-result-object v6

    const/4 v5, 0x0

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v6}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->register(Lio/github/libxposed/api/XposedModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;)V

    .line 101
    const-string v2, "org.telegram.messenger.MessageObject"

    const-string v3, "getPremiumStickerAnimation"

    const-string v4, "DisablePremiumStickerAnimation"

    new-array v6, v9, [Ljava/lang/Class;

    const/4 v5, 0x0

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v6}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->register(Lio/github/libxposed/api/XposedModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;)V

    .line 102
    const-string v1, "org.telegram.ui.nz"

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "d"

    const-class v10, Ljava/lang/String;

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v14, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v15, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    sget-object v16, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    sget-object v17, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    sget-object v18, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    sget-object v19, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object v12, v8

    move-object v13, v0

    filled-new-array/range {v10 .. v19}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 103
    invoke-virtual {v7, v1}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v2

    const-string v3, "tmoe.72299.premium.effect"

    invoke-interface {v2, v3}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v2

    new-instance v3, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda7;

    invoke-direct {v3, v0, v8}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda7;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    invoke-interface {v2, v3}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 110
    invoke-virtual {v7, v1}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 111
    goto :goto_4

    :catchall_3
    move-exception v0

    const-string v1, "premium-effect"

    invoke-static {v1, v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->failed(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 113
    :goto_4
    :try_start_4
    const-string v0, "org.telegram.ui.Components.ap"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "onMeasure"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v2, v3}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 114
    invoke-virtual {v7, v0}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    const-string v2, "tmoe.72299.greetings.real_children"

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    new-instance v2, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda8;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda8;-><init>()V

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 120
    invoke-virtual {v7, v0}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 121
    goto :goto_5

    :catchall_4
    move-exception v0

    const-string v1, "greeting-view"

    invoke-static {v1, v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->failed(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 122
    :goto_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "EXACT_INSTALL_DONE failures="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->failures:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TMoe-UI"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    return-void
.end method

.method static synthetic lambda$hookUpdates$11(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 157
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object v0

    sget-wide v1, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->updatePopupConstructions:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    sput-wide v1, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->updatePopupConstructions:J

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->getThisObject()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Dialog;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->lastUpdatePopup:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic lambda$hookUpdates$12(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 160
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->updateLayouts:Ljava/util/Map;

    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->getThisObject()Ljava/lang/Object;

    move-result-object p0

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic lambda$hookUpdates$13(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 164
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->getThisObject()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->updateLayouts:Ljava/util/Map;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    const-string v1, "ProhibitUpdates"

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->removeUpdateStrip(Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0

    .line 166
    :cond_0
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$hookUpdates$14(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 171
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->getThisObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    sget-object v1, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->activities:Ljava/util/Map;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    const-string v1, "ProhibitUpdates"

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->hideMandatory(Landroid/app/Activity;)V

    .line 173
    :cond_0
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->hideMandatory(Landroid/app/Activity;)V

    :cond_1
    return-object p0
.end method

.method static synthetic lambda$install$1(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 72
    const-string v0, "ProhibitSpoilers"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 73
    :cond_0
    const/4 v0, 0x6

    invoke-interface {p0, v0}, Lio/github/libxposed/api/XposedInterface$Chain;->getArg(I)Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_1

    check-cast p0, Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 74
    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method static synthetic lambda$install$2(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 81
    const-string v0, "ProhibitEnableReactions"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method static synthetic lambda$install$3(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 86
    const-string v0, "ProhibitEnableReactions"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 87
    :cond_0
    const/4 v0, 0x6

    invoke-interface {p0, v0}, Lio/github/libxposed/api/XposedInterface$Chain;->getArg(I)Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Ljava/lang/Runnable;

    if-eqz v0, :cond_1

    check-cast p0, Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method static synthetic lambda$install$4(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 90
    const-string v0, "ProhibitEnableReactions"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method static synthetic lambda$install$5(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 93
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->getThisObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 94
    const-string v1, "ProhibitEnableReactions"

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->hideReaction(Landroid/view/View;)V

    const/4 p0, 0x0

    return-object p0

    .line 95
    :cond_0
    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->restoreReaction(Landroid/view/View;)V

    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$install$6(Ljava/lang/Class;Ljava/lang/Class;Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 104
    const-string v0, "DisablePremiumStickerAnimation"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 105
    const/4 v0, 0x3

    invoke-interface {p2, v0}, Lio/github/libxposed/api/XposedInterface$Chain;->getArg(I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x2

    invoke-interface {p2, v1}, Lio/github/libxposed/api/XposedInterface$Chain;->getArg(I)Ljava/lang/Object;

    move-result-object v1

    .line 106
    const-string v2, "isPremiumSticker"

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    new-array p1, v3, [Ljava/lang/Class;

    invoke-virtual {p0, v2, p1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array p1, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_1

    filled-new-array {p1}, [Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p0, v2, p1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    const/4 p1, 0x0

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    move p0, v3

    .line 107
    :goto_0
    if-eqz p0, :cond_2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    .line 109
    :cond_2
    invoke-interface {p2}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$install$7(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 115
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->getThisObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 116
    const-string v1, "ProhibitChatGreetings"

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->restoreGreeting(Landroid/view/View;)V

    .line 117
    :cond_0
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    .line 118
    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->hideGreeting(Landroid/view/View;)V

    .line 119
    :cond_1
    return-object p0
.end method

.method static synthetic lambda$maybeRunExplicitTest$10(Landroid/app/Activity;)V
    .locals 1

    .line 151
    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->run(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object p0

    .line 152
    const-string v0, "TMoe-TEST"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    return-void
.end method

.method static synthetic lambda$register$0(Ljava/lang/String;Ljava/lang/Object;Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 40
    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    invoke-interface {p2}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 41
    :cond_0
    return-object p1
.end method

.method static synthetic lambda$registerSelfTestLifecycle$8(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 128
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object v0

    .line 129
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->getThisObject()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->maybeRunExplicitTest(Landroid/app/Activity;)V

    .line 130
    return-object v0
.end method

.method static synthetic lambda$registerSelfTestLifecycle$9(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 137
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object v0

    .line 138
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->getThisObject()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    .line 139
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "org.telegram.ui.LaunchActivity"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->maybeRunExplicitTest(Landroid/app/Activity;)V

    .line 140
    :cond_0
    return-object v0
.end method

.method private static maybeRunExplicitTest(Landroid/app/Activity;)V
    .locals 4

    .line 146
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "tmoe_selftest_nonce"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 147
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    sget-object v2, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->lastTestNonce:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 148
    :cond_0
    sput-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->lastTestNonce:Ljava/lang/String;

    .line 149
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 150
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;)V

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 154
    return-void

    .line 147
    :cond_1
    :goto_0
    return-void
.end method

.method public static onToggleChanged(Ljava/lang/String;)V
    .locals 7

    .line 188
    const-string v0, "ProhibitEnableReactions"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->reactionViews:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    sget-object v2, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->reactionViews:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->restoreReaction(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 189
    :cond_1
    :goto_1
    const-string v0, "ProhibitChatGreetings"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    sget-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->greetingViews:Ljava/util/Map;

    monitor-enter v0

    :try_start_1
    new-instance v1, Ljava/util/ArrayList;

    sget-object v2, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->greetingViews:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->restoreGreeting(Landroid/view/View;)V

    goto :goto_2

    :cond_2
    monitor-exit v0

    goto :goto_3

    :catchall_1
    move-exception p0

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p0

    .line 190
    :cond_3
    :goto_3
    const-string v0, "ProhibitUpdates"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 191
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->updateLayouts:Ljava/util/Map;

    monitor-enter v0

    :try_start_2
    new-instance v1, Ljava/util/ArrayList;

    sget-object v2, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->updateLayouts:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    :try_start_3
    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->removeUpdateStrip(Ljava/lang/Object;)V

    goto :goto_4

    :cond_4
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "updateAppUpdateViews"

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v5, v6}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->account()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    filled-new-array {v4, v5}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_4

    :catchall_2
    move-exception v2

    :try_start_4
    const-string v3, "TMoe-UI"

    const-string v4, "refresh update UI"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4

    :cond_5
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 192
    sget-object v1, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->activities:Ljava/util/Map;

    monitor-enter v1

    :try_start_5
    new-instance v0, Ljava/util/ArrayList;

    sget-object v2, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->activities:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->hideMandatory(Landroid/app/Activity;)V

    goto :goto_5

    :cond_7
    monitor-exit v1

    goto :goto_6

    :catchall_3
    move-exception p0

    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    throw p0

    .line 191
    :catchall_4
    move-exception p0

    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    throw p0

    .line 194
    :cond_8
    :goto_6
    return-void
.end method

.method private static varargs register(Lio/github/libxposed/api/XposedModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/github/libxposed/api/XposedModule;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 38
    const-string v0, "."

    :try_start_0
    invoke-static {p1}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, p2, p5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 39
    invoke-virtual {p0, v1}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "tmoe.72299."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v4, p5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v2

    sget-object v3, Lio/github/libxposed/api/XposedInterface$ExceptionMode;->PROTECTIVE:Lio/github/libxposed/api/XposedInterface$ExceptionMode;

    invoke-interface {v2, v3}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setExceptionMode(Lio/github/libxposed/api/XposedInterface$ExceptionMode;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v2

    new-instance v3, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda0;

    invoke-direct {v3, p3, p4}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v2, v3}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 43
    invoke-virtual {p0, v1}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z

    .line 44
    const-string p0, "TMoe-UI"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "EXACT_HOOK "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string p4, "/"

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    array-length p4, p5

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p0, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    goto :goto_0

    :catchall_0
    move-exception p0

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->failed(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 46
    :goto_0
    return-void
.end method

.method private static registerSelfTestLifecycle(Lio/github/libxposed/api/XposedModule;)V
    .locals 5

    .line 126
    const-string v0, "tmoe.72299.test.explicit"

    const-string v1, "onPostResume"

    const/4 v2, 0x0

    :try_start_0
    const-string v3, "org.telegram.ui.LaunchActivity"

    invoke-static {v3}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    new-array v4, v2, [Ljava/lang/Class;

    invoke-virtual {v3, v1, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 127
    invoke-virtual {p0, v3}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v3

    invoke-interface {v3, v0}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v3

    new-instance v4, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda13;

    invoke-direct {v4}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda13;-><init>()V

    invoke-interface {v3, v4}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    goto :goto_0

    .line 132
    :catchall_0
    move-exception v3

    .line 135
    :try_start_1
    const-class v3, Landroid/app/Activity;

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v3, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 136
    invoke-virtual {p0, v1}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object p0

    invoke-interface {p0, v0}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object p0

    new-instance v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda14;

    invoke-direct {v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda14;-><init>()V

    invoke-interface {p0, v0}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 142
    goto :goto_0

    :catchall_1
    move-exception p0

    const-string v0, "explicit-test-lifecycle"

    invoke-static {v0, p0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->failed(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 144
    :goto_0
    return-void
.end method

.method static removeUpdateStrip(Ljava/lang/Object;)V
    .locals 5

    .line 178
    const-string v0, "a"

    :try_start_0
    invoke-static {p0, v0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Landroid/view/View;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->cancel()V

    invoke-virtual {v1}, Landroid/view/View;->clearAnimation()V

    invoke-virtual {v1, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-virtual {v2}, Landroid/view/ViewGroup;->requestLayout()V

    .line 179
    :cond_0
    const-string v1, "b"

    const-string v2, "c"

    const-string v4, "d"

    filled-new-array {v0, v1, v2, v4}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x4

    if-ge v1, v2, :cond_1

    aget-object v2, v0, v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4, v2}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 180
    :cond_1
    goto :goto_1

    :catchall_0
    move-exception p0

    const-string v0, "TMoe-UI"

    const-string v1, "remove update strip failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 181
    :goto_1
    return-void
.end method

.method private static restoreGreeting(Landroid/view/View;)V
    .locals 3

    .line 186
    :try_start_0
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->greetingViews:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    if-eqz v0, :cond_0

    const-string v1, "c"

    invoke-static {p0, v1}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    const/4 v2, 0x0

    aget v2, v0, v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    const-string v1, "h"

    invoke-static {p0, v1}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    const/4 v1, 0x1

    aget v0, v0, v1

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    const-string v0, "TMoe-UI"

    const-string v1, "restore greeting"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method private static restoreReaction(Landroid/view/View;)V
    .locals 2

    .line 184
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->reactionViews:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->reactionViews:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-eqz v1, :cond_0

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void
.end method
