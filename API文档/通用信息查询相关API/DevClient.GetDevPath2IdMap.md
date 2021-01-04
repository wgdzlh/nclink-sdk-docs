# DevClient.GetDevPath2IdMap

## 声明
- C# 版：

``` C#
public class DevClient
{
    public Dictionary<string, string> GetDevPath2IdMap();
}
```

## 描述
本API为DevClient类成员方法，通过DevClient对象（客户端句柄）调用，用于获取设备路径对应ID的字典。

## 参数
无

## 返回值与异常
- 期望返回值：一个“设备路径-ID”key-value对构成的字典对象，可为null
- 各类异常：无异常抛出

## 代码
- C# 版：

``` c#
using System;
using System.Collections.Generic;
using nclink_client;
namespace nclink_client_app
{
    class TestApp
    {
        static void Main(string[] args)
        {
            DevClient mc1 = null;
            try
            {
                mc1 = new DevClient("127.0.0.1", 1883, "STRESS_TEST_00001", false);
            }
            catch (Exception se)
            {
                Console.WriteLine("连接到设备发生异常: \n" + se.ToString());
            }

            if (mc1 != null && mc1.ConnectToDev(3))
            {
                Console.WriteLine("连接设备成功");
                Dictionary<string, string> dict = mc1.GetDevPath2IdMap();
                if (dict != null)
                {
                    Console.WriteLine("获取PATH-ID字典成功");
                }
                else
                {
                    Console.WriteLine("获取PATH-ID字典失败");
                }
            }
            else
            {
                Console.WriteLine("连接设备失败");
            }
            Console.ReadKey();
        }
    }
}
```

