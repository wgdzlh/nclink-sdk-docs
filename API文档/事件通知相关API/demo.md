# DevClient

## 声明
- C# 版：

``` C#
public class DevClient
{
    public DevClient(string BrokerIp, int BrokerPort, string DevGuid, bool enableBigDataSample = false);
}
```

- Python 版：

``` Python
class DevClient:
    def __init__(self, broker_ip: str, broker_port: int, dev_guid: str, enable_big_data_sample=False)
```

## 描述
 本API为DevClient类构造函数，可以返回一个DevClient对象作为客户端句柄，用于后续客户端连接MQTT、数据传输的管理。

## 参数
1. BrokerIP：MQTT代理服务器IP
2. BrokerPort：MQTT代理服务器端口
3. DevGuid：设备唯一GUID
4. enableBigDataSample： 是否启用大容量采样

## 返回值与异常
- 期望返回值：一个DevClient对象
- 各类异常：
    1. DevExceedException：当前应用设备连接数已达到设置的上限
    2. BrokerIpAddrException：给出的代理器IP非法
    3. BrokerPortException：给出的代理器端口非法
    4. NullReferenceException：未给出有效的设备GUID
    5. DuplicatedDevGuidException：不可重复连接同一台设备

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
            DevClient mc1;
            try
            {
                mc1 = new DevClient("127.0.0.1", 1883, "STRESS_TEST_00001", false);
            }
            catch (Exception se)
            {
                mc1 = null;
                Console.WriteLine("连接到设备发生异常: \n" + se.ToString());
            }

            if (mc1 == null)
            {
                Console.WriteLine("连接到设备发生异常，按任意键退出");
            }
            Console.ReadKey();
        }
    }
}
```

- Python 版：

``` python
from nclink_client import DevClient

if __name__ == '__main__':
    try:
        mc1 = DevClient("127.0.0.1", 1883, "STRESS_TEST_00001", False)
    except Exception as e:
        mc1 = None
        print("连接到设备发生异常: \n" + e.msg)
    if not mc1:
        print("连接到设备发生异常，退出")
```

