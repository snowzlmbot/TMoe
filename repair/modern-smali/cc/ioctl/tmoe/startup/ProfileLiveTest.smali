.class public final Lcc/ioctl/tmoe/startup/ProfileLiveTest;
.super Ljava/lang/Object;
.source "ProfileLiveTest.java"


# static fields
.field private static report:Lorg/json/JSONObject;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 18
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

    .line 20
    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method

.method private static check(ZLjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 23
    sget-object v0, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->report:Lorg/json/JSONObject;

    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0
.end method

.method private static countCells(Landroid/view/ViewGroup;Ljava/lang/String;)I
    .locals 5

    .line 81
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u7528\u6237ID "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\uff0c"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method private static findCell(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/view/View;
    .locals 5

    .line 80
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u7528\u6237ID "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\uff0c"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$openAndTest$0(Landroid/app/Activity;Ljava/lang/Object;J)V
    .locals 1

    .line 40
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->runOnVisible(Landroid/app/Activity;Ljava/lang/Object;JI)V

    return-void
.end method

.method static synthetic lambda$runOnVisible$1(Landroid/app/Activity;Ljava/lang/Object;JI)V
    .locals 0

    .line 52
    add-int/lit8 p4, p4, 0x1

    invoke-static {p0, p1, p2, p3, p4}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->runOnVisible(Landroid/app/Activity;Ljava/lang/Object;JI)V

    return-void
.end method

.method private static varargs method(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
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

    .line 22
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    return-object p0
.end method

.method public static openAndTest(Landroid/app/Activity;)V
    .locals 9

    .line 28
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    sput-object v0, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->report:Lorg/json/JSONObject;

    .line 30
    :try_start_0
    sget-object v0, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->report:Lorg/json/JSONObject;

    const-string v1, "time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    sget-object v0, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->report:Lorg/json/JSONObject;

    const-string v1, "scope"

    const-string v2, "own native profile only; ID value and prior clipboard never logged"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 31
    const-string v0, "ShowIdInProfile"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "persistent_switch_enabled"

    invoke-static {v0, v1}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V

    .line 32
    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->account()I

    move-result v0

    const-string v1, "org.telegram.messenger.UserConfig"

    invoke-static {v1}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getInstance"

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "getClientUserId"

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    const-wide/16 v5, 0x0

    cmp-long v3, v1, v5

    const/4 v5, 0x1

    if-lez v3, :cond_0

    move v3, v5

    goto :goto_0

    :cond_0
    move v3, v4

    :goto_0
    const-string v6, "cached_self_id_present"

    invoke-static {v3, v6}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V

    .line 34
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    const-string v6, "user_id"

    invoke-virtual {v3, v6, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 35
    const-string v6, "org.telegram.ui.ProfileActivity"

    invoke-static {v6}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const-class v7, Landroid/os/Bundle;

    filled-new-array {v7}, [Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 36
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "setCurrentAccount"

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v8}, [Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v6, v3, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v6, "R"

    new-array v7, v4, [Ljava/lang/Class;

    invoke-static {v0, v6, v7}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->method(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v6, v4, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    move v4, v5

    :cond_1
    const-string v5, "native_navigation_parent_present"

    invoke-static {v4, v5}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V

    .line 38
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "presentFragment"

    const-string v6, "org.telegram.ui.ActionBar.r2"

    invoke-static {v6}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Class;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->method(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 39
    const-string v4, "own_profile_presented"

    invoke-static {v0, v4}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V

    .line 40
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v0, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v4, Lcc/ioctl/tmoe/startup/ProfileLiveTest$$ExternalSyntheticLambda1;

    invoke-direct {v4, p0, v3, v1, v2}, Lcc/ioctl/tmoe/startup/ProfileLiveTest$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;Ljava/lang/Object;J)V

    const-wide/16 v1, 0x578

    invoke-virtual {v0, v4, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    goto :goto_1

    :catchall_0
    move-exception v0

    invoke-static {p0, v0}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->write(Landroid/app/Activity;Ljava/lang/Throwable;)V

    .line 42
    :goto_1
    return-void
.end method

.method private static runOnVisible(Landroid/app/Activity;Ljava/lang/Object;JI)V
    .locals 10

    .line 45
    const-string v0, "previous_clipboard_restored"

    const-string v1, "N2"

    :try_start_0
    const-string v2, "e1"

    invoke-static {p1, v2}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    cmp-long v2, v2, p2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    const-string v5, "profile_matches_cached_self"

    invoke-static {v2, v5}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V

    .line 46
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->id(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v5, "resolver_matches_cached_self"

    invoke-static {v2, v5}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V

    .line 47
    const-string v2, "d"

    invoke-static {p1, v2}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rowForAdapter(Ljava/lang/Object;)Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;

    move-result-object v5

    if-eqz v5, :cond_1

    move v6, v3

    goto :goto_1

    :cond_1
    move v6, v4

    :goto_1
    const-string v7, "id_row_allocated"

    invoke-static {v6, v7}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V

    .line 48
    const-string v6, "a"

    invoke-static {p1, v6}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 49
    iget-object v7, v5, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->value:Ljava/lang/String;

    invoke-static {v6, v7}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->findCell(Landroid/view/ViewGroup;Ljava/lang/String;)Landroid/view/View;

    move-result-object v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 50
    if-nez v7, :cond_2

    const/4 v8, 0x4

    if-ge p4, v8, :cond_2

    .line 51
    :try_start_1
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "scrollToPosition"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget v1, v5, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->index:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v6, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    .line 52
    :goto_2
    :try_start_2
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcc/ioctl/tmoe/startup/ProfileLiveTest$$ExternalSyntheticLambda0;

    move-object v2, v1

    move-object v3, p0

    move-object v4, p1

    move-wide v5, p2

    move v7, p4

    invoke-direct/range {v2 .. v7}, Lcc/ioctl/tmoe/startup/ProfileLiveTest$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;Ljava/lang/Object;JI)V

    const-wide/16 p1, 0x1f4

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 54
    :cond_2
    if-eqz v7, :cond_3

    invoke-virtual {v7}, Landroid/view/View;->isShown()Z

    move-result p4

    if-eqz p4, :cond_3

    move p4, v3

    goto :goto_3

    :cond_3
    move p4, v4

    :goto_3
    const-string v8, "native_id_cell_visible"

    invoke-static {p4, v8}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V

    .line 55
    iget-object p4, v5, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->value:Ljava/lang/String;

    invoke-static {v6, p4}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->countCells(Landroid/view/ViewGroup;Ljava/lang/String;)I

    move-result p4

    if-ne p4, v3, :cond_4

    move p4, v3

    goto :goto_4

    :cond_4
    move p4, v4

    :goto_4
    const-string v6, "one_id_cell_before_refresh"

    invoke-static {p4, v6}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V

    .line 56
    invoke-virtual {v7}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object p4

    if-eqz p4, :cond_5

    invoke-virtual {v7}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object p4

    invoke-interface {p4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p4

    if-eqz p4, :cond_5

    move p4, v3

    goto :goto_5

    :cond_5
    move p4, v4

    :goto_5
    const-string v6, "native_label_contains_correct_self_id"

    invoke-static {p4, v6}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V

    .line 57
    const-class p4, Landroid/content/ClipboardManager;

    invoke-virtual {p0, p4}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Landroid/content/ClipboardManager;

    .line 58
    const/4 v6, 0x0

    if-nez p4, :cond_6

    move-object v8, v6

    goto :goto_6

    :cond_6
    invoke-virtual {p4}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 60
    :goto_6
    :try_start_3
    invoke-virtual {v7}, Landroid/view/View;->performClick()Z

    move-result v7

    const-string v9, "real_cell_click_consumed"

    invoke-static {v7, v9}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V

    .line 61
    invoke-virtual {p4}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v7

    if-eqz v7, :cond_7

    invoke-virtual {v7}, Landroid/content/ClipData;->getItemCount()I

    move-result v9

    if-lez v9, :cond_7

    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v4}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v7

    invoke-virtual {v7, p0}, Landroid/content/ClipData$Item;->coerceToText(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v9, v7}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_7

    move v7, v3

    goto :goto_7

    :cond_7
    move v7, v4

    .line 62
    :goto_7
    const-string v9, "real_click_copied_exact_self_id"

    invoke-static {v7, v9}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 63
    if-eqz p4, :cond_9

    if-eqz v8, :cond_8

    :try_start_4
    invoke-virtual {p4, v8}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    goto :goto_8

    :cond_8
    invoke-virtual {p4}, Landroid/content/ClipboardManager;->clearPrimaryClip()V

    :cond_9
    :goto_8
    sget-object p4, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->report:Lorg/json/JSONObject;

    invoke-virtual {p4, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 64
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p4

    const-string v0, "j5"

    new-array v7, v4, [Ljava/lang/Class;

    invoke-static {p4, v0, v7}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->method(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p4

    invoke-static {p1, v1}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    iget v5, v5, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->index:I

    .line 65
    sget-object v7, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->runtimeModule:Lio/github/libxposed/api/XposedModule;

    invoke-virtual {v7, p4}, Lio/github/libxposed/api/XposedModule;->getInvoker(Ljava/lang/reflect/Method;)Lio/github/libxposed/api/XposedInterface$Invoker;

    move-result-object v7

    new-array v8, v4, [Ljava/lang/Object;

    invoke-interface {v7, p1, v8}, Lio/github/libxposed/api/XposedInterface$Invoker;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1, v1}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Number;

    invoke-virtual {v7}, Ljava/lang/Number;->intValue()I

    move-result v7

    .line 66
    sget-object v8, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->runtimeModule:Lio/github/libxposed/api/XposedModule;

    invoke-virtual {v8, p4}, Lio/github/libxposed/api/XposedModule;->getInvoker(Ljava/lang/reflect/Method;)Lio/github/libxposed/api/XposedInterface$Invoker;

    move-result-object v8

    new-array v9, v4, [Ljava/lang/Object;

    invoke-interface {v8, p1, v9}, Lio/github/libxposed/api/XposedInterface$Invoker;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1, v1}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Number;

    invoke-virtual {v8}, Ljava/lang/Number;->intValue()I

    move-result v8

    .line 67
    if-ne v0, v7, :cond_a

    if-ne v7, v8, :cond_a

    move v0, v3

    goto :goto_9

    :cond_a
    move v0, v4

    :goto_9
    const-string v7, "rebuild_twice_no_row_count_growth"

    invoke-static {v0, v7}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V

    .line 68
    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rowForAdapter(Ljava/lang/Object;)Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;

    move-result-object v0

    if-eqz v0, :cond_b

    iget v7, v0, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->index:I

    if-ne v7, v5, :cond_b

    move v5, v3

    goto :goto_a

    :cond_b
    move v5, v4

    :goto_a
    const-string v7, "id_index_stable_after_rebuild"

    invoke-static {v5, v7}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V

    .line 69
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p2

    iget-object p3, v0, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->value:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const-string p3, "id_value_stable_after_rebuild"

    invoke-static {p2, p3}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V

    .line 70
    const-string p2, "ShowIdInProfile"

    invoke-static {p2, v4}, Lcc/ioctl/tmoe/startup/ModernPreferences;->setTestOverride(Ljava/lang/String;Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 72
    :try_start_5
    sget-object p2, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->runtimeModule:Lio/github/libxposed/api/XposedModule;

    invoke-virtual {p2, p4}, Lio/github/libxposed/api/XposedModule;->getInvoker(Ljava/lang/reflect/Method;)Lio/github/libxposed/api/XposedInterface$Invoker;

    move-result-object p2

    new-array p3, v4, [Ljava/lang/Object;

    invoke-interface {p2, p1, p3}, Lio/github/libxposed/api/XposedInterface$Invoker;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1, v1}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    invoke-static {v2}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rowForAdapter(Ljava/lang/Object;)Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;

    move-result-object p3

    if-nez p3, :cond_c

    move p3, v3

    goto :goto_b

    :cond_c
    move p3, v4

    :goto_b
    const-string v0, "disabled_removes_id_row"

    invoke-static {p3, v0}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 73
    :try_start_6
    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernPreferences;->clearTestOverrides()V

    .line 74
    sget-object p3, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->runtimeModule:Lio/github/libxposed/api/XposedModule;

    invoke-virtual {p3, p4}, Lio/github/libxposed/api/XposedModule;->getInvoker(Ljava/lang/reflect/Method;)Lio/github/libxposed/api/XposedInterface$Invoker;

    move-result-object p3

    new-array p4, v4, [Ljava/lang/Object;

    invoke-interface {p3, p1, p4}, Lio/github/libxposed/api/XposedInterface$Invoker;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p1, v1}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    add-int/2addr p2, v3

    if-ne p1, p2, :cond_d

    goto :goto_c

    :cond_d
    move v3, v4

    :goto_c
    const-string p1, "enabled_restores_one_id_row"

    invoke-static {v3, p1}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->check(ZLjava/lang/String;)V

    .line 75
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string p2, "l"

    new-array p3, v4, [Ljava/lang/Class;

    invoke-virtual {p1, p2, p3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array p2, v4, [Ljava/lang/Object;

    invoke-virtual {p1, v2, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object p1, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->report:Lorg/json/JSONObject;

    const-string p2, "clipboard_value_recorded"

    invoke-virtual {p1, p2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    sget-object p1, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->report:Lorg/json/JSONObject;

    const-string p2, "native_row_type"

    const-string p3, "Cells.c9"

    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    invoke-static {p0, v6}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->write(Landroid/app/Activity;Ljava/lang/Throwable;)V

    .line 78
    goto :goto_e

    .line 73
    :catchall_1
    move-exception p1

    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernPreferences;->clearTestOverrides()V

    throw p1

    .line 63
    :catchall_2
    move-exception p1

    if-eqz p4, :cond_f

    if-eqz v8, :cond_e

    invoke-virtual {p4, v8}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    goto :goto_d

    :cond_e
    invoke-virtual {p4}, Landroid/content/ClipboardManager;->clearPrimaryClip()V

    :cond_f
    :goto_d
    sget-object p2, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->report:Lorg/json/JSONObject;

    invoke-virtual {p2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 78
    :catchall_3
    move-exception p1

    invoke-static {}, Lcc/ioctl/tmoe/startup/ModernPreferences;->clearTestOverrides()V

    invoke-static {p0, p1}, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->write(Landroid/app/Activity;Ljava/lang/Throwable;)V

    .line 79
    :goto_e
    return-void
.end method

.method private static write(Landroid/app/Activity;Ljava/lang/Throwable;)V
    .locals 4

    .line 25
    const-string v0, "TMoe-ID"

    const-string v1, "status"

    if-eqz p1, :cond_0

    :try_start_0
    sget-object v2, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->report:Lorg/json/JSONObject;

    const-string v3, "FAIL"

    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object v2, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->report:Lorg/json/JSONObject;

    const-string v3, "error"

    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :cond_0
    sget-object p1, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->report:Lorg/json/JSONObject;

    const-string v2, "PASS"

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :goto_0
    sget-object p1, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->report:Lorg/json/JSONObject;

    const-string v2, "actual_id_recorded"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    new-instance p1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v2, "tmoe-profile-live-test.json"

    invoke-direct {p1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance p0, Ljava/io/FileOutputStream;

    invoke-direct {p0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :try_start_1
    sget-object p1, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->report:Lorg/json/JSONObject;

    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "LIVE_PROFILE_TEST "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-object p1, Lcc/ioctl/tmoe/startup/ProfileLiveTest;->report:Lorg/json/JSONObject;

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_2

    :catchall_0
    move-exception p1

    :try_start_3
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p0

    :try_start_4
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception p0

    const-string p1, "write live test"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 26
    :goto_2
    return-void
.end method
