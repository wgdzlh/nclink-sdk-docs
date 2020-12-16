# DevClient.IsConnectToDev

## 声明
- C# 版：

``` C#
public class DevClient
{
    public bool IsConnectToDev();
}
```

## 描述
 本API为DevClient类成员方法，通过DevClient对象（客户端句柄）调用，用于检查是否连接到设备。

## 参数
无参数

## 返回值与异常
- 期望返回值：反映是否已连接到设备的bool值
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
                Console.WriteLine("测试连接状态：");
                if (mc1.IsConnectToDev())
                {
                    Console.WriteLine("已连接到设备");
                }
                else
                {
                    Console.WriteLine("未连接到设备");
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

