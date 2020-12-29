# NcLinkEventArgs

## 声明

- C#版：

```c#
public class NcLinkEventArgs : EventArgs
{
    public NcLinkEventArgs();
}
```

## 描述

​        本API为NcLinkEventArgs类的构造函数，通过NcLinkEventArgs初始化对象来调用，用于记录保存产生NcLink事件通知的设备的基本的信息，可以调用的基本属性如下：

| 名称        | 类型            | 说明                   |
| ----------- | --------------- | ---------------------- |
| DevGuid     | string          | 设备的Guid信息         |
| Id          | string          | 事件的Id               |
| Path        | string          | 事件的路径             |
| ValueType   | NcLinkValueType | NcLink信息的数据类型   |
| SubValueCnt | int             | 判断设备状态是否变化   |
| Value       | Object          | 设备的离线或者在线状态 |

## 参数

无

## 返回值与异常

- 期望返回值：返回值为一个NcLinkEventArgs对象。
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
        static void Main(string[] args)
        {
            DevClient mc1;

            mc1 = new DevClient("127.0.0.1", 1883, "STRESS_TEST_00001", false);
            #region NcLinkEventArgs
            public class NcLinkEventArgs : EventArgs
        {
            private string mDevGuid;
        	private string mId;
        	private string mPath;
        	private int mSubValueCnt;
        	private NcLinkValueType mValueType;
        	private Object mValue;

        	public NcLinkEventArgs()
        	{
           		 this.mDevGuid = null;
           		 this.mId = null;
           		 this.mPath = null;
           		 this.mValueType = NcLinkValueType.VT_Unknown;
           		 this.mValue = null;
           		 this.mSubValueCnt = 0;
        	}
         }
        #endregion NcLinkEventArgs
        }
    }
}
```

