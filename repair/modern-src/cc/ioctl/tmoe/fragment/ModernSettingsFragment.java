package cc.ioctl.tmoe.fragment;

import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import java.lang.reflect.Method;
import cc.ioctl.tmoe.base.BaseProxyFragment;
import cc.ioctl.tmoe.startup.ModernPreferences;

/** Native settings screen for verified API102 hook targets. No legacy hook singletons. */
public final class ModernSettingsFragment extends BaseProxyFragment {
    private static final String[][] OPTIONS = {
        {"ShowIdInProfile", "显示用户ID", "在个人资料页加入用户/群组/频道ID；点按该行复制"},
        {"ProhibitUpdates", "禁止更新", "屏蔽应用内更新弹窗、强制更新页和底部提示条，并移除44dp占位；关闭恢复原逻辑"},
        {"AntiAntiForward", "解除复制保存消息限制", "控制转发及受限媒体判定；请尊重内容作者权限"},
        {"HideSponsoredMsg", "隐藏赞助消息", "拦截模型与聊天页广告插入入口；不保证清除已缓存广告"},
        {"ProhibitSpoilers", "禁用剧透", "同时拦截媒体剧透判定和文字剧透遮罩生成；已打开消息需重新布局"},
        {"ForceBlurChatAvailable", "允许顶栏模糊", "解除 Telegram 的模糊可用性限制"},
        {"ChannelDetailNumbers", "显示精确人数", "不把人数缩写为 K 或 M"},
        {"DisablePremiumStickerAnimation", "禁用会员贴纸特效", "拦截会员贴纸附加特效数据与播放入口，不伪造会员资格；基础贴纸仍可显示"},
        {"ProhibitEnableReactions", "禁止表情回应", "覆盖最近、收藏、热门与群限定入口，并拦截回应发送；已有聊天需重新打开"},
        {"HidePremiumStickerSetTab", "隐藏会员贴纸包", "过滤会员贴纸最近使用列表"},
        {"ProhibitChatGreetings", "禁用问候贴纸", "抑制空白聊天问候视图；需重新打开聊天"},
        {"KeepVideoMuted", "保持可见视频静音", "阻止自动切入有声播放；不影响你主动播放的视频"},
        {"ProhibitChannelSwitching", "禁止滑动切换频道", "抑制下一个频道查找和底部切换面板"}
    };
    private int dp(Context c, int value) { return Math.round(value * c.getResources().getDisplayMetrics().density); }
    private TextView text(Context c, String value, int size, int color) {
        TextView v = new TextView(c); v.setText(value); v.setTextSize(size); v.setTextColor(color); return v;
    }
    @Override public boolean onFragmentCreate() { return true; }
    private void back() {
        try {
            Object proxy = getProxyObject();
            Method m = proxy.getClass().getMethod("finishFragment", boolean.class);
            m.invoke(proxy, true);
        } catch (Throwable e) { android.util.Log.e("TMoe-UI", "Modern settings back failed", e); }
    }
    @Override public View onCreateView(final Context c) {
        boolean dark = (c.getResources().getConfiguration().uiMode & 48) == 32;
        int fg = dark ? Color.WHITE : Color.rgb(25,28,35);
        int secondary = dark ? Color.rgb(180,188,204) : Color.rgb(90,100,118);
        int bg = dark ? Color.rgb(18,23,32) : Color.rgb(246,248,252);
        LinearLayout root = new LinearLayout(c); root.setOrientation(LinearLayout.VERTICAL); root.setBackgroundColor(bg);
        LinearLayout head = new LinearLayout(c); head.setOrientation(LinearLayout.HORIZONTAL); head.setPadding(dp(c,8),dp(c,8),dp(c,16),dp(c,8));
        TextView arrow = text(c,"‹ 返回",18,Color.rgb(87,150,245));arrow.setGravity(17);arrow.setPadding(dp(c,10),dp(c,10),dp(c,16),dp(c,10));arrow.setOnClickListener(v->back());head.addView(arrow);
        TextView title=text(c,"TMoe 设置 · API102",20,fg);title.setGravity(16);head.addView(title,new LinearLayout.LayoutParams(0,dp(c,52),1));
        root.addView(head);
        ScrollView scroll=new ScrollView(c); LinearLayout body=new LinearLayout(c);body.setOrientation(LinearLayout.VERTICAL);body.setPadding(dp(c,16),dp(c,10),dp(c,16),dp(c,30));scroll.addView(body);root.addView(scroll,new LinearLayout.LayoutParams(-1,0,1));
        TextView intro=text(c,"Telegram 13.1.0 / 72299 · LSPosed API102\n下列开关使用现代 API，不加载传统 Xposed Hook 类。配置保存在 Telegram 沙盒内，更新模块不会清除。",14,secondary);intro.setPadding(0,0,0,dp(c,18));body.addView(intro);
        for (final String[] option : OPTIONS) {
            final String key=option[0];
            Switch toggle=new Switch(c);toggle.setText(option[1]);toggle.setTextSize(16);toggle.setTextColor(fg);toggle.setPadding(dp(c,10),dp(c,12),dp(c,10),dp(c,8));toggle.setMinHeight(dp(c,56));toggle.setChecked(ModernPreferences.isEnabled(key));
            toggle.setOnCheckedChangeListener((button,checked)->{
                if(!ModernPreferences.setEnabled(key,checked)) Toast.makeText(c,"保存失败，请查看 TMoe-UI 日志",Toast.LENGTH_LONG).show();
                else { android.util.Log.i("TMoe-UI","preference saved: "+key+"="+checked); cc.ioctl.tmoe.startup.ModernFeatureHooks.onToggleChanged(key); }
            });
            body.addView(toggle,new LinearLayout.LayoutParams(-1,-2));
            TextView detail=text(c,option[2],13,secondary);detail.setPadding(dp(c,10),0,dp(c,10),dp(c,12));body.addView(detail);
            View line=new View(c);line.setBackgroundColor(dark?0xff303947:0xffdce2ec);body.addView(line,new LinearLayout.LayoutParams(-1,dp(c,1)));
        }
        TextView note=text(c,"兼容性说明\n原设置页中仍依赖传统 API 的功能暂不显示。抽屉手机号及其他旧API功能仍需单独适配；用户ID功能使用新的原生资料行实现。\n\n修改后若界面仍显示缓存结果，返回后重新打开聊天，或重启 Telegram。无需退出账号。",14,secondary);note.setPadding(dp(c,10),dp(c,24),dp(c,10),dp(c,20));body.addView(note);
        TextView test=text(c,"运行真实功能差分测试",16,Color.rgb(87,150,245));test.setPadding(dp(c,10),dp(c,18),dp(c,10),dp(c,18));test.setOnClickListener(v->{String result=cc.ioctl.tmoe.startup.ModernRuntimeTests.run((android.app.Activity)c);Toast.makeText(c,result,Toast.LENGTH_LONG).show();});body.addView(test);
        TextView testResult=text(c,"测试调用Telegram真实方法，对比关闭/开启/恢复结果；使用临时线程配置，不改用户开关、不发送消息、不下载更新。它不代表真实视频播放和服务器广告已全部端到端验收。",13,secondary);testResult.setPadding(dp(c,10),0,dp(c,10),dp(c,12));body.addView(testResult);
        setFragmentView(root);
        android.util.Log.i("TMoe-UI","ModernSettingsFragment view created");
        return root;
    }
}
