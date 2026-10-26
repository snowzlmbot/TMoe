# TMoe Telegram 13.1.0 UI 修复：定向取证与最小补丁

## 当前状态

- 目标 APK：`telegram-13.1.0.apk`
- SHA-256：`4c122bca5edb997e38fc65360c33e6e726e6f1b31ba23987df0adad0e323a9d8`
- 目标包：`org.telegram.messenger.web`，versionCode `72299`。
- 本次已定位主设置页并写出补丁；**尚未编译、签名或安装本次补丁**。
- 既有已安装修复版仅修了宿主版本门槛，不代表设置页或所有功能已经可用。

## 确认的根因与正确契约

旧现代 UI 层绑定 `org.telegram.ui.ga1`，但该类在当前 APK 中是 Runnable。
实际主设置页为 `org.telegram.ui.t91`，不是 ArchiveSettings 对应的 `org.telegram.ui.m`。

已直接读取原始 DEX class_data/proto/method/field tables，并确认设置行填充方法：

```
Lorg/telegram/ui/t91;->b0(Lorg/telegram/ui/t91;Ljava/util/ArrayList;)V
  method_idx = 53793
  code_item = 10055944 (classes3.dex)
```

该方法引用 `SettingsAccount`、`SettingsChat`、`SettingsPrivacySecurity`、
`SettingsNotifications`、`SettingsData`、`SettingsFolders`、`SettingsDevices`、
`SettingsPowerSaving`、`SettingsLanguage`、`SettingsHelp`。
语言项 id 保持为 `10`，与 TMoe 当前插入点逻辑一致。

对应点击回调：

```
Lorg/telegram/ui/t91;->f0(Lorg/telegram/ui/t91;Lorg/telegram/ui/Components/f71;)V
  method_idx = 53801
  code_item = 10064724 (classes3.dex)
```

列表项：`org.telegram.ui.Components.f71`。
- 构造器 `<init>(I)V`。
- `d:I` = item id。
- `k:I` = icon id。
- `l:CharSequence` = title。
- `m:CharSequence` = subtitle。
- `n:CharSequence` = secondary value。
- 静态 `d(int,int,String,String)` 创建类型 3 普通文本图标行。

主设置行 Factory：

```
org.telegram.ui.p91.a(int,int,int,int,CharSequence,CharSequence,CharSequence)
 -> org.telegram.ui.Components.f71
```

## 为什么不只替换两个类名

旧 `HostSignatureRegistry` 仅支持 `71839`。设置点击调用动态 Fragment 时还会使用
旧 BaseFragment 映射 `s2`，而当前 APK 的真实 BaseFragment 是 `ActionBar.r2`。

本次补丁新增 **仅 versionCode=72299** 的以下映射，并保留旧版本逻辑：
- BaseFragment -> `org.telegram.ui.ActionBar.r2`
- ActionBar -> `org.telegram.ui.ActionBar.l`
- Theme -> `org.telegram.ui.ActionBar.n6`

`r2` 的字段已确认：
- `actionBar: Lorg/telegram/ui/ActionBar/l;`
- `parentLayout: Lorg/telegram/ui/ActionBar/j5;`
- `arguments: Landroid/os/Bundle;`

另在 `prepareHost` 设置模块路径后注入模块资源，防止列表首次绑定时图标资源缺失。

## 本次文件

- `patch_ui_smali.py`：对 Apktool 解出的 smali 进行受约束补丁；缺少预期代码则停止。
- `repair-ui.yml`：待提交的 GitHub Actions 工作流。
- `dex-analysis.html`：无需 shell 的本地 DEX 读取页面，XHR 加载原始 DEX。

## 构建与验收规则

使用 Apktool/smali 重组，不直接原地修改 DEX 字符串：`ga1 -> t91` 会改变字符串表排序。
编译后必须重新验证 DEX SHA-1/Adler32、zipalign 与 APK 签名。

安装后至少验收：
1. 设置页出现“TMoe 设置”，语言行与其他原有行仍正常；
2. 点击可进入 TMoe 设置页，不是空白/无反应；
3. 至少一个开关可切换并在重启宿主后保留；
4. 冷启动宿主无崩溃；
5. 使用新 PID 和本次时间范围日志，不把搜索命令的自回显当成 Hook 证据。

## 当前实际阻塞

所有 `shell_execute` 在执行命令之前均报：

```
proot error: ptrace(TRACEME): Permission denied
proot error: execve("/usr/bin/setsid"): Permission denied
```

因此 gh/PAT、云端工作流推送、JADX、安装命令当前均无法调用。
网页 GitHub 也未登录。没有读取或转储任何 GitHub 凭据绕过此限制。
只能继续原生 file_read/file_write 与浏览器静态分析；这不等于恢复执行层。
不应继续循环等待、全量反编译或再委派读取巨型日志。

## 签名注意

旧 repair-build.yml 在没有仓库 Secrets 时每次生成新 CI 私钥，无法跨构建覆盖安装。
本次 repair-ui.yml 要求固定的仓库签名 Secrets，缺失则明确失败，不再临时生成新密钥。
当前已装 CI 证书：CB4DCC9311F82EFD41FBF1EF9266BFDDB17D97E330353642FC6A784081B193D2。
当前原始安装签名私钥和首次 CI 私钥均未确认持有；不能声称新构建可无缝覆盖。
