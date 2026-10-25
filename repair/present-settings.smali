.method private static presentSettings(Ljava/lang/Object;)V
    .locals 7
    :try_start_tmoe
    const-string v0, "org.telegram.ui.ActionBar.BaseFragment"
    invoke-static {v0}, Lcc/ioctl/tmoe/util/HostSignatureRegistry;->resolve(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static {v0}, Lcc/ioctl/tmoe/util/Initiator;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    move-result-object v0
    invoke-static {}, Lcc/ioctl/tmoe/rtti/ProxyFragmentRttiHandler;->checkProxyFragmentRttiStatus()Z
    move-result v1
    if-nez v1, :tmoe_proxy_ready
    invoke-static {v0}, Lcc/ioctl/tmoe/rtti/ProxyFragmentRttiHandler;->initProxyFragmentClass(Ljava/lang/Class;)V
    :tmoe_proxy_ready
    new-instance v1, Lcc/ioctl/tmoe/fragment/SettingsFragment;
    invoke-direct {v1}, Lcc/ioctl/tmoe/fragment/SettingsFragment;-><init>()V
    invoke-virtual {v1}, Lcc/ioctl/tmoe/base/BaseProxyFragment;->getProxyObject()Ljava/lang/Object;
    move-result-object v1
    const/4 v2, 0x1
    new-array v3, v2, [Ljava/lang/Class;
    const/4 v4, 0x0
    aput-object v0, v3, v4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v5
    const-string v6, "presentFragment"
    invoke-virtual {v5, v6, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v3
    invoke-virtual {v3, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    new-array v2, v2, [Ljava/lang/Object;
    aput-object v1, v2, v4
    invoke-virtual {v3, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    const-string v2, "TMoe-UI"
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "presentSettings host result="
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_tmoe
    .catchall {:try_start_tmoe .. :try_end_tmoe} :tmoe_present_error
    return-void
    :tmoe_present_error
    move-exception v0
    const-string v1, "TMoe-UI"
    const-string v2, "presentSettings failed"
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    return-void
.end method
