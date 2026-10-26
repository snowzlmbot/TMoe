.class public final Lcc/ioctl/tmoe/startup/ModernRuntimeTests;
.super Ljava/lang/Object;
.source "ModernRuntimeTests.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static c(Ljava/lang/String;)Ljava/lang/Class;
    .locals 0
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
            Ljava/lang/Exception;
        }
    .end annotation

    .line 24
    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method

.method private static varargs call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 34
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->runtimeModule:Lio/github/libxposed/api/XposedModule;

    invoke-virtual {v0, p0}, Lio/github/libxposed/api/XposedModule;->getInvoker(Ljava/lang/reflect/Method;)Lio/github/libxposed/api/XposedInterface$Invoker;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Lio/github/libxposed/api/XposedInterface$Invoker;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static enabled(Ljava/lang/String;Z)V
    .locals 0

    .line 36
    invoke-static {p0, p1}, Lcc/ioctl/tmoe/startup/ModernPreferences;->setTestOverride(Ljava/lang/String;Z)V

    return-void
.end method

.method private static f(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-static {p0, p1}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    return-object p0
.end method

.method private static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 27
    invoke-static {p0, p1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->f(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static getStatic(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 186
    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    invoke-static {p0, p1}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static instance(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 32
    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/Class;

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$run$0()Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 44
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-class v1, [I

    filled-new-array {v0, v1}, [Ljava/lang/Class;

    move-result-object v0

    const-string v1, "org.telegram.messenger.LocaleController"

    const-string v2, "formatShortNumber"

    invoke-static {v1, v2, v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 45
    const-string v1, "ChannelDetailNumbers"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    const/16 v3, 0x3039

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    new-array v6, v5, [I

    filled-new-array {v4, v6}, [Ljava/lang/Object;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v0, v7, v6}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 46
    invoke-static {v1, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    new-array v1, v5, [I

    filled-new-array {v4, v1}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v0, v7, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 47
    const-string v4, "12345"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    aget v1, v1, v2

    if-ne v1, v3, :cond_0

    move v2, v5

    :cond_0
    const-string v1, "formatter did not change"

    invoke-static {v2, v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$run$1()Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 50
    const-string v0, "org.telegram.messenger.MessagesController"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->raw(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "org.telegram.tgnet.TLRPC$TL_chat"

    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->instance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const-string v5, "noforwards"

    invoke-static {v2, v5, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 51
    const-string v4, "org.telegram.tgnet.TLRPC$Chat"

    invoke-static {v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Class;

    move-result-object v4

    const-string v5, "isChatNoForwards"

    invoke-static {v0, v5, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 52
    const-string v4, "AntiAntiForward"

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v6

    invoke-static {v0, v1, v6}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v4, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 53
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v6}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    move v3, v5

    :goto_0
    const-string v1, "protected chat unchanged"

    invoke-static {v3, v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$run$10(Landroid/app/Activity;)Ljava/lang/String;
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 121
    move-object/from16 v0, p0

    const-string v1, "dismissInternal"

    const-string v2, "ProhibitUpdates"

    const-string v3, "org.telegram.messenger.ApplicationLoader"

    const-string v4, "applicationLoaderInstance"

    invoke-static {v3, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->getStatic(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    const-string v4, "org.telegram.tgnet.TLRPC$TL_help_appUpdate"

    invoke-static {v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->instance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 122
    const-class v6, Landroid/content/Context;

    invoke-static {v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v6, v4, v7}, [Ljava/lang/Class;

    move-result-object v4

    const-string v6, "org.telegram.messenger.ApplicationLoaderImpl"

    const-string v7, "showUpdateAppPopup"

    invoke-static {v6, v7, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 123
    const-string v6, "org.telegram.tgnet.TLRPC$TL_document"

    invoke-static {v6}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->instance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    const-string v7, "document"

    invoke-static {v5, v7, v6}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v6, "version"

    const-string v7, "99.99-local-test"

    invoke-static {v5, v6, v7}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v6, "text"

    const-string v7, "Local test: no download requested"

    invoke-static {v5, v6, v7}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 124
    sget-wide v6, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->updatePopupConstructions:J

    .line 125
    nop

    .line 127
    const/4 v8, 0x0

    const/4 v9, 0x0

    :try_start_0
    invoke-static {v2, v8}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->account()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    filled-new-array {v0, v5, v10}, [Ljava/lang/Object;

    move-result-object v10

    invoke-static {v4, v3, v10}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v10, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->lastUpdatePopup:Ljava/lang/ref/WeakReference;

    invoke-virtual {v10}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/app/Dialog;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 128
    :try_start_1
    sget-wide v11, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->updatePopupConstructions:J

    const-wide/16 v13, 0x1

    add-long/2addr v13, v6

    cmp-long v9, v11, v13

    const/4 v11, 0x1

    if-nez v9, :cond_0

    if-eqz v10, :cond_0

    invoke-virtual {v10}, Landroid/app/Dialog;->isShowing()Z

    move-result v9

    if-eqz v9, :cond_0

    move v9, v11

    goto :goto_0

    :cond_0
    move v9, v8

    :goto_0
    const-string v12, "original popup was not visible"

    invoke-static {v9, v12}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    new-array v12, v8, [Ljava/lang/Class;

    invoke-virtual {v9, v1, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    new-array v12, v8, [Ljava/lang/Object;

    invoke-virtual {v9, v10, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    invoke-static {v2, v11}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->account()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    filled-new-array {v0, v5, v9}, [Ljava/lang/Object;

    move-result-object v9

    invoke-static {v4, v3, v9}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .line 130
    sget-object v12, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v12, v9}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    sget-wide v15, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->updatePopupConstructions:J

    cmp-long v9, v15, v13

    if-nez v9, :cond_1

    invoke-virtual {v10}, Landroid/app/Dialog;->isShowing()Z

    move-result v9

    if-nez v9, :cond_1

    move v9, v11

    goto :goto_1

    :cond_1
    move v9, v8

    :goto_1
    const-string v12, "popup still created while enabled"

    invoke-static {v9, v12}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    .line 131
    invoke-static {v2, v8}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->account()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v0, v5, v2}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v4, v3, v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->lastUpdatePopup:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Landroid/app/Dialog;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 132
    :try_start_2
    sget-wide v2, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->updatePopupConstructions:J

    const-wide/16 v4, 0x2

    add-long/2addr v6, v4

    cmp-long v0, v2, v6

    if-nez v0, :cond_2

    if-eqz v9, :cond_2

    invoke-virtual {v9}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_2

    :cond_2
    move v11, v8

    :goto_2
    const-string v0, "popup did not restore"

    invoke-static {v11, v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    .line 133
    const-string v0, "real update sheet visible -> no construction -> visible; dismissed, no download clicked"
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 134
    if-eqz v9, :cond_3

    invoke-virtual {v9}, Landroid/app/Dialog;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    new-array v3, v8, [Ljava/lang/Class;

    invoke-virtual {v2, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v8, [Ljava/lang/Object;

    invoke-virtual {v1, v9, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    :cond_3
    return-object v0

    .line 134
    :catchall_0
    move-exception v0

    move-object v9, v10

    goto :goto_3

    :catchall_1
    move-exception v0

    :goto_3
    if-eqz v9, :cond_4

    invoke-virtual {v9}, Landroid/app/Dialog;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    new-array v3, v8, [Ljava/lang/Class;

    invoke-virtual {v2, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v8, [Ljava/lang/Object;

    invoke-virtual {v1, v9, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    throw v0
.end method

.method static synthetic lambda$run$11(Landroid/app/Activity;)Ljava/lang/String;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 137
    const-string v0, "ProhibitUpdates"

    const-string v1, "org.telegram.tgnet.TLRPC$TL_help_appUpdate"

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->instance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const-string v5, "can_not_skip"

    invoke-static {v2, v5, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "text"

    const-string v5, "local test only"

    invoke-static {v2, v4, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 138
    const-string v4, "C0"

    invoke-static {p0, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    const/4 v6, 0x0

    .line 142
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    .line 138
    if-nez v5, :cond_0

    move v8, v3

    goto :goto_0

    :cond_0
    move v8, v6

    :goto_0
    const-string v9, "existing mandatory update view: skip destructive synthetic test"

    invoke-static {v8, v9}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    .line 139
    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sget-object v9, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v8, v1, v9}, [Ljava/lang/Class;

    move-result-object v1

    const-string v8, "org.telegram.ui.LaunchActivity"

    const-string v9, "M0"

    invoke-static {v8, v9, v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 140
    nop

    .line 142
    const/16 v8, 0x8

    :try_start_0
    invoke-static {v0, v6}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->account()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    filled-new-array {v9, v2, v7}, [Ljava/lang/Object;

    move-result-object v9

    invoke-static {v1, p0, v9}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    .line 143
    if-eqz v9, :cond_1

    invoke-virtual {v9}, Landroid/view/View;->getVisibility()I

    move-result v10

    if-nez v10, :cond_1

    move v10, v3

    goto :goto_1

    :cond_1
    move v10, v6

    :goto_1
    const-string v11, "original mandatory overlay not shown"

    invoke-static {v10, v11}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    invoke-virtual {v9}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    check-cast v10, Landroid/view/ViewGroup;

    invoke-virtual {v9, v8}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v10, v9}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    const/4 v9, 0x0

    invoke-static {p0, v4, v9}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 144
    invoke-static {v0, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->account()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0, v2, v7}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v1, p0, v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_2

    goto :goto_2

    :cond_2
    move v3, v6

    :goto_2
    const-string v0, "mandatory overlay created while blocked"

    invoke-static {v3, v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    .line 145
    const-string v0, "real mandatory full-screen update visible -> no creation; synthetic overlay removed and original activity state restored"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    invoke-static {p0, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Landroid/view/View;

    if-eqz v2, :cond_3

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1, v8}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_3
    invoke-static {p0, v4, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 145
    return-object v0

    .line 146
    :catchall_0
    move-exception v0

    invoke-static {p0, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Landroid/view/View;

    if-eqz v2, :cond_4

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1, v8}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_4

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_4
    invoke-static {p0, v4, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method static synthetic lambda$run$12()Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 149
    const-string v0, "org.telegram.messenger.MessagesController"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->raw(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "z.f"

    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->instance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 150
    const-string v4, "org.telegram.messenger.MessagesController$SponsoredMessagesInfo"

    invoke-static {v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 151
    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    const-string v7, "loading"

    invoke-static {v4, v7, v6}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    const-string v7, "loadTime"

    invoke-static {v4, v7, v6}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 152
    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-class v6, Ljava/lang/Object;

    sget-object v7, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    filled-new-array {v6, v7}, [Ljava/lang/Class;

    move-result-object v6

    const-string v7, "k"

    invoke-virtual {v2, v7, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const-wide/32 v6, 0xd431

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    filled-new-array {v4, v6}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v2, v3, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "sponsoredMessages"

    invoke-static {v1, v2, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 153
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v2

    const-string v3, "getSponsoredMessages"

    invoke-static {v0, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 154
    const-string v2, "HideSponsoredMsg"

    invoke-static {v2, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v0, v1, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v7, 0x1

    invoke-static {v2, v7}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v8

    invoke-static {v0, v1, v8}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v2, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 155
    if-ne v3, v4, :cond_0

    if-nez v8, :cond_0

    if-ne v0, v4, :cond_0

    move v5, v7

    :cond_0
    const-string v0, "cached ad model not filtered reversibly"

    invoke-static {v5, v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    const-string v0, "existing sponsored model -> null -> original, no network request"

    return-object v0
.end method

.method static synthetic lambda$run$13(Landroid/app/Activity;)Ljava/lang/String;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 158
    const-string v0, "org.telegram.ui.Components.ap"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 159
    const-string v1, "ProhibitChatGreetings"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    const-string v3, "org.telegram.ui.aj"

    invoke-static {v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-string v4, "org.telegram.ui.ko"

    invoke-static {v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-class v5, Landroid/app/Activity;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-string v7, "org.telegram.tgnet.TLRPC$Document"

    invoke-static {v7}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const-string v8, "org.telegram.ui.ActionBar.j6"

    invoke-static {v8}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    filled-new-array {v4, v5, v6, v7, v8}, [Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->account()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "org.telegram.tgnet.TLRPC$TL_document"

    invoke-static {v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->instance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    const/4 v6, 0x0

    filled-new-array {v6, p0, v4, v5, v6}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 160
    move-object v3, p0

    check-cast v3, Landroid/view/View;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v3, v4}, [Ljava/lang/Class;

    move-result-object v3

    const-string v4, "onMeasure"

    invoke-static {v0, v4, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 161
    const/16 v3, 0x3e8

    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    const/16 v4, 0x708

    const/high16 v5, -0x80000000

    invoke-static {v4, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 162
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v5, v6}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v0, p0, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "c"

    invoke-static {p0, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    const-string v6, "h"

    invoke-static {p0, v6}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v7

    .line 163
    const/4 v8, 0x1

    invoke-static {v1, v8}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    filled-new-array {v9, v10}, [Ljava/lang/Object;

    move-result-object v9

    invoke-static {v0, p0, v9}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v9

    if-nez v7, :cond_0

    const/16 v7, 0x8

    if-ne v9, v7, :cond_0

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-ne v5, v7, :cond_0

    move v5, v8

    goto :goto_0

    :cond_0
    move v5, v2

    :goto_0
    const-string v7, "greeting children were not hidden"

    invoke-static {v5, v7}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    .line 164
    invoke-static {v1, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v1, v3}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, p0, v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result p0

    if-nez p0, :cond_1

    move v2, v8

    :cond_1
    const-string p0, "greeting view did not restore"

    invoke-static {v2, p0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    const-string p0, "real sticker View VISIBLE -> GONE -> VISIBLE; description removed"

    return-object p0
.end method

.method static synthetic lambda$run$14([I)V
    .locals 2

    .line 167
    const/4 v0, 0x0

    aget v1, p0, v0

    add-int/lit8 v1, v1, 0x1

    aput v1, p0, v0

    return-void
.end method

.method static synthetic lambda$run$15()Ljava/lang/String;
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 167
    const-string v0, "org.telegram.messenger.SendMessagesHelper"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->raw(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    .line 169
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    .line 167
    filled-new-array {v2}, [I

    move-result-object v11

    new-instance v12, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda16;

    invoke-direct {v12, v11}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda16;-><init>([I)V

    .line 168
    const-string v3, "org.telegram.messenger.MessageObject"

    invoke-static {v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    const-class v14, Ljava/util/ArrayList;

    const-string v3, "vf.p0"

    invoke-static {v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v15

    sget-object v16, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    sget-object v17, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const-string v3, "org.telegram.ui.ActionBar.r2"

    invoke-static {v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v18

    const-class v19, Ljava/lang/Runnable;

    filled-new-array/range {v13 .. v19}, [Ljava/lang/Class;

    move-result-object v3

    const-string v4, "sendReaction"

    invoke-static {v0, v4, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 169
    const-string v13, "ProhibitEnableReactions"

    invoke-static {v13, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v8, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v6, v10

    move-object v7, v10

    move-object v9, v12

    filled-new-array/range {v3 .. v9}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v0, v1, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    aget v14, v11, v2

    .line 170
    const/4 v15, 0x1

    invoke-static {v13, v15}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    filled-new-array/range {v3 .. v9}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v0, v1, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    aget v0, v11, v2

    .line 171
    if-nez v14, :cond_0

    if-ne v0, v15, :cond_0

    move v2, v15

    :cond_0
    const-string v0, "send hook did not short-circuit/complete callback"

    invoke-static {v2, v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    const-string v0, "null-message safety sample: original no-op -> blocked callback completed; no sendRequest"

    return-object v0
.end method

.method static synthetic lambda$run$16()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 174
    const-string v0, "org.telegram.ui.hq"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->raw(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "R"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const-string v4, "Q"

    invoke-static {v1, v4, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v3, "e"

    new-array v4, v2, [Ljava/lang/Class;

    invoke-static {v0, v3, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 175
    const-string v3, "ProhibitChannelSwitching"

    invoke-static {v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v3, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 176
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v4}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v2, v5

    :cond_0
    const-string v1, "channel panel unchanged"

    invoke-static {v2, v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$run$2()Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 56
    const-string v0, "org.telegram.messenger.MessageObject"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->raw(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "org.telegram.tgnet.TLRPC$TL_message"

    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->instance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "org.telegram.tgnet.TLRPC$TL_messageMediaPhoto"

    invoke-static {v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->instance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 57
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    const-string v6, "spoiler"

    invoke-static {v3, v6, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v5, "media"

    invoke-static {v2, v5, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v3, "messageOwner"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 58
    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    const-string v5, "hasMediaSpoilers"

    invoke-static {v0, v5, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 59
    const-string v3, "ProhibitSpoilers"

    invoke-static {v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    new-array v5, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v3, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 60
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    move v4, v2

    :goto_0
    const-string v1, "media spoiler unchanged"

    invoke-static {v4, v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$run$3(Landroid/app/Activity;)Ljava/lang/String;
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 63
    const/16 v0, 0x2f

    const/16 v1, 0x2e

    const-string v2, "org.telegram.ui.Components/l21"

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->instance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const/16 v1, 0x100

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "a"

    invoke-static {v0, v2, v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 64
    const-string v1, "org.telegram.ui.Components.m21"

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v3, "org.telegram.ui.Components.l21"

    invoke-static {v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v3, v4}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    const/16 v3, 0x10

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v0, v3}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 65
    new-instance v1, Landroid/text/SpannableString;

    const-string v3, "local spoiler test"

    invoke-direct {v1, v3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v1}, Landroid/text/SpannableString;->length()I

    move-result v3

    const/16 v4, 0x21

    const/4 v11, 0x0

    invoke-virtual {v1, v0, v11, v3, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 66
    new-instance v5, Landroid/text/TextPaint;

    invoke-direct {v5}, Landroid/text/TextPaint;-><init>()V

    const/high16 v0, 0x42000000    # 32.0f

    invoke-virtual {v5, v0}, Landroid/text/TextPaint;->setTextSize(F)V

    new-instance v0, Landroid/text/StaticLayout;

    sget-object v7, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/16 v6, 0x1f4

    const/high16 v8, 0x3f800000    # 1.0f

    move-object v3, v0

    move-object v4, v1

    invoke-direct/range {v3 .. v10}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    .line 67
    const-class v12, Landroid/view/View;

    const-class v13, Landroid/text/Layout;

    sget-object v14, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v15, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-class v16, Landroid/text/Spanned;

    const-class v17, Ljava/util/Stack;

    const-class v18, Ljava/util/List;

    const-class v19, Ljava/util/ArrayList;

    filled-new-array/range {v12 .. v19}, [Ljava/lang/Class;

    move-result-object v3

    const-string v4, "rg.g"

    invoke-static {v4, v2, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 68
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    new-instance v13, Landroid/view/View;

    move-object/from16 v3, p0

    invoke-direct {v13, v3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 69
    const-string v14, "ProhibitSpoilers"

    invoke-static {v14, v11}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    const/4 v3, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    new-instance v8, Ljava/util/Stack;

    invoke-direct {v8}, Ljava/util/Stack;-><init>()V

    const/4 v10, 0x0

    move-object v3, v13

    move-object v4, v0

    move-object v5, v15

    move-object v6, v15

    move-object v7, v1

    move-object v9, v12

    filled-new-array/range {v3 .. v10}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v10, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v9

    invoke-virtual {v12}, Ljava/util/ArrayList;->clear()V

    .line 70
    const/4 v8, 0x1

    invoke-static {v14, v8}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    new-instance v14, Ljava/util/Stack;

    invoke-direct {v14}, Ljava/util/Stack;-><init>()V

    const/16 v16, 0x0

    move-object v3, v13

    move v0, v8

    move-object v8, v14

    move v1, v9

    move-object v9, v12

    move-object v13, v10

    move-object/from16 v10, v16

    filled-new-array/range {v3 .. v10}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v13, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 71
    if-lez v1, :cond_0

    if-nez v2, :cond_0

    move v11, v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "text spoiler effects not suppressed: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "/"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v11, v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "effect count "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " -> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$run$4()Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 74
    const-string v0, "org.telegram.tgnet.TLRPC$TL_document"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->instance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "org.telegram.tgnet.TLRPC$TL_videoSize"

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->instance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "type"

    const-string v3, "f"

    invoke-static {v1, v2, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 75
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v3, "video_thumbs"

    invoke-static {v0, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const-string v3, "thumbs"

    invoke-static {v0, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 76
    const-string v2, "org.telegram.tgnet.TLRPC$Document"

    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    const-string v4, "org.telegram.messenger.MessageObject"

    const-string v5, "getPremiumStickerAnimation"

    invoke-static {v4, v5, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 77
    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v2

    const-string v5, "isPremiumSticker"

    invoke-static {v4, v5, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 78
    const-string v4, "DisablePremiumStickerAnimation"

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v3, v7, v6}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v8

    invoke-static {v2, v7, v8}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 79
    const/4 v9, 0x1

    invoke-static {v4, v9}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v7, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v2, v7, v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 80
    if-ne v6, v1, :cond_0

    if-nez v3, :cond_0

    invoke-virtual {v8, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v5, v9

    :cond_0
    const-string v1, "animation or membership contract incorrect"

    invoke-static {v5, v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "effect present -> null; premium classification preserved="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$run$5()Ljava/lang/String;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 83
    const-string v0, "org.telegram.messenger.MediaDataController"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->raw(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    const-string v3, "getEnabledReactionsList"

    const-string v4, "enabledReactionsList"

    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    const-string v4, "getRecentReactions"

    const-string v5, "recentReactions"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "getSavedReactions"

    const-string v6, "savedReactions"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "getTopReactions"

    const-string v7, "topReactions"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v6

    filled-new-array {v3, v4, v5, v6}, [[Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    const/4 v6, 0x4

    if-ge v5, v6, :cond_1

    aget-object v6, v3, v5

    .line 85
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Ljava/lang/Object;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v8, 0x1

    aget-object v9, v6, v8

    invoke-static {v1, v9, v7}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    aget-object v7, v6, v4

    new-array v9, v4, [Ljava/lang/Class;

    invoke-static {v0, v7, v9}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 86
    const-string v9, "ProhibitEnableReactions"

    invoke-static {v9, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    new-array v10, v4, [Ljava/lang/Object;

    invoke-static {v7, v1, v10}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    invoke-static {v9, v8}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    new-array v9, v4, [Ljava/lang/Object;

    invoke-static {v7, v1, v9}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    .line 87
    if-ne v10, v8, :cond_0

    if-nez v7, :cond_0

    goto :goto_1

    :cond_0
    move v8, v4

    :goto_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "reaction source failed: "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget-object v9, v6, v4

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v8, v7}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    aget-object v6, v6, v4

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " 1->0; "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 88
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$run$6()Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 91
    const-string v0, "org.telegram.messenger.MediaDataController"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->raw(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const/16 v2, 0x8

    new-array v3, v2, [Ljava/util/ArrayList;

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v2, :cond_0

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    aput-object v6, v3, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 92
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const-string v5, "org.telegram.tgnet.TLRPC$TL_document"

    invoke-static {v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->instance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v5, 0x7

    aput-object v2, v3, v5

    const-string v2, "recentStickers"

    invoke-static {v1, v2, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 93
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v2

    const-string v3, "getRecentStickers"

    invoke-static {v0, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 94
    const-string v2, "HidePremiumStickerSetTab"

    invoke-static {v2, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v0, v1, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v6, 0x1

    invoke-static {v2, v6}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 95
    if-ne v3, v6, :cond_1

    if-nez v0, :cond_1

    move v4, v6

    :cond_1
    const-string v1, "premium tab source unchanged"

    invoke-static {v4, v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "premium source size "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$run$7()Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 98
    const-string v0, "ForceBlurChatAvailable"

    const-string v1, "org.telegram.messenger.SharedConfig"

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "overrideDevicePerformanceClass"

    invoke-static {v1, v2}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v4

    .line 99
    const/4 v5, 0x0

    :try_start_0
    invoke-virtual {v2, v3, v5}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v6, "canBlurChat"

    new-array v7, v5, [Ljava/lang/Class;

    invoke-static {v1, v6, v7}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-static {v0, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    new-array v6, v5, [Ljava/lang/Object;

    invoke-static {v1, v3, v6}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    const/4 v7, 0x1

    invoke-static {v0, v7}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    new-array v0, v5, [Ljava/lang/Object;

    invoke-static {v1, v3, v0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v6}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v5, v7

    :cond_0
    const-string v1, "low performance blur gate unchanged"

    invoke-static {v5, v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, " -> "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    throw v0
.end method

.method static synthetic lambda$run$8(Landroid/app/Activity;)Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 102
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const-string v1, "org.telegram.ui.Components.j81"

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Landroid/app/Activity;

    const-class v3, Landroid/view/ViewGroup;

    filled-new-array {v2, v3}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 103
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v2

    const-string v3, "createUpdateUI"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v3, v4}, [Ljava/lang/Class;

    move-result-object v3

    const-string v4, "updateAppUpdateViews"

    invoke-static {v2, v4, v3}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 104
    const-string v3, "ProhibitUpdates"

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->account()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v1, p0, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_0

    move v5, v6

    goto :goto_0

    :cond_0
    move v5, v4

    :goto_0
    const-string v7, "original update layout did not create its 44dp placeholder"

    invoke-static {v5, v7}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    .line 105
    const-string v5, "a"

    invoke-static {p0, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    iget v7, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 106
    invoke-static {v3, v6}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->account()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    filled-new-array {v8, v9}, [Ljava/lang/Object;

    move-result-object v8

    invoke-static {v2, p0, v8}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v2

    if-nez v2, :cond_1

    invoke-static {p0, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1

    move v2, v6

    goto :goto_1

    :cond_1
    move v2, v4

    :goto_1
    const-string v5, "existing update placeholder remains"

    invoke-static {v2, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    .line 107
    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->account()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, p0, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v2

    if-nez v2, :cond_2

    move v2, v6

    goto :goto_2

    :cond_2
    move v2, v4

    :goto_2
    const-string v5, "update placeholder recreated while blocked"

    invoke-static {v2, v5}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    .line 108
    invoke-static {v3, v4}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->account()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, p0, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result p0

    if-ne p0, v6, :cond_3

    move v4, v6

    :cond_3
    const-string p0, "disabling update block did not restore original create behavior"

    invoke-static {v4, p0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    .line 109
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "child count 1->0->0->1; original height="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "px; no blank placeholder"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$run$9()Ljava/lang/String;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 112
    const-string v0, " -> "

    const-string v1, "ProhibitUpdates"

    const-string v2, "org.telegram.messenger.SharedConfig"

    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "pendingAppUpdate"

    invoke-static {v2, v3}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    const-string v4, "pendingAppUpdateBuildVersion"

    invoke-static {v2, v4}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 113
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v7

    .line 115
    :try_start_0
    const-string v8, "org.telegram.tgnet.TLRPC$TL_help_appUpdate"

    invoke-static {v8}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->instance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    const-string v9, "document"

    const-string v10, "org.telegram.tgnet.TLRPC$TL_document"

    invoke-static {v10}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->instance(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v3, v5, v8}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    const v8, 0x11a6b

    invoke-virtual {v4, v5, v8}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 116
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v8, "isAppUpdateAvailable"

    const/4 v9, 0x0

    new-array v10, v9, [Ljava/lang/Class;

    invoke-static {v2, v8, v10}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-static {v1, v9}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    new-array v8, v9, [Ljava/lang/Object;

    invoke-static {v2, v5, v8}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    const/4 v10, 0x1

    invoke-static {v1, v10}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    new-array v11, v9, [Ljava/lang/Object;

    invoke-static {v2, v5, v11}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    invoke-static {v1, v9}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->enabled(Ljava/lang/String;Z)V

    new-array v1, v9, [Ljava/lang/Object;

    invoke-static {v2, v5, v1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->call(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 117
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v8}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, v11}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v9, v10

    :cond_0
    const-string v2, "update availability contract wrong"

    invoke-static {v9, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->require(ZLjava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 118
    invoke-virtual {v3, v5, v6}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v4, v5, v7}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 117
    return-object v0

    .line 118
    :catchall_0
    move-exception v0

    invoke-virtual {v3, v5, v6}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v4, v5, v7}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    throw v0
.end method

.method private static varargs method(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 33
    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    return-object p0
.end method

.method private static raw(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 29
    const-string v0, "sun.misc.Unsafe"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "theUnsafe"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 30
    const-class v2, Ljava/lang/Class;

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v2

    const-string v3, "allocateInstance"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static require(ZLjava/lang/String;)V
    .locals 0

    .line 35
    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0
.end method

.method public static run(Landroid/app/Activity;)Ljava/lang/String;
    .locals 7

    .line 41
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 42
    :try_start_0
    const-string v2, "time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v0, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v2, "host"

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "version_code"

    const v3, 0x11a6b

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v2, "test_scope"

    const-string v3, "real hooked host methods, fabricated local data; no message sends/downloads; user switches unchanged"

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "hook_failures"

    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->failures()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    .line 43
    :goto_0
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda0;-><init>()V

    const-string v3, "exact_numbers"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 49
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda7;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda7;-><init>()V

    const-string v3, "protected_chat"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 55
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda8;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda8;-><init>()V

    const-string v3, "media_spoilers"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 62
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda9;

    invoke-direct {v2, p0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda9;-><init>(Landroid/app/Activity;)V

    const-string v3, "text_spoiler_mask"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 73
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda10;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda10;-><init>()V

    const-string v3, "premium_animation_not_membership"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 82
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda11;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda11;-><init>()V

    const-string v3, "reactions_all_sources"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 90
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda12;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda12;-><init>()V

    const-string v3, "premium_sticker_tab"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 97
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda13;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda13;-><init>()V

    const-string v3, "chat_blur_low_performance"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 101
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda14;

    invoke-direct {v2, p0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda14;-><init>(Landroid/app/Activity;)V

    const-string v3, "updates_create_and_remove_44dp_placeholder"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 111
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda15;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda15;-><init>()V

    const-string v3, "updates_availability_reversible"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 120
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;)V

    const-string v3, "updates_optional_popup_blocked"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 136
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda2;-><init>(Landroid/app/Activity;)V

    const-string v3, "updates_mandatory_overlay_blocked"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 148
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda3;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda3;-><init>()V

    const-string v3, "sponsored_cached_model"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 157
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda4;-><init>(Landroid/app/Activity;)V

    const-string v3, "greeting_real_children"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 166
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda5;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda5;-><init>()V

    const-string v3, "reactions_send_boundary_no_network"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 173
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda6;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$$ExternalSyntheticLambda6;-><init>()V

    const-string v3, "channel_switch_panel"

    invoke-static {v1, v3, v2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V

    .line 180
    :try_start_1
    const-string v2, "tests"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "not_end_to_end_tested"

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    const-string v4, "video with real audio playback"

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v3

    const-string v4, "live sponsored ad from server"

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v3

    const-string v4, "greeting sticker in a real empty chat"

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 181
    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v2, v5, :cond_1

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "status"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "PASS"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_0
    add-int/lit8 v4, v4, 0x1

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    const-string v1, "passed"

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "failed"

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 182
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v2, "tmoe-modern-test.json"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance p0, Ljava/io/FileOutputStream;

    invoke-direct {p0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    const/4 v2, 0x2

    :try_start_2
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V

    .line 183
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "BEHAVIOR_TEST_RESULT "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " passed / "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " failed; report="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    return-object p0

    .line 182
    :catchall_0
    move-exception v0

    :try_start_4
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception p0

    :try_start_5
    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_3
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 184
    :catchall_2
    move-exception p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BEHAVIOR_TEST_REPORT_ERROR "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 26
    invoke-static {p0, p1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->f(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method private static test(Lorg/json/JSONArray;Ljava/lang/String;Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;)V
    .locals 3

    .line 38
    const-string v0, "status"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v2, "name"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-interface {p2}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests$Test;->run()Ljava/lang/String;

    move-result-object p1

    const-string p2, "PASS"

    invoke-virtual {v1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "evidence"

    invoke-virtual {v1, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    :try_start_1
    const-string p2, "FAIL"

    invoke-virtual {v1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "error"

    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p0

    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernPreferences;->clearTestOverrides()V

    throw p0

    :catch_0
    move-exception p1

    :goto_0
    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernPreferences;->clearTestOverrides()V

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 39
    return-void
.end method
