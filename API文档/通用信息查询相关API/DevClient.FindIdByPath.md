# DevClient.FindIdByPath

## 声明
- C# 版：

``` C#
public class DevClient
{
    public string FindIdByPath(string path);
}
```

## 描述
本API为DevClient类成员方法，通过DevClient对象（客户端句柄）调用，用于获取某个设备路径对应的ID。

## 参数
1. path：需要查询ID的设备路径

## 返回值与异常
- 期望返回值：所查询的设备路径对应的ID，即一个string对象，可为null
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
                string id = mc1.FindIdByPath("STATUS");
                if (id != null)
                {
                    Console.WriteLine("获取ID成功：" + id);
                }
                else
                {
                    Console.WriteLine("获取ID失败");
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

