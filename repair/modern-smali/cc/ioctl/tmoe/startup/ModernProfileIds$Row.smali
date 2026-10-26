.class final Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;
.super Ljava/lang/Object;
.source "ModernProfileIds.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcc/ioctl/tmoe/startup/ModernProfileIds;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Row"
.end annotation


# instance fields
.field final index:I

.field final label:Ljava/lang/String;

.field final value:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->index:I

    iput-object p2, p0, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->value:Ljava/lang/String;

    iput-object p3, p0, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->label:Ljava/lang/String;

    return-void
.end method
