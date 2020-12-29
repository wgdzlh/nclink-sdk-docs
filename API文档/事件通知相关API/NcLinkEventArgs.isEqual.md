# NcLinkEventArgs.isEqual

## 声明

- C#版：

```c#
public class NcLinkEventArgs : EventArgs
{
    public bool isEqual(NcLinkEventArgs dest)
}
```

## 描述

​       本API为数据结构NcLinkEventArgs类成员方法，通过NcLinkEventArgs对象调用，用于作一系列判断，判断一些信息与要产生事件通知的设备的一些基本信息是否一致，一致的话返回true，否则返回false。

## 参数

1. dest：一个NcLinkEventArgs对象，目的是传入要产生事件通知的设备的一些基本信息，以便作后续判断。

## 返回值与异常

- 期望返回值：返回的是表示bool型变量的值true或者false。信息一致的话返回true，否则返回false。
- 各类异常：无异常抛出。

## 代码

- C#版：

```c#
using System;
using nclink_client;
namespace nclink_client_app
{
    class TestApp
    {
        DevClient mc1 = null;
        mc1 = new DevClient("127.0.0.1", 1883, "STRESS_TEST_00001", false);
        NcLinkEventArgs pdu = new NcLinkEventArgs();
        #region Reset
        bool rc = false;
		if (dest == null || !this.DevGuid.Equals(dest.DevGuid) || dest.Id == null)
        {
            return false;
        }

		if (this.mValue == null && dest.SubValueCnt == 0)
		{
            return true;
        }

         if (this.Id.Equals(dest.Id))
         {
              if (this.mValueType == dest.mValueType && this.mSubValueCnt == dest.mSubValueCnt)
              {
                   if (this.mValue != null && this.mValue.Equals(dest.mValue))
                   {
                       rc = true;
                   }
               }
           }
        	return rc;
    	}
        #endregion Reset
    }
}
```

