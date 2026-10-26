.class public final Lcc/ioctl/tmoe/startup/ModernProfileIds;
.super Ljava/lang/Object;
.source "ModernProfileIds.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;
    }
.end annotation


# static fields
.field static final DIFF_KEY:I = 0x544d4931

.field private static final ROW_FIELDS:[Ljava/lang/String;

.field static final VIEW_TYPE:I = 0x544d4944

.field private static adapterProfile:Ljava/lang/reflect/Field;

.field private static count:Ljava/lang/reflect/Field;

.field private static holderClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static holderView:Ljava/lang/reflect/Field;

.field private static final indexFields:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile lastError:Ljava/lang/String;

.field private static module:Lio/github/libxposed/api/XposedModule;

.field private static profileClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static final profiles:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static rebuild:Ljava/lang/reflect/Method;

.field private static final rows:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 105

    .line 26
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rows:Ljava/util/Map;

    .line 27
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->profiles:Ljava/util/Map;

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->indexFields:Ljava/util/ArrayList;

    .line 33
    const-string v0, ""

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->lastError:Ljava/lang/String;

    .line 113
    const-string v103, "M4"

    const-string v104, "N4"

    const-string v1, "O2"

    const-string v2, "P2"

    const-string v3, "S2"

    const-string v4, "T2"

    const-string v5, "U2"

    const-string v6, "V2"

    const-string v7, "W2"

    const-string v8, "Q2"

    const-string v9, "R2"

    const-string v10, "X2"

    const-string v11, "a3"

    const-string v12, "b3"

    const-string v13, "Y2"

    const-string v14, "Z2"

    const-string v15, "c3"

    const-string v16, "d3"

    const-string v17, "e3"

    const-string v18, "f3"

    const-string v19, "g3"

    const-string v20, "c4"

    const-string v21, "d4"

    const-string v22, "e4"

    const-string v23, "f4"

    const-string v24, "g4"

    const-string v25, "h4"

    const-string v26, "h3"

    const-string v27, "i3"

    const-string v28, "j3"

    const-string v29, "k3"

    const-string v30, "l3"

    const-string v31, "m3"

    const-string v32, "n3"

    const-string v33, "o3"

    const-string v34, "p3"

    const-string v35, "q3"

    const-string v36, "r3"

    const-string v37, "s3"

    const-string v38, "t3"

    const-string v39, "u3"

    const-string v40, "v3"

    const-string v41, "w3"

    const-string v42, "x3"

    const-string v43, "y3"

    const-string v44, "z3"

    const-string v45, "i4"

    const-string v46, "n4"

    const-string v47, "botPermissionBiometry"

    const-string v48, "botPermissionEmojiStatus"

    const-string v49, "botPermissionLocation"

    const-string v50, "p4"

    const-string v51, "j4"

    const-string v52, "k4"

    const-string v53, "l4"

    const-string v54, "m4"

    const-string v55, "U3"

    const-string v56, "V3"

    const-string v57, "X3"

    const-string v58, "W3"

    const-string v59, "Z3"

    const-string v60, "A3"

    const-string v61, "B3"

    const-string v62, "D3"

    const-string v63, "E3"

    const-string v64, "F3"

    const-string v65, "G3"

    const-string v66, "H3"

    const-string v67, "J3"

    const-string v68, "I3"

    const-string v69, "K3"

    const-string v70, "L3"

    const-string v71, "q4"

    const-string v72, "r4"

    const-string v73, "M3"

    const-string v74, "Y3"

    const-string v75, "N3"

    const-string v76, "P3"

    const-string v77, "O3"

    const-string v78, "R3"

    const-string v79, "S3"

    const-string v80, "T3"

    const-string v81, "s4"

    const-string v82, "C3"

    const-string v83, "a4"

    const-string v84, "b4"

    const-string v85, "t4"

    const-string v86, "u4"

    const-string v87, "v4"

    const-string v88, "w4"

    const-string v89, "x4"

    const-string v90, "y4"

    const-string v91, "z4"

    const-string v92, "G4"

    const-string v93, "H4"

    const-string v94, "E4"

    const-string v95, "K4"

    const-string v96, "Q3"

    const-string v97, "A4"

    const-string v98, "B4"

    const-string v99, "C4"

    const-string v100, "D4"

    const-string v101, "F4"

    const-string v102, "L4"

    filled-new-array/range {v1 .. v104}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->ROW_FIELDS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static bindCell(Landroid/view/View;Ljava/lang/Object;Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 97
    const-string v0, "org.telegram.ui.Cells.c9"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-class v1, Ljava/lang/CharSequence;

    const-class v2, Ljava/lang/CharSequence;

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v1, v2, v3}, [Ljava/lang/Class;

    move-result-object v1

    const-string v2, "c"

    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    iget-object v1, p2, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->value:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p2, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->label:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u00b7 \u70b9\u6309\u590d\u5236"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    filled-new-array {v1, v2, v3}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p2, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\uff0c\u70b9\u6309\u590d\u5236"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v0, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda8;

    invoke-direct {v0, p2}, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda8;-><init>(Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda9;

    invoke-direct {v0, p2}, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda9;-><init>(Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 99
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "row bound: sourceMatches="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    iget-object v0, p2, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->value:Ljava/lang/String;

    invoke-static {p1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->id(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " length="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    iget-object p1, p2, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->value:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "TMoe-ID"

    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
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

    .line 35
    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->cls(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method

.method static copy(Landroid/content/Context;Ljava/lang/String;Z)Z
    .locals 3

    .line 102
    const-class v0, Landroid/content/ClipboardManager;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const-string v2, "Telegram ID"

    invoke-static {v2, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    if-eqz p2, :cond_1

    const-string p2, "ID\u5df2\u590d\u5236"

    invoke-static {p0, p2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "ID copied; length="

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "TMoe-ID"

    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x1

    return p0
.end method

.method private static error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->lastError:Ljava/lang/String;

    const-string v0, "TMoe-ID"

    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method private static f(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 0
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
            Ljava/lang/Exception;
        }
    .end annotation

    .line 36
    invoke-static {p0, p1}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    return-object p0
.end method

.method private static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 37
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->f(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static id(Ljava/lang/Object;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 80
    const-string v0, "e1"

    invoke-static {p0, v0}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 81
    :cond_0
    const-string v0, "E2"

    invoke-static {p0, v0}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1

    const-string v0, "f1"

    invoke-static {p0, v0}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v1, "id"

    invoke-static {v0, v1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 82
    cmp-long v4, v0, v2

    if-nez v4, :cond_2

    const/4 p0, 0x0

    return-object p0

    :cond_2
    const-string v4, "g1"

    invoke-static {p0, v4}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    .line 83
    cmp-long p0, v4, v2

    if-nez p0, :cond_3

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_1
    return-object p0
.end method

.method static insertAfterRebuild(Ljava/lang/Object;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 86
    const-string v0, "ShowIdInProfile"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 87
    :cond_0
    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->id(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    .line 88
    :cond_1
    sget-object v1, Lcc/ioctl/tmoe/startup/ModernProfileIds;->count:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    if-gtz v1, :cond_2

    return-void

    .line 89
    :cond_2
    sget-object v2, Lcc/ioctl/tmoe/startup/ModernProfileIds;->profileClass:Ljava/lang/Class;

    const-string v3, "f3"

    invoke-static {v2, v3}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->f(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    .line 90
    if-ltz v2, :cond_3

    if-le v2, v1, :cond_5

    :cond_3
    sget-object v2, Lcc/ioctl/tmoe/startup/ModernProfileIds;->profileClass:Ljava/lang/Class;

    const-string v3, "e3"

    invoke-static {v2, v3}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->f(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, 0x1

    if-ltz v2, :cond_4

    if-ge v2, v1, :cond_4

    add-int/2addr v2, v3

    goto :goto_0

    :cond_4
    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 91
    :cond_5
    :goto_0
    sget-object v3, Lcc/ioctl/tmoe/startup/ModernProfileIds;->indexFields:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_6
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Field;

    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v5

    if-lt v5, v2, :cond_6

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v4, p0, v5}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    goto :goto_1

    .line 92
    :cond_7
    sget-object v3, Lcc/ioctl/tmoe/startup/ModernProfileIds;->count:Ljava/lang/reflect/Field;

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {v3, p0, v4}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    const-string v3, "e1"

    invoke-static {p0, v3}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    sget-object v3, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rows:Ljava/util/Map;

    new-instance v7, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;

    const-wide/16 v8, 0x0

    cmp-long v5, v5, v8

    if-eqz v5, :cond_8

    const-string v5, "\u7528\u6237ID"

    goto :goto_2

    :cond_8
    const-string v5, "\u7fa4\u7ec4/\u9891\u9053ID"

    :goto_2
    invoke-direct {v7, v2, v0, v5}, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, p0, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "row rebuilt: original="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " index="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " count="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "TMoe-ID"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    return-void
.end method

.method public static install(Lio/github/libxposed/api/XposedModule;Ljava/lang/ClassLoader;)V
    .locals 8

    .line 41
    const-string p1, "org.telegram.ui.i11"

    sput-object p0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->module:Lio/github/libxposed/api/XposedModule;

    .line 43
    :try_start_0
    const-string v0, "org.telegram.ui.ProfileActivity"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->profileClass:Ljava/lang/Class;

    const-string v0, "n4.h1"

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->holderClass:Ljava/lang/Class;

    .line 44
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->profileClass:Ljava/lang/Class;

    const-string v1, "N2"

    invoke-static {v0, v1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->f(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->count:Ljava/lang/reflect/Field;

    invoke-static {p1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "e"

    invoke-static {v0, v1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->f(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->adapterProfile:Ljava/lang/reflect/Field;

    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->holderClass:Ljava/lang/Class;

    const-string v1, "a"

    invoke-static {v0, v1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->f(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->holderView:Ljava/lang/reflect/Field;

    .line 45
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->profileClass:Ljava/lang/Class;

    const-string v1, "j5"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rebuild:Ljava/lang/reflect/Method;

    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rebuild:Ljava/lang/reflect/Method;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 46
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->indexFields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->ROW_FIELDS:[Ljava/lang/String;

    array-length v1, v0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    sget-object v4, Lcc/ioctl/tmoe/startup/ModernProfileIds;->profileClass:Ljava/lang/Class;

    invoke-static {v4, v3}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->f(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v5, v6, :cond_0

    sget-object v3, Lcc/ioctl/tmoe/startup/ModernProfileIds;->indexFields:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Not a row: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 47
    :cond_1
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rebuild:Ljava/lang/reflect/Method;

    invoke-virtual {p0, v0}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v0

    const-string v1, "tmoe.72299.id.rows"

    invoke-interface {v0, v1}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v0

    sget-object v1, Lio/github/libxposed/api/XposedInterface$ExceptionMode;->PROTECTIVE:Lio/github/libxposed/api/XposedInterface$ExceptionMode;

    invoke-interface {v0, v1}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setExceptionMode(Lio/github/libxposed/api/XposedInterface$ExceptionMode;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v0

    new-instance v1, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda1;-><init>()V

    invoke-interface {v0, v1}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 50
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rebuild:Ljava/lang/reflect/Method;

    invoke-virtual {p0, v0}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z

    .line 51
    invoke-static {p1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "j"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 52
    invoke-virtual {p0, v0}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    const-string v2, "tmoe.72299.id.type"

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    new-instance v2, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda2;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda2;-><init>()V

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    invoke-virtual {p0, v0}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z

    .line 53
    invoke-static {p1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "x"

    const-class v2, Landroid/view/ViewGroup;

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v2, v3}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    const-string v2, "tmoe.72299.id.create"

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    new-instance v2, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda3;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda3;-><init>()V

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 57
    invoke-virtual {p0, v0}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z

    .line 58
    invoke-static {p1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "v"

    sget-object v2, Lcc/ioctl/tmoe/startup/ModernProfileIds;->holderClass:Ljava/lang/Class;

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v2, v3}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 59
    invoke-virtual {p0, v0}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    const-string v2, "tmoe.72299.id.bind"

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v1

    new-instance v2, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda4;

    invoke-direct {v2}, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda4;-><init>()V

    invoke-interface {v1, v2}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 63
    invoke-virtual {p0, v0}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z

    .line 64
    invoke-static {p1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    const-string v0, "D"

    sget-object v1, Lcc/ioctl/tmoe/startup/ModernProfileIds;->holderClass:Ljava/lang/Class;

    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 65
    invoke-virtual {p0, p1}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v0

    const-string v1, "tmoe.72299.id.enabled"

    invoke-interface {v0, v1}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v0

    new-instance v1, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda5;

    invoke-direct {v1}, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda5;-><init>()V

    invoke-interface {v0, v1}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 67
    invoke-virtual {p0, p1}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z

    .line 68
    sget-object p1, Lcc/ioctl/tmoe/startup/ModernProfileIds;->profileClass:Ljava/lang/Class;

    const-string v0, "a0"

    sget-object v1, Lcc/ioctl/tmoe/startup/ModernProfileIds;->profileClass:Ljava/lang/Class;

    const-class v2, Landroid/content/Context;

    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const-class v4, Landroid/view/View;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    sget-object v7, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    filled-new-array/range {v1 .. v7}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 69
    invoke-virtual {p0, p1}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v0

    const-string v1, "tmoe.72299.id.click"

    invoke-interface {v0, v1}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v0

    new-instance v1, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda6;

    invoke-direct {v1}, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda6;-><init>()V

    invoke-interface {v0, v1}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 71
    invoke-virtual {p0, p1}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z

    .line 72
    const-string p1, "org.telegram.ui.w01"

    invoke-static {p1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->c(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    const-string v0, "f"

    const-class v1, Landroid/util/SparseIntArray;

    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 73
    invoke-virtual {p0, p1}, Lio/github/libxposed/api/XposedModule;->hook(Ljava/lang/reflect/Executable;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v0

    const-string v1, "tmoe.72299.id.diff"

    invoke-interface {v0, v1}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->setId(Ljava/lang/String;)Lio/github/libxposed/api/XposedInterface$HookBuilder;

    move-result-object v0

    new-instance v1, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda7;

    invoke-direct {v1}, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda7;-><init>()V

    invoke-interface {v0, v1}, Lio/github/libxposed/api/XposedInterface$HookBuilder;->intercept(Lio/github/libxposed/api/XposedInterface$Hooker;)Lio/github/libxposed/api/XposedInterface$HookHandle;

    .line 75
    invoke-virtual {p0, p1}, Lio/github/libxposed/api/XposedModule;->deoptimize(Ljava/lang/reflect/Executable;)Z

    .line 76
    const-string p0, "TMoe-ID"

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "installed: row=N2 rebuild=j5 adapter=i11; exact rows="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->indexFields:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    goto :goto_1

    :catchall_0
    move-exception p0

    const-string p1, "install"

    invoke-static {p1, p0}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 78
    :goto_1
    return-void
.end method

.method static synthetic lambda$bindCell$7(Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;Landroid/view/View;)V
    .locals 1

    .line 98
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p0, p0, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->value:Ljava/lang/String;

    const/4 v0, 0x1

    invoke-static {p1, p0, v0}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->copy(Landroid/content/Context;Ljava/lang/String;Z)Z

    return-void
.end method

.method static synthetic lambda$bindCell$8(Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;Landroid/view/View;)Z
    .locals 1

    .line 98
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p0, p0, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->value:Ljava/lang/String;

    const/4 v0, 0x1

    invoke-static {p1, p0, v0}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->copy(Landroid/content/Context;Ljava/lang/String;Z)Z

    return v0
.end method

.method static synthetic lambda$install$0(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 48
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->getThisObject()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcc/ioctl/tmoe/startup/ModernProfileIds;->profiles:Ljava/util/Map;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rows:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->insertAfterRebuild(Ljava/lang/Object;)V

    return-object p0
.end method

.method static synthetic lambda$install$1(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 52
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->getThisObject()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rowForAdapter(Ljava/lang/Object;)Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;

    move-result-object v0

    if-eqz v0, :cond_0

    iget v0, v0, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->index:I

    const/4 v1, 0x0

    invoke-interface {p0, v1}, Lio/github/libxposed/api/XposedInterface$Chain;->getArg(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    if-ne v0, v1, :cond_0

    const p0, 0x544d4944

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method static synthetic lambda$install$2(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 55
    const/4 v0, 0x1

    invoke-interface {p0, v0}, Lio/github/libxposed/api/XposedInterface$Chain;->getArg(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    const v1, 0x544d4944

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lio/github/libxposed/api/XposedInterface$Chain;->getArg(I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p0, v0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 56
    :cond_0
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$install$3(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 60
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->getThisObject()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcc/ioctl/tmoe/startup/ModernProfileIds;->adapterProfile:Ljava/lang/reflect/Field;

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rows:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;

    .line 61
    if-eqz v1, :cond_1

    iget v2, v1, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->index:I

    const/4 v3, 0x1

    invoke-interface {p0, v3}, Lio/github/libxposed/api/XposedInterface$Chain;->getArg(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    if-eq v2, v3, :cond_0

    goto :goto_0

    .line 62
    :cond_0
    sget-object v2, Lcc/ioctl/tmoe/startup/ModernProfileIds;->holderView:Ljava/lang/reflect/Field;

    const/4 v3, 0x0

    invoke-interface {p0, v3}, Lio/github/libxposed/api/XposedInterface$Chain;->getArg(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-static {p0, v0, v1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->bindCell(Landroid/view/View;Ljava/lang/Object;Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;)V

    const/4 p0, 0x0

    return-object p0

    .line 61
    :cond_1
    :goto_0
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$install$4(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 66
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->holderClass:Ljava/lang/Class;

    const-string v1, "f"

    invoke-static {v0, v1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->f(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {p0, v1}, Lio/github/libxposed/api/XposedInterface$Chain;->getArg(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v0

    const v1, 0x544d4944

    if-ne v0, v1, :cond_0

    const/4 p0, 0x1

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method static synthetic lambda$install$5(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 70
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lio/github/libxposed/api/XposedInterface$Chain;->getArg(I)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rows:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;

    if-eqz v0, :cond_0

    iget v1, v0, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->index:I

    const/4 v2, 0x4

    invoke-interface {p0, v2}, Lio/github/libxposed/api/XposedInterface$Chain;->getArg(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_0

    const/4 v1, 0x3

    invoke-interface {p0, v1}, Lio/github/libxposed/api/XposedInterface$Chain;->getArg(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    iget-object v0, v0, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->value:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->copy(Landroid/content/Context;Ljava/lang/String;Z)Z

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$install$6(Lio/github/libxposed/api/XposedInterface$Chain;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 74
    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->proceed()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p0}, Lio/github/libxposed/api/XposedInterface$Chain;->getThisObject()Ljava/lang/Object;

    move-result-object v1

    const-string v2, "i"

    invoke-static {v1, v2}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rows:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;

    if-eqz v1, :cond_0

    const/4 v2, 0x0

    invoke-interface {p0, v2}, Lio/github/libxposed/api/XposedInterface$Chain;->getArg(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/util/SparseIntArray;

    iget v1, v1, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;->index:I

    const v2, 0x544d4931

    invoke-virtual {p0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    :cond_0
    return-object v0
.end method

.method static synthetic lambda$refresh$9(Ljava/lang/Object;)V
    .locals 4

    .line 108
    :try_start_0
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->module:Lio/github/libxposed/api/XposedModule;

    sget-object v1, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rebuild:Ljava/lang/reflect/Method;

    invoke-virtual {v0, v1}, Lio/github/libxposed/api/XposedModule;->getInvoker(Ljava/lang/reflect/Method;)Lio/github/libxposed/api/XposedInterface$Invoker;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    invoke-interface {v0, p0, v2}, Lio/github/libxposed/api/XposedInterface$Invoker;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "d"

    invoke-static {p0, v0}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "l"

    new-array v3, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    const-string v0, "refresh"

    invoke-static {v0, p0}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void
.end method

.method public static refresh()V
    .locals 4

    .line 105
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->module:Lio/github/libxposed/api/XposedModule;

    if-eqz v0, :cond_3

    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rebuild:Ljava/lang/reflect/Method;

    if-nez v0, :cond_0

    goto :goto_2

    .line 106
    :cond_0
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->profiles:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    sget-object v2, Lcc/ioctl/tmoe/startup/ModernProfileIds;->profiles:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 107
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 108
    :try_start_1
    new-instance v2, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda0;

    invoke-direct {v2, v1}, Lcc/ioctl/tmoe/startup/ModernProfileIds$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Object;)V

    .line 109
    const-string v3, "a"

    invoke-static {v1, v3}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v3, v1, Landroid/view/View;

    if-eqz v3, :cond_1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    :cond_1
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 110
    :goto_1
    goto :goto_0

    :catchall_0
    move-exception v1

    const-string v2, "refresh setup"

    invoke-static {v2, v1}, Lcc/ioctl/tmoe/startup/ModernProfileIds;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 111
    :cond_2
    return-void

    .line 106
    :catchall_1
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1

    .line 105
    :cond_3
    :goto_2
    return-void
.end method

.method static rowForAdapter(Ljava/lang/Object;)Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 95
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->rows:Ljava/util/Map;

    sget-object v1, Lcc/ioctl/tmoe/startup/ModernProfileIds;->adapterProfile:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcc/ioctl/tmoe/startup/ModernProfileIds$Row;

    return-object p0
.end method

.method public static status()Ljava/lang/String;
    .locals 1

    .line 39
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->lastError:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "ready"

    goto :goto_0

    :cond_0
    sget-object v0, Lcc/ioctl/tmoe/startup/ModernProfileIds;->lastError:Ljava/lang/String;

    :goto_0
    return-object v0
.end method
