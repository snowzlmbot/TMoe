.class public final synthetic Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic f$0:Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;


# direct methods
.method public synthetic constructor <init>(Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda9;->f$0:Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 0
    iget-object v0, p0, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda9;->f$0:Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;

    invoke-static {v0, p1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->lambda$bindCell$8(Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;Landroid/view/View;)Z

    move-result p1

    return p1
.end method
