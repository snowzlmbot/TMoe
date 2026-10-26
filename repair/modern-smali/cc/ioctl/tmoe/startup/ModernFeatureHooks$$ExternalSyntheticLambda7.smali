.class public final synthetic Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lio/github/libxposed/api/XposedInterface$Hooker;


# instance fields
.field public final synthetic f$0:Ljava/lang/Class;

.field public final synthetic f$1:Ljava/lang/Class;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Class;Ljava/lang/Class;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda7;->f$0:Ljava/lang/Class;

    iput-object p2, p0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda7;->f$1:Ljava/lang/Class;

    return-void
.end method


# virtual methods
.method public final intercept(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 2

    .line 0
    iget-object v0, p0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda7;->f$0:Ljava/lang/Class;

    iget-object v1, p0, Lcc/ioctl/tmoe/startup/ModernFeatureHooks$$ExternalSyntheticLambda7;->f$1:Ljava/lang/Class;

    invoke-static {v0, v1, p1}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->lambda$install$6(Ljava/lang/Class;Ljava/lang/Class;Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
