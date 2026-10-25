package cc.ioctl.tmoe.base;
import android.content.Context; import android.view.View;
public abstract class BaseProxyFragment {
 public BaseProxyFragment() {}
 public abstract View onCreateView(Context c);
 public boolean onFragmentCreate(){return true;}
 public Object getProxyObject(){return null;}
 protected void setFragmentView(View v){}
}
