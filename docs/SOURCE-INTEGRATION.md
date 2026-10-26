# 源码整合与开关验收

## 唯一实现来源

当前代码位于 `app/src/main/java/cc/ioctl/tmoe/`。`repair/` 中维修Java、生成Smali、编译桩和APK补丁工具已从当前树删除，历史仍可在Git历史查看。证据保存在 `docs/archive/ui-72299-10/`。

- `startup/ModernHookEntry`：API102入口，精确72299签名、运行时按开关决定proceed/拦截。
- `startup/ModernFeatureHooks`：更新、剧透、回应、问候、贴纸等附加边界和即时视图恢复。
- `startup/ModernProfileIds`：用户/群组/话题ID、原生单元绑定、点击复制、开关即时失效。
- `startup/ModernPaidReactionGuard`：付费回应创建/提交及原生Undo状态保护。
- `startup/ModernPreferences`：唯一现代配置命名空间，兼容已安装修复版的持久值。
- `startup/ModernFeatureCatalog`：目标有任何失配就禁用对应开关并显示原因。安装数不等于效果验收。
- `startup/ModernUiHooks` / `fragment/ModernSettingsFragment`：真正源码资源ID和现代设置入口。
- `util/HostSignatureRegistry`：按版本匹配宿主，未知版本不盲套混淆名。
- `rtti/*`：动态Fragment生成与加载，使用真实宿主类型、接口、返回类型。

## 两个变体

`productionRelease` 不含验收入口或测试类。`verificationRelease` 与生产使用相同main源码，仅加入隔离fixture、显式intent验收及本人资料测试。二者采用相同固定证书，可覆盖安装，不清Telegram数据。

构建只使用Gradle/AGP/Kotlin/NDK，不下载旧TMoe APK，不调用Apktool补丁。入口 `.github/workflows/source-build.yml`。CI编译4个ABI，运行JUnit，再扫描生产DEX确认没有测试类、测试类反射字符串和nonce入口，最后固定签名。

## 本次纠正的问题

1. 旧代码未进入源码树，无法从仓库复现运行包：已整合。
2. DexMethodDescriptor解析数组/对象后额外跳一字符，导致动态DEX的参数与outsSize错误：已修复并添加JUnit。
3. 新宿主parentLayout为j5接口，finishFragment(boolean)返回boolean：代理按真实宿主签名适配。
4. ID关闭后旧cell监听仍复制：点击时查即时开关与当前绑定身份，关闭清理模块自己安装的监听。
5. 回应恢复丢失原visibility/height和最新绑定：保存快照并重绑定。
6. 旧回应测试用null消息并断言虚假完成回调：不再伪造callback；新增有效消息1->0->1请求sink测试。
7. 已显示更新弹窗和强制遮挡未即时清理/恢复：补上专属Dialog关闭与M0原生重建。
8. 付费回应不经过普通sendReaction：增加独立队列/提交guard，原生取消仅在未提交、未取消、已预留且身份一致时执行，防双回滚。

## 已有证据

- 源码构建、JUnit、v2/v3签名、DEX SHA1/Adler32及生产隔离扫描通过。
- 22项验证版检查已通过，其中包含13功能目标健康、ART代理实例化、有效普通回应1->0->1、视频R9到playMessage入口1->0->1、更新已有弹窗/遮挡即时切换、文字/媒体剧透、会员特效/标签、广告缓存模型、问候视图等。健康检查与真正行为测试分别记录，不将22当作22个功能。
- 真实源码设置页：可见，13个开关健康，零目标错误。
- 源码本人资料页：原生ID可见且匹配本人缓存，点击复制匹配，恢复剪贴板，连续重建无重复，关闭移除/开启一行，PASS且不记录实际ID。

## 不能扩大解释的边界

本地播放sink不是扬声器硬件实播；本地广告模型不是等待服务器广告。测试不会发真实消息、购买或消耗Stars；付费队列仅合成控制器及内存请求sink，不代表真实付费成功/权限策略验收。legacy的头像、手机号、命令确认等功能未适配现代API时不伪装成现代可用开关。
