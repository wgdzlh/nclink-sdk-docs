# GcodePutToDevRequestPDU.Reset

## 声明

- C#版：

```C#
public class GcodePutToDevRequestPDU
{
    public void Reset();
}
```

## 描述

​        本API为数据结构GcodePutToDevRequestPDU类成员方法，通过GcodePutToDevRequestPDU对象调用，用于重置GcodePutToDevRequestPDU数据结构中的部分属性的值，具体重置的值如下：

| 属性名称   | 类型   | 重置的值 |
| ---------- | ------ | -------- |
| Offset     | int    | MaxValue |
| Length     | int    | MaxValue |
| Value      | string | null     |
| RequestMsg | byte[] | null     |

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
        GcodePutToDevRequestPDU reqPdu = new GcodePutToDevRequestPDU();
        #region Reset
        reqPdu.mOffset = int.MaxValue;
        reqPdu.mLength = int.MaxValue;
        reqPdu.mValue = null;
        reqPdu.mRequestMsg = null;
        #endregion Reset
    }
}
```

