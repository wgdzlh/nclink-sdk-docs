# DevClient.MachineOnOffLineEventHandler

## 声明

- C#版：

```c#
public class DevClient
{
    //机器状态（开机/关机）的委托定义
    public delegate void MachineOnOffLineEventHandler(NcLinkEventArgs e);
    //机器状态（开机/关机）的事件定义
    public event MachineOnOffLineEventHandler MachineOnOffLineEvent;    
}
```

## 描述

​        本API为DevClient类成员方法，其中MachineOnOffLineEvent是与委托相关联的事件，DevClient对象不是直接调用MachineOnOffLineEventHandler方法，而是通过（客户端句柄）调用事件MachineOnOffLineEvent，用于描述机器状态（开机/关机）。

## 参数

1. NcLinkEventArgs: 此参数本身为一个类，用于给委托变量（委托相关联的事件）绑定的方法（MachineOnOffMonitor)提供设备的一些基本信息，这些基本信息用于该绑定方法内部判断机器的状态。

## 返回值与异常

- 期望返回值：返回值为空，但是有Log输出某个设备的开关机状态以及数据类型。
- 各类异常：无异常抛出，相关异常/错误信息通过Log文件反馈。
  1. "（设备ID）发生开/关机状态：OnLine，数据类型是：（数据类型）"
  2. "（设备ID）发生开/关机状态：OffLine，数据类型是：（数据类型）"

## 代码

- C#版

```c#
using System;
using nclink_client
using Serilog;
namespace nclink_client_app
{
    class TestApp
    {
        static void Main(string[] args)
        {
            DevClient mc1;
            string msg = null;
            mc1 = new DevClient("127.0.0.1", 1883, "STRESS_TEST_00001", false);
            #region MachineOnOffLineEventHandler
            mc1.MachineOnOffLineEvent += MachineOnOffMonitor;//绑定方法
            MachineOnOffMonitor(NcLinkEventArgs ooe);
            if (ooe.Value.Equals(MachineOnOffLineCode.MachineOnLine))
            {
                msg = "OnLine";
            }
            else if (ooe.Value.Equals(MachineOnOffLineCode.MachineOffLine))
            {
                msg = "OffLine";
            }
            else
            {
                msg = "Unknown On/Off";
            }
            Log.Information(ooe.DevGuid + " 发生开/关机状态: " + msg + "，数据类型是: " + ooe.ValueType);
        }
            #endregion MachineOnOffLineEventHandler
            
        }
    }
}
```

