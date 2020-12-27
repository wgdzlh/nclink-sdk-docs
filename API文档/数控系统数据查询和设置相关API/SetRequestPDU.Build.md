# SetRequestPDU.Build

## 声明
- C# 版：

``` C#
public class SetRequestPDU
{
    public bool Build(string clientId = null, long msgId = 0);
}
```

## 描述
本API为SetRequestPDU类成员方法，通过SetRequestPDU对象调用，用于将该对象包含的各属性字段进行发送前的封装，封装得到的消息体写入对象的RequestMsg属性中。

## 参数
1. clientId：发送该查询请求的客户端的ID
2. msgId：该查询请求消息的ID

## 返回值与异常
- 期望返回值：反映封装消息体是否成功的bool值
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
            string path = "CONTROLLER/VARIABLE@REG_X";
            SetRequestPDU srpdu = new SetRequestPDU();
            srpdu.Path = path;
            srpdu.Index = 0;
            srpdu.Value = "{\"value\":10}";
            if (srpdu.Validate())
            {
                Console.WriteLine("设置对象 {0} 有效", path);
                if (srpdu.Build())
                {
                    Console.WriteLine("设置请求封装成功");
                }
                else
                {
                    Console.WriteLine("设置请求封装失败");
                }
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

