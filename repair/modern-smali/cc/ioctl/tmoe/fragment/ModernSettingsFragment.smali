.class public final Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;
.super Lcc/ioctl/tmoe/base/BaseProxyFragment;
.source "ModernSettingsFragment.java"


# static fields
.field private static final OPTIONS:[[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 18
    const-string v0, "\u7981\u6b62\u66f4\u65b0"

    const-string v1, "\u5c4f\u853d\u5e94\u7528\u5185\u66f4\u65b0\u5f39\u7a97\u3001\u5f3a\u5236\u66f4\u65b0\u9875\u548c\u5e95\u90e8\u63d0\u793a\u6761\uff0c\u5e76\u79fb\u966444dp\u5360\u4f4d\uff1b\u5173\u95ed\u6062\u590d\u539f\u903b\u8f91"

    const-string v2, "ProhibitUpdates"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v3

    const-string v0, "\u89e3\u9664\u590d\u5236\u4fdd\u5b58\u6d88\u606f\u9650\u5236"

    const-string v1, "\u63a7\u5236\u8f6c\u53d1\u53ca\u53d7\u9650\u5a92\u4f53\u5224\u5b9a\uff1b\u8bf7\u5c0a\u91cd\u5185\u5bb9\u4f5c\u8005\u6743\u9650"

    const-string v2, "AntiAntiForward"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v4

    const-string v0, "\u9690\u85cf\u8d5e\u52a9\u6d88\u606f"

    const-string v1, "\u62e6\u622a\u6a21\u578b\u4e0e\u804a\u5929\u9875\u5e7f\u544a\u63d2\u5165\u5165\u53e3\uff1b\u4e0d\u4fdd\u8bc1\u6e05\u9664\u5df2\u7f13\u5b58\u5e7f\u544a"

    const-string v2, "HideSponsoredMsg"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v5

    const-string v0, "\u7981\u7528\u5267\u900f"

    const-string v1, "\u540c\u65f6\u62e6\u622a\u5a92\u4f53\u5267\u900f\u5224\u5b9a\u548c\u6587\u5b57\u5267\u900f\u906e\u7f69\u751f\u6210\uff1b\u5df2\u6253\u5f00\u6d88\u606f\u9700\u91cd\u65b0\u5e03\u5c40"

    const-string v2, "ProhibitSpoilers"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v6

    const-string v0, "\u5141\u8bb8\u9876\u680f\u6a21\u7cca"

    const-string v1, "\u89e3\u9664 Telegram \u7684\u6a21\u7cca\u53ef\u7528\u6027\u9650\u5236"

    const-string v2, "ForceBlurChatAvailable"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v7

    const-string v0, "\u663e\u793a\u7cbe\u786e\u4eba\u6570"

    const-string v1, "\u4e0d\u628a\u4eba\u6570\u7f29\u5199\u4e3a K \u6216 M"

    const-string v2, "ChannelDetailNumbers"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v8

    const-string v0, "\u7981\u7528\u4f1a\u5458\u8d34\u7eb8\u7279\u6548"

    const-string v1, "\u62e6\u622a\u4f1a\u5458\u8d34\u7eb8\u9644\u52a0\u7279\u6548\u6570\u636e\u4e0e\u64ad\u653e\u5165\u53e3\uff0c\u4e0d\u4f2a\u9020\u4f1a\u5458\u8d44\u683c\uff1b\u57fa\u7840\u8d34\u7eb8\u4ecd\u53ef\u663e\u793a"

    const-string v2, "DisablePremiumStickerAnimation"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v9

    const-string v0, "\u7981\u6b62\u8868\u60c5\u56de\u5e94"

    const-string v1, "\u8986\u76d6\u6700\u8fd1\u3001\u6536\u85cf\u3001\u70ed\u95e8\u4e0e\u7fa4\u9650\u5b9a\u5165\u53e3\uff0c\u5e76\u62e6\u622a\u56de\u5e94\u53d1\u9001\uff1b\u5df2\u6709\u804a\u5929\u9700\u91cd\u65b0\u6253\u5f00"

    const-string v2, "ProhibitEnableReactions"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v10

    const-string v0, "\u9690\u85cf\u4f1a\u5458\u8d34\u7eb8\u5305"

    const-string v1, "\u8fc7\u6ee4\u4f1a\u5458\u8d34\u7eb8\u6700\u8fd1\u4f7f\u7528\u5217\u8868"

    const-string v2, "HidePremiumStickerSetTab"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v11

    const-string v0, "\u7981\u7528\u95ee\u5019\u8d34\u7eb8"

    const-string v1, "\u6291\u5236\u7a7a\u767d\u804a\u5929\u95ee\u5019\u89c6\u56fe\uff1b\u9700\u91cd\u65b0\u6253\u5f00\u804a\u5929"

    const-string v2, "ProhibitChatGreetings"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v12

    const-string v0, "\u4fdd\u6301\u53ef\u89c1\u89c6\u9891\u9759\u97f3"

    const-string v1, "\u963b\u6b62\u81ea\u52a8\u5207\u5165\u6709\u58f0\u64ad\u653e\uff1b\u4e0d\u5f71\u54cd\u4f60\u4e3b\u52a8\u64ad\u653e\u7684\u89c6\u9891"

    const-string v2, "KeepVideoMuted"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v13

    const-string v0, "\u7981\u6b62\u6ed1\u52a8\u5207\u6362\u9891\u9053"

    const-string v1, "\u6291\u5236\u4e0b\u4e00\u4e2a\u9891\u9053\u67e5\u627e\u548c\u5e95\u90e8\u5207\u6362\u9762\u677f"

    const-string v2, "ProhibitChannelSwitching"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v14

    filled-new-array/range {v3 .. v14}, [[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->OPTIONS:[[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcc/ioctl/tmoe/base/BaseProxyFragment;-><init>()V

    return-void
.end method

.method private back()V
    .locals 4

    .line 39
    :try_start_0
    invoke-virtual {p0}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->getProxyObject()Ljava/lang/Object;

    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "finishFragment"

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 41
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    goto :goto_0

    :catchall_0
    move-exception v0

    const-string v1, "TMoe-UI"

    const-string v2, "Modern settings back failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 43
    :goto_0
    return-void
.end method

.method private dp(Landroid/content/Context;I)I
    .locals 0

    .line 32
    int-to-float p2, p2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p2, p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method static synthetic lambda$onCreateView$1(Ljava/lang/String;Landroid/content/Context;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 60
    invoke-static {p0, p3}, Lcc/ioctl/tmoe/startup/ModernPreferences;->setEnabled(Ljava/lang/String;Z)Z

    move-result p2

    if-nez p2, :cond_0

    const-string p0, "\u4fdd\u5b58\u5931\u8d25\uff0c\u8bf7\u67e5\u770b TMoe-UI \u65e5\u5fd7"

    const/4 p2, 0x1

    invoke-static {p1, p0, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 61
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "preference saved: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "TMoe-UI"

    invoke-static {p2, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0}, Lcc/ioctl/tmoe/startup/ModernFeatureHooks;->onToggleChanged(Ljava/lang/String;)V

    .line 62
    :goto_0
    return-void
.end method

.method static synthetic lambda$onCreateView$2(Landroid/content/Context;Landroid/view/View;)V
    .locals 1

    .line 68
    move-object p1, p0

    check-cast p1, Landroid/app/Activity;

    invoke-static {p1}, Lcc/ioctl/tmoe/startup/ModernRuntimeTests;->run(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private text(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;
    .locals 1

    .line 34
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p1, p3

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, p4}, Landroid/widget/TextView;->setTextColor(I)V

    return-object v0
.end method


# virtual methods
.method synthetic lambda$onCreateView$0$cc-ioctl-tmoe-fragment-ModernSettingsFragment(Landroid/view/View;)V
    .locals 0

    .line 51
    invoke-direct {p0}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->back()V

    return-void
.end method

.method public onCreateView(Landroid/content/Context;)Landroid/view/View;
    .locals 18

    .line 45
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v2, v2, 0x30

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/16 v5, 0x20

    if-ne v2, v5, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    .line 46
    :goto_0
    if-eqz v2, :cond_1

    const/4 v7, -0x1

    goto :goto_1

    :cond_1
    const/16 v7, 0x1c

    const/16 v8, 0x23

    const/16 v9, 0x19

    invoke-static {v9, v7, v8}, Landroid/graphics/Color;->rgb(III)I

    move-result v7

    .line 47
    :goto_1
    if-eqz v2, :cond_2

    const/16 v8, 0xbc

    const/16 v9, 0xcc

    const/16 v10, 0xb4

    goto :goto_2

    :cond_2
    const/16 v8, 0x64

    const/16 v9, 0x76

    const/16 v10, 0x5a

    :goto_2
    invoke-static {v10, v8, v9}, Landroid/graphics/Color;->rgb(III)I

    move-result v8

    .line 48
    const/16 v9, 0x12

    if-eqz v2, :cond_3

    const/16 v10, 0x17

    invoke-static {v9, v10, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v5

    goto :goto_3

    :cond_3
    const/16 v5, 0xf8

    const/16 v10, 0xfc

    const/16 v11, 0xf6

    invoke-static {v11, v5, v10}, Landroid/graphics/Color;->rgb(III)I

    move-result v5

    .line 49
    :goto_3
    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v10, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v10, v5}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 50
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v11, 0x8

    invoke-direct {v0, v1, v11}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v0, v1, v11}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    const/16 v14, 0x10

    invoke-direct {v0, v1, v14}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-direct {v0, v1, v11}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v5, v12, v13, v15, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 51
    const-string v6, "\u2039 \u8fd4\u56de"

    const/16 v12, 0x57

    const/16 v13, 0x96

    const/16 v15, 0xf5

    invoke-static {v12, v13, v15}, Landroid/graphics/Color;->rgb(III)I

    move-result v11

    invoke-direct {v0, v1, v6, v9, v11}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->text(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v6

    const/16 v11, 0x11

    invoke-virtual {v6, v11}, Landroid/widget/TextView;->setGravity(I)V

    const/16 v11, 0xa

    invoke-direct {v0, v1, v11}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v0, v1, v11}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-direct {v0, v1, v14}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-direct {v0, v1, v11}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v6, v12, v13, v15, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v9, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment$$ExternalSyntheticLambda0;

    invoke-direct {v9, v0}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment$$ExternalSyntheticLambda0;-><init>(Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;)V

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 52
    const-string v6, "TMoe \u8bbe\u7f6e \u00b7 API102"

    const/16 v9, 0x14

    invoke-direct {v0, v1, v6, v9, v7}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->text(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v6, v14}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v13, 0x34

    invoke-direct {v0, v1, v13}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-direct {v12, v4, v13, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v6, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    invoke-virtual {v10, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 54
    new-instance v5, Landroid/widget/ScrollView;

    invoke-direct {v5, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v6, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-direct {v0, v1, v14}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v0, v1, v11}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-direct {v0, v1, v14}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    const/16 v14, 0x1e

    invoke-direct {v0, v1, v14}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-virtual {v6, v12, v13, v9, v14}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual {v5, v6}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x1

    invoke-direct {v9, v12, v4, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v10, v5, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    const-string v5, "Telegram 13.1.0 / 72299 \u00b7 LSPosed API102\n\u4e0b\u5217\u5f00\u5173\u4f7f\u7528\u73b0\u4ee3 API\uff0c\u4e0d\u52a0\u8f7d\u4f20\u7edf Xposed Hook \u7c7b\u3002\u914d\u7f6e\u4fdd\u5b58\u5728 Telegram \u6c99\u76d2\u5185\uff0c\u66f4\u65b0\u6a21\u5757\u4e0d\u4f1a\u6e05\u9664\u3002"

    const/16 v9, 0xe

    invoke-direct {v0, v1, v5, v9, v8}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->text(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v5

    const/16 v12, 0x12

    invoke-direct {v0, v1, v12}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-virtual {v5, v4, v4, v4, v13}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 56
    sget-object v5, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->OPTIONS:[[Ljava/lang/String;

    array-length v12, v5

    move v13, v4

    :goto_4
    const/16 v15, 0xc

    if-ge v13, v12, :cond_5

    aget-object v17, v5, v13

    .line 57
    aget-object v9, v17, v4

    .line 58
    new-instance v4, Landroid/widget/Switch;

    invoke-direct {v4, v1}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    aget-object v14, v17, v3

    invoke-virtual {v4, v14}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    const/high16 v14, 0x41800000    # 16.0f

    invoke-virtual {v4, v14}, Landroid/widget/Switch;->setTextSize(F)V

    invoke-virtual {v4, v7}, Landroid/widget/Switch;->setTextColor(I)V

    invoke-direct {v0, v1, v11}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-direct {v0, v1, v15}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-direct {v0, v1, v11}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v15

    move-object/from16 v16, v5

    const/16 v11, 0x8

    invoke-direct {v0, v1, v11}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v4, v14, v3, v15, v5}, Landroid/widget/Switch;->setPadding(IIII)V

    const/16 v3, 0x38

    invoke-direct {v0, v1, v3}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v4, v3}, Landroid/widget/Switch;->setMinHeight(I)V

    invoke-static {v9}, Lcc/ioctl/tmoe/startup/ModernPreferences;->isEnabled(Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {v4, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 59
    new-instance v3, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment$$ExternalSyntheticLambda1;

    invoke-direct {v3, v9, v1}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v4, v3}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 63
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/4 v9, -0x1

    invoke-direct {v3, v9, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    const/4 v3, 0x2

    aget-object v3, v17, v3

    const/16 v4, 0xd

    invoke-direct {v0, v1, v3, v4, v8}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->text(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    const/16 v4, 0xa

    invoke-direct {v0, v1, v4}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v0, v1, v4}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    const/16 v4, 0xc

    invoke-direct {v0, v1, v4}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v4

    const/4 v14, 0x0

    invoke-virtual {v3, v5, v14, v9, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 65
    new-instance v3, Landroid/view/View;

    invoke-direct {v3, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    if-eqz v2, :cond_4

    const v4, -0xcfc6b9

    goto :goto_5

    :cond_4
    const v4, -0x231d14

    :goto_5
    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, 0x1

    invoke-direct {v0, v1, v5}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    const/4 v14, -0x1

    invoke-direct {v4, v14, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    add-int/lit8 v13, v13, 0x1

    move v3, v5

    move-object/from16 v5, v16

    const/4 v4, 0x0

    const/16 v9, 0xe

    const/16 v11, 0xa

    goto/16 :goto_4

    .line 67
    :cond_5
    const-string v2, "\u517c\u5bb9\u6027\u8bf4\u660e\n\u539f\u8bbe\u7f6e\u9875\u4e2d\u4ecd\u4f9d\u8d56\u4f20\u7edf API \u7684\u529f\u80fd\u6682\u4e0d\u663e\u793a\u3002\u663e\u793aID\u3001\u62bd\u5c49\u624b\u673a\u53f7\u53ca\u5176\u4ed6\u65e7API\u529f\u80fd\u4ecd\u9700\u5355\u72ec\u9002\u914d\uff0c\u4e0d\u5728\u672c\u9875\u6807\u4e3a\u53ef\u7528\u3002\n\n\u4fee\u6539\u540e\u82e5\u754c\u9762\u4ecd\u663e\u793a\u7f13\u5b58\u7ed3\u679c\uff0c\u8fd4\u56de\u540e\u91cd\u65b0\u6253\u5f00\u804a\u5929\uff0c\u6216\u91cd\u542f Telegram\u3002\u65e0\u9700\u9000\u51fa\u8d26\u53f7\u3002"

    const/16 v3, 0xe

    invoke-direct {v0, v1, v2, v3, v8}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->text(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    const/16 v3, 0xa

    invoke-direct {v0, v1, v3}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v5, 0x18

    invoke-direct {v0, v1, v5}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v0, v1, v3}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v7

    const/16 v9, 0x14

    invoke-direct {v0, v1, v9}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v2, v4, v5, v7, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v6, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 68
    const-string v2, "\u8fd0\u884c\u771f\u5b9e\u529f\u80fd\u5dee\u5206\u6d4b\u8bd5"

    const/16 v4, 0xf5

    const/16 v5, 0x96

    const/16 v7, 0x57

    invoke-static {v7, v5, v4}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    const/16 v5, 0x10

    invoke-direct {v0, v1, v2, v5, v4}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->text(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    invoke-direct {v0, v1, v3}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v4

    const/16 v5, 0x12

    invoke-direct {v0, v1, v5}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-direct {v0, v1, v3}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v0, v1, v5}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v2, v4, v7, v9, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    new-instance v4, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment$$ExternalSyntheticLambda2;

    invoke-direct {v4, v1}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment$$ExternalSyntheticLambda2;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v6, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 69
    const-string v2, "\u6d4b\u8bd5\u8c03\u7528Telegram\u771f\u5b9e\u65b9\u6cd5\uff0c\u5bf9\u6bd4\u5173\u95ed/\u5f00\u542f/\u6062\u590d\u7ed3\u679c\uff1b\u4f7f\u7528\u4e34\u65f6\u7ebf\u7a0b\u914d\u7f6e\uff0c\u4e0d\u6539\u7528\u6237\u5f00\u5173\u3001\u4e0d\u53d1\u9001\u6d88\u606f\u3001\u4e0d\u4e0b\u8f7d\u66f4\u65b0\u3002\u5b83\u4e0d\u4ee3\u8868\u771f\u5b9e\u89c6\u9891\u64ad\u653e\u548c\u670d\u52a1\u5668\u5e7f\u544a\u5df2\u5168\u90e8\u7aef\u5230\u7aef\u9a8c\u6536\u3002"

    const/16 v4, 0xd

    invoke-direct {v0, v1, v2, v4, v8}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->text(Landroid/content/Context;Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    invoke-direct {v0, v1, v3}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v0, v1, v3}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v3

    const/16 v5, 0xc

    invoke-direct {v0, v1, v5}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->dp(Landroid/content/Context;I)I

    move-result v1

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5, v3, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v6, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 70
    invoke-virtual {v0, v10}, Lcc/ioctl/tmoe/fragment/ModernSettingsFragment;->setFragmentView(Landroid/view/View;)V

    .line 71
    const-string v1, "TMoe-UI"

    const-string v2, "ModernSettingsFragment view created"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    return-object v10
.end method

.method public onFragmentCreate()Z
    .locals 1

    .line 36
    const/4 v0, 0x1

    return v0
.end method
