# GcodePutToDevRequestPDU.Validate

## 声明

- C#版：

```C#
public class GcodePutToDevRequestPDU
{
    public bool Validate();
}
```

## 描述

​       本API为数据结构GcodePutToDevRequestPDU类成员方法，通过GcodePutToDevRequestPDU对象调用，用于对GcodePutToDevRequestPDU数据结构中的部分属性的值进行一定的验证。

## 参数

无

## 返回值与异常

- 期望返回值：表示bool型的false或者true。
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
        #region Validate
         if ((this.mId == null || this.mId.Length < 1) &&
            (this.mPath == null || this.mPath.Length < 1))
         {
             return false;
         }

         if (this.mOffset == int.MaxValue || this.mLength == int.MaxValue)
         {
             return false;
         }

         if (this.mOffset < 0 || this.mLength < 1)
         {
             return false;
         }

          if (this.mValue == null)
          {
             return false;
          }
        else
            return true;
        #endregion Validate
    }
}
```

