# DevClient.ConnectToDev

## 声明
- C# 版：

``` C#
public class DevClient
{
    public bool ConnectToDev(int timeoutSecond = 0);
}
```

## 描述
本API为DevClient类成员方法，通过DevClient对象（客户端句柄）调用，用于实际连接到MQTT代理器及设备。

## 参数
1. timeoutSecond：连接超时阈值，单位：秒
    - \> 0：超时阈值，用时超过阈值则返回false
    - \<= 0：不设超时，即不断尝试连接直到成功

## 返回值与异常
- 期望返回值：反映是否连接成功的bool值，同时有Log输出设备模型文件支持的事件点ID与PATH
- 各类异常：无异常抛出，相关异常/错误信息通过Log反馈
    1. "连接到 Broker 并订阅发生异常。 "
    2. "连接到设备时发生异常."
    3. "错误: 已经连接到 Broker, 但没有收到设备的模型文件"
    4. "错误: 已经连接到设备, 但不能正确识别所收到的模型文件"
    5. "错误: 已经连接到设备, 但不能解析所收到的模型文件 "
    6. "错误: 启动定时任务失败"

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

