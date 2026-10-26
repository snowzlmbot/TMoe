# TMoe 源码整合最终验收（Telegram Web 13.1.0 / 72299）

## 产物

- 仓库提交：`c422308`（source-build workflow 已成功）。
- 生产APK Release：`source-72299-9`，固定签名 SHA-256 证书：`b4d005102a1c02d0ffa90de8ab39d99798f46b10e358cd742c1a3a4f56c19dc4`。
- 生产APK不是旧APK重签或Smali补丁：由 `app/src/main` 的 Java/Kotlin/C++、Gradle、CMake 和 NDK 完整构建。
- 生产APK静态扫描：`SOURCE_PRODUCTION_STATIC_PASS`；无测试类、无显式测试nonce、包含现代API入口和Native库。
- 验证APK只用于本机验收，生产APK不包含验证测试类。

## 源码目录

实现统一位于 `app/src/main`：

- `startup/ModernHookEntry.java`：LibXposed API102入口。
- `startup/ModernFeatureHooks.java`：13个核心功能族及开关实际边界。
- `startup/ModernProfileIds.java`：Telegram 72299 ProfileActivity原生ID行。
- `startup/ModernPaidReactionGuard.java`：独立付费回应队列创建/提交保护和安全Undo。
- `startup/ModernUiHooks.java`、`fragment/ModernSettingsFragment.java`：新版t91/f71/p91设置入口。
- `util/HostSignatureRegistry.java`：72299精确混淆映射并保留旧版分支。
- `rtti/ProxyFragmentImplDexCreator.java`、`util/dex/DexMethodDescriptor.java`：真实接口返回类型、对象/数组/宽参数解析和只读动态DEX。
- `src/verification`：仅验证变体；不进入production APK。

历史Smali维修脚本和运行包证据在 `docs/archive/ui-72299-10/`，不是活动实现目录。

## 22项源码版验收

实际在 Telegram 72299 ClassLoader/Hook链上运行，使用合成对象和隔离请求sink，不发真实消息、不下载更新、不访问真实余额：

1. 13个目标健康检查全部通过。
2. 动态Fragment由源码生成并通过ART校验。
3. 视频 `ko.R9()` 到 `MediaController.playMessage`：`1 -> 0 -> 1`。
4. 精确人数：`12.3K -> 12345`。
5. 受限聊天转发：`true -> false`。
6. 媒体剧透和文字遮罩：均被拦截。
7. 会员特效被拦截但会员资格不伪造。
8. 最近/收藏/热门/启用回应源：均`1 -> 0`。
9. 会员贴纸标签、模糊限制、频道切换均通过。
10. 更新44dp占位、普通弹窗和强制遮挡：均支持开启拦截/关闭恢复。
11. 赞助消息缓存模型：原模型 -> null -> 原模型。
12. 问候视图：`VISIBLE -> GONE -> VISIBLE`。
13. 普通回应有效消息请求sink：`1 -> 0 -> 1`；无效输入保持宿主原本0回调语义。
14. 用户ID：64位用户/群组/话题解析、原生c9单元、w01差异key、关闭旧绑定失效均通过。

本人资料页另行真实验收：ID行显示一次、值匹配本人缓存、点击复制、恢复原剪贴板、重复重建无增长、关闭移除/开启恢复、冷启动重复通过；实际ID不写入报告。

## 未声称的范围

真实服务器广告、真实空聊天问候贴纸、真实硬件音频播放、真实账号付费回应权限没有用本地fixture冒充端到端通过。付费回应源码已保护独立`TL_messages_sendPaidReaction`路径；验证只确认在虚拟账号/内存请求sink下开启禁止不会发送、原生Undo不二次回滚。
