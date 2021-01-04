# DevClient.FindPathById

## 声明
- C# 版：

``` C#
public class DevClient
{
    public string FindPathById(string nid);
}
```

## 描述
本API为DevClient类成员方法，通过DevClient对象（客户端句柄）调用，用于获取某个设备ID对应的路径。

## 参数
1. nid：需要查询路径的设备ID

## 返回值与异常
- 期望返回值：所查询的设备ID对应的路径，即一个string对象，可为null
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
                string path = mc1.FindPathById("TEST_00001");
                if (path != null)
                {
                    Console.WriteLine("获取PATH成功：" + path);
                }
                else
                {
                    Console.WriteLine("获取PATH失败");
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

