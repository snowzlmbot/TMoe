# DexSQL 72299 feature repair evidence

Primary engine: LSPosed DexSQL 0.1.1+6ac7870875a519ec471e41c93fc86d80e8e2bce7.
Official linux-arm64 binary SHA256 8095a4acafbfda3c4d502423f185c28063132b2fb3b11489aba7ee2fe2dcd13f; Alpine requires gcompat. MCP initialize/tools/list verified by temporary probe; no arbitrary client config was changed.

APK: Telegram web 13.1.0/72299; SHA256 4c122bca5edb997e38fc65360c33e6e726e6f1b31ba23987df0adad0e323a9d8. Reusable cache is local; original APK is not modified.

## Query families

```
SELECT descriptor FROM methods WHERE opcode_count IS NOT NULL AND name IN ('isAppUpdateAvailable','setNewAppVersionAvailable','showUpdateAppPopup','createUpdateUI','updateAppUpdateViews');
SELECT method,callee FROM method_calls WHERE callee_name IN ('showUpdateAppPopup','updateAppUpdateViews','getPremiumStickerAnimation','sendReaction');
SELECT method,field_name,using_type FROM method_field_accesses WHERE field_class='Lorg/telegram/messenger/SharedConfig;' AND field_name='pendingAppUpdate';
```

Use file_id for decode: app classes in 0, UI definitions in 2. Reference method_ids in another DEX are not necessarily implementations.

## Update block

- `SharedConfig.isAppUpdateAvailable()Z` false only while enabled; state is not erased.
- `SharedConfig.setNewAppVersionAvailable(TL_help_appUpdate)Z` refuses new pending updates while enabled.
- ApplicationLoader/Impl showUpdateAppPopup(Context,TL_help_appUpdate,int) returns true (handled), not false (could trigger caller fallback).
- `LaunchActivity.z(Z)V` initiates actual check; `LaunchActivity.M0(int,TL_help_appUpdate,boolean)` creates mandatory full-screen overlay.
- `Components.j81.createUpdateUI(I)V` creates a 44dp FrameLayout `a` in parent `f` even before visible. Only hiding text/alpha is insufficient. Hook prevents creation and removes existing child, clears owned view refs, requests parent layout. Disabled behavior calls original; no package freeze/network setting changes.
- UpdateAppAlert used for unsupported content is deliberately not blindly suppressed.

## Broken feature fixes

- Text spoilers: `rg.g.a(View,Layout,int,int,Spanned,Stack,List,ArrayList)` creates effect objects; `Components.m21.c()Z` checks flag 0x100. Old media-only hook missed text.
- Reactions: enabled list alone misses recent/saved/top and ChatFull.available_reactions. Add list sources, selection pipeline, sendReaction boundary. Do not send a real test reaction.
- Premium effect: old isPremiumSticker=false changed semantic classification. Disable old registration; target getPremiumStickerAnimation static/instance and nz.d overlay. Base sticker remains visible/animated; advertised as disabling premium overlay effects, not all sticker animation.

## Acceptance

Runtime tests invoke real hooked methods on fabricated objects/views and compare feature override=false/true on one thread. No fake pass constants, no message sends, no downloads, no permanent mutation of user switches. Existing state temporarily used for update test must be restored in finally.

Runtime end-to-end coverage and failures must be reported separately. Method registration counts, setting persistence and tests of pure formatting alone do not certify every feature. Live sponsored ad/audio playback still require independent UI test evidence.
