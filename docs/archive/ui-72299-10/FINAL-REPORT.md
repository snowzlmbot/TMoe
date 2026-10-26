# TMoe 72299最终验收报告（DexSQL 0.1.1）

## 构建与设备

- Telegram：`org.telegram.messenger.web` 13.1.0 / versionCode 72299。
- TMoe：`1.0.r241.api102`。
- DexSQL：官方 `LSPosed/dexsql-release` v0.1.1，linux-arm64 SHA256 `8095a4ac...d2cd13f`；MCP initialize + tools/list 已验证。
- 最终APK Release：`ui-72299-10`（包含显示用户ID修复）。
- 最终APK SHA256：`2a95b0853c9b619eed268d42c74f0da826e418759a6180d01ad7750459431eb5`；设备安装包与该值一致。
- 固定签名证书 SHA-256：`b4d005102a1c02d0ffa90de8ab39d99798f46b10e358cd742c1a3a4f56c19dc4`。
- DEX SHA-1/Adler32、zipalign、APK v2/v3 签名均通过。
- Minis 已恢复为普通 `untrusted_app_34` 域；没有再次系统化。

## 已通过真实差分测试：18/18（另有本人资料页端到端验收）

测试在 Telegram 真实 ClassLoader 和真实 Hook 链上执行；使用临时线程配置，不改变用户持久开关；构造本地对象/视图，不发消息、不下载更新、不访问网络。最终回归报告文件：`behavior-id-final.json`。

1. 精确人数：`12.3K -> 12345`。
2. 受限聊天转发：`true -> false`。
3. 媒体剧透：`true -> false`。
4. 文字剧透遮罩：effect count `1 -> 0`。
5. 会员特效：附加特效 `present -> null`，会员资格判定保持 `true`。
6. 回应四来源：enabled/recent/saved/top 各 `1 -> 0`。
7. 会员贴纸标签：来源列表 `1 -> 0`。
8. 低性能模糊：`false -> true`。
9. 更新44dp占位：子项 `1 -> 0 -> 0 -> 1`，原始高度154px，关闭后恢复。
10. 更新可用状态：`true -> false -> true`。
11. 普通更新弹窗：真实弹窗显示 -> 禁用时不构造 -> 关闭禁用后再次显示；测试自动 dismiss，未点击下载。
12. 强制更新遮挡：真实遮挡页显示 -> 禁用时不创建，测试恢复Activity原状态。
13. 已缓存赞助模型：原模型 -> null -> 原模型，未发送网络请求。
14. 问候视图：具体 `aj` 的真实 sticker View `VISIBLE -> GONE -> VISIBLE`。
15. 回应发送边界：空对象安全样本，原逻辑 no-op，启用后 callback 完成且不发请求。
16. 频道切换面板：`true -> false`。

17. 用户ID 64位解析：用户/群组/话题正确，dialog ID 不被误显示，零值不伪装成功。
18. 用户ID原生行：N2从8到9，后续索引同步移动，原生c9单元绑定、点击启用、差异列表稳定key均通过。

## 显示用户ID：本人真实资料页验收通过

- 正确用户ID字段 `e1:J`，群组 `f1/E2.id`，话题 `g1:J`，行数 `N2:I`；旧 `d1/D2.id/M2` 映射错误。
- 原旧 `(View,View)void` Hook是焦点回调，不是点击；新Hook走精确 `a0(ProfileActivity,Context,long,View,int,float,float)`，原生单元点击也绑定复制。
- 104个行索引来自j5中显式初始化为-1的字段，不盲移所有int字段。
- 用户已解锁手机并许可实测；打开本人原生Profile，实际可见ID行只出现一次。
- 显示内容与Telegram缓存本人ID完全一致。
- 执行真实单元performClick后，系统剪贴板与本人ID一致，随后恢复原剪贴板；不记录原内容和真实ID。
- 连续两次重建行数不增长、索引和值稳定；关闭移除行，开启恢复恰好一行。
- 冷启动重复本人页验收结果相同，无TMoe-ID/AndroidRuntime错误。
- 脱敏报告：`profile-live-final.json`，状态PASS，`actual_id_recorded=false`、`previous_clipboard_restored=true`。
- “显示用户ID”和“禁止更新”持久配置当前均为true，未清理Telegram数据。

## 用户要求的禁止更新

`ProhibitUpdates` 已加入现代设置页。DexSQL已确认并Hook：

- `SharedConfig.isAppUpdateAvailable()`：启用时返回 false。
- `SharedConfig.setNewAppVersionAvailable(...)`：启用时拒绝写入新更新。
- ApplicationLoader / ApplicationLoaderImpl 普通更新弹窗：返回 handled=true，不创建 Dialog。
- `ApplicationLoader.checkForUpdates()` / Impl internal：启用时跳过检查。
- `LaunchActivity.z(boolean)`：启用时跳过更新请求发送。
- `LaunchActivity.M0(...)`：启用时不创建强制更新遮挡页。
- `Components.j81` 的 create/update/progress：启用时删除已有提示条、清理子视图和占位，禁用后恢复原方法。

这不是改网络、冻结Telegram或删除更新状态；关闭开关会恢复原逻辑。

## 仍未宣称端到端通过的功能

- 实际视频播放的扬声器/静音硬件行为；已通过 `ko.R9()`真实方法差分，但未播放真实视频。
- 服务器返回的实时赞助消息；已通过真实缓存模型差分，未等待服务器广告。
- 真实空白聊天问候贴纸；已通过具体 `aj`真实子视图差分，未在真实空聊天界面触发。
- 付费回应/服务器权限策略；发送边界已阻断，但未操作真实账号。

## 重要限制

不能用“开关已保存”或“Hook count 非零”冒充端到端功能通过。上面明确分开了已测行为与未测环境依赖行为。