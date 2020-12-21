# SetRequestPDU.Validate

## 声明
- C# 版：

``` C#
public class SetRequestPDU
{
    public bool Validate();
}
```

## 描述
本API为SetRequestPDU类成员方法，通过SetRequestPDU对象调用，用于对该对象包含的各属性字段有效性进行验证。

## 参数
无

## 返回值与异常
- 期望返回值：反映该对象各字段是否有效的bool值
- 各类异常：无异常抛出

## 代码
- C# 版：

``` c#
using System;
using nclink_client;

namespace nclink_client_app
{
    class TestApp
    {
        static void Main(string[] args)
        {
            string path = "STATUS";
            SetRequestPDU srpdu = new SetRequestPDU();
            srpdu.Path = path;
            if (srpdu.Validate())
            {
                Console.WriteLine("设置对象 {0} 有效", path);
            }
            else
            {
                Console.WriteLine("错误：设置对象 {0} 无效", path);
            }
            Console.ReadKey();
        }
    }
}

```

