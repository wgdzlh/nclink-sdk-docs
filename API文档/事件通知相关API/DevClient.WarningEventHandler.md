# DevClient.WarningEventHandler

## 声明

- C#版：

```c#
public class DevClient
{
    //报警的委托定义
    public delegate void WarningEventHandler(NcLinkEventArgs e);
    //报警的事件定义
    public event WarningEventHandler WarningEvent;
}
```

## 描述

​		本API为DevClient类成员方法，其中WarningEvent是与委托相关联的事件，DevClient对象不是直接调用WarningEventHandler方法，而是通过（客户端句柄）调用事件WarningEvent，用于描述设备发生的报警事件并记录报警信息。

## 参数

1. NcLinkEventArgs: 此参数本身为一个类，用于给委托变量（委托相关联的事件）绑定的方法（WarningEventMonitor)提供设备的一些基本信息，基本信息中最重要的是NcLinkEventArgs类中的Path变量，利用这个变量，WarningEvent事件能判断路径是否与DevClient.EventPath_Warning相等，相等则发出报警通知。

  ```c#
  NcLinkEventArgs.Path == "CONTROLLER/WARNING"
  ```

## 返回值与异常

- 期望返回值：返回值为空，但是有Log输出信息某个设备的加工程序启动以及数据类型和内容。
- 各类异常：无异常抛出，相关异常/错误信息通过Log文件反馈。

  1.  "（设备ID）发生报警事件, 报警条数（SubValueCnt）数据类型是:（ValueType）, 报警内容: （Value）"

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
            #region WarningEventHandler
            mc1.WarningEvent += WarningEventMonitor;//绑定方法
            WarningEventMonitor(NcLinkEventArgs we);
            Log.Information(we.DevGuid + " 发生报警事件, 报警条数 " + we.SubValueCnt + " 数据类型是: " + we.ValueType + ", 报警内容: " + we.Value);
            #endregion WarningEventHandler
        }
    }
}
```

