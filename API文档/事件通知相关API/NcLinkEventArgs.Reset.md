# NcLinkEventArgs.Reset

- C#版：

```C#
public class NcLinkEventArgs : EventArgs
{
    public void Reset();
}
```

## 描述

​       本API为数据结构NcLinkEventArgs类成员方法，通过NcLinkEventArgs对象调用，用于重置NcLinkEventArgs对象中的部分属性的值，具体重置的值如下：

| 属性名称    | 类型            | 重置的值   |
| ----------- | --------------- | ---------- |
| ValueType   | NcLinkValueType | VT_Unknown |
| Value       | Object          | null       |
| SubValueCnt | int             | 0          |

## 参数

无

## 返回值与异常

- 期望返回值：无
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
        pdu.mValueType = NcLinkValueType.VT_Unknown;
        pdu.mValue = null;
        pdu.mSubValueCnt = 0;
        #endregion Reset
    }
}
```
