# TMoe

[![license](https://img.shields.io/github/license/cinit/TMoe.svg)](https://www.gnu.org/licenses/gpl-3.0.html)
[![GitHub release](https://img.shields.io/github/release/cinit/TMoe.svg)](https://github.com/cinit/TMoe/releases/latest)
[![Telegram](https://img.shields.io/static/v1?label=Telegram&message=TMoe0&color=0088cc)](https://t.me/TMoe0)

TMoe 是一个兼容若干第三方开源 Telegram 客户端的开源 Xposed 模块

TMoe is an open source Xposed module compatible with several third-party open source Telegram clients.

## 使用方法 / Usage

激活本模块后，在 Telegram 客户端的设置中点击 "TMoe 设置" 即可开关对应功能。

After activating this module, click "TMoe Settings" in the Telegram client settings to turn on or off the corresponding function.

## 一切开发旨在学习，请勿用于非法用途

- 本项目保证永久开源，欢迎提交 Issue 或者 Pull Request，但是请不要提交用于非法用途的功能。
- 如果某功能被大量运用于非法用途，那么该功能将会被移除。
- 开发人员可能在任何时间**停止更新**或**删除项目**

## For educational purposes only, do not use for illegal purposes

- This project is guaranteed to be open source forever. Welcome to submit issues or pull requests, but do not submit features for illegal purposes.
- If a feature is widely used for illegal purposes, the feature will be removed.
- The developer may **stop updating** or **delete the project** at any time.

## 功能介绍 / Features

1. 调试模式 / Debug mode
2. 去除复制保存消息限制 / Remove the limit on copying and saving messages
3. 隐藏赞助消息 / Hide sponsored message
4. 隐藏指定用户头像 / Hide specific user avatars
5. 禁用剧透 / Prohibit Spoilers
6. 禁止频道滑动切换 / Prohibit Channel Switching
7. 禁止表情回应 / Prohibit Enable Reactions
8. 禁用问候贴纸 / Prohibit Chat Greetings
9. 隐藏电话号码 / Hide Phone Number
10. 拒绝人数舍入 / Show Channel Detail Numbers
11. 允许非管理员查询部分群组信息 / Allow non-admin to query some group information
12. 询问是否发出指令 / Ask for tap command
13. 强制显示顶栏模糊选项 / Force chat blur option available
14. 禁用会员贴纸动画 / Disable Premium Sticker Animation
15. 按音量键时保持视频静音 / Keep video muted when pressing the volume button
16. 以消息模式查看话题群组 / View as Group by default in Topic
17. 隐藏标签面板的会员贴纸包 / Hide Premium Sticker Tab
18. 显示消息ID / Show message ID
19. 为聊天菜单添加刷新消息按钮 / Add Reload Message Button in chat menu
20. TODO 咕咕咕

## 支持的客户端 / Supported clients

- 任何基于 Telegram Android 官方 [TMessagesProj](https://github.com/DrKLO/Telegram) 的无混淆客户端。

  Any official Telegram Android [TMessagesProj](https://github.com/DrKLO/Telegram) based client without obfuscation.

- 完整的列表请参考 [HookEntry.java](app/src/main/java/cc/ioctl/tmoe/startup/HookEntry.java)
  以及 [模块作用域](app/src/main/res/values/arrays.xml).

  Please refer to [HookEntry.java](app/src/main/java/cc/ioctl/tmoe/startup/HookEntry.java)
  and [Xposed scope](app/src/main/res/values/arrays.xml) for the complete list.

- 如果您的客户端满足兼容性要求但不在列表中，请在 [HookEntry.java](app/src/main/java/cc/ioctl/tmoe/startup/HookEntry.java)
  和 [模块作用域](app/src/main/res/values/arrays.xml) 中添加对应的值。

  If your client meets the compatibility requirements but is not in the list, please add the corresponding value
  in [HookEntry.java](app/src/main/java/cc/ioctl/tmoe/startup/HookEntry.java) and [Xposed scope](app/src/main/res/values/arrays.xml).

## License

- [GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.html)

```
Copyright (C) 2021-2022 xenonhydride@gmail.com

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
```


## Telegram Web 13.1.0 / API102 源码整合

针对 `org.telegram.messenger.web` versionCode `72299`，当前实现已直接整合到 `app/src/main`：

- `startup/ModernHookEntry.java`：LibXposed API 102 入口及精确宿主签名 Hook。
- `startup/ModernFeatureHooks.java`：更新提示、剧透、回应、模糊、频道、贴纸和问候等功能。
- `startup/ModernProfileIds.java`：ProfileActivity 原生 ID 行、64 位用户/群组/话题 ID、复制和差异刷新。
- `startup/ModernPaidReactionGuard.java`：付费回应队列与独立 `TL_messages_sendPaidReaction` 边界。
- `startup/ModernUiHooks.java` / `fragment/ModernSettingsFragment.java`：新版 `t91/f71/p91` 设置入口和现代设置页。
- `util/HostSignatureRegistry.java`：72299 专用映射，保留旧版本分支。
- `rtti/ProxyFragmentImplDexCreator.java`：动态 Fragment DEX 生成；参数描述符解析覆盖对象、数组和宽类型。

正式版源码构建：

```sh
./gradlew --no-daemon --max-workers=2 :app:assembleProductionRelease
```

验证版（仅用于本地/CI 行为验收，含测试入口和账号/剪贴板测试）：

```sh
./gradlew --no-daemon --max-workers=2 :app:assembleVerificationRelease
```

生产构建不包含 `ModernRuntimeTests`、`ProfileLiveTest`、`VerificationRunner`、`SourceUiTest`、`VerificationNetworkSink` 或 `tmoe_selftest_nonce`。GitHub Actions 使用固定 Secrets 签名，禁止临时密钥。

### 已验证边界

源码版已通过 19 项宿主方法差分、源码动态设置页 13 个开关健康验证、用户ID资料页真实显示/复制/刷新/关闭恢复验证。视频真实音频播放、服务端广告、真实空聊天问候贴纸和付费回应服务端权限仍单独标注，不能由本地 fixture 冒充端到端通过。
