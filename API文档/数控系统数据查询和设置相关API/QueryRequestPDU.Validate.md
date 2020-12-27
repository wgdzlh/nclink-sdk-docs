# QueryRequestPDU.Validate

## 声明
- C# 版：

``` C#
public class QueryRequestPDU
{
    public bool Validate();
}
```

## 描述
本API为QueryRequestPDU类成员方法，通过QueryRequestPDU对象调用，用于对该对象包含的各属性字段有效性进行验证。

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
            QueryRequestPDU qrpdu = new QueryRequestPDU();
            qrpdu.Path = path;
            if (qrpdu.Validate())
            {
                Console.WriteLine("查询对象 {0} 有效", path);
            }
            else
            {
                Console.WriteLine("错误：查询对象 {0} 无效", path);
            }
            Console.ReadKey();
        }
    }
}

```

