# DevClient.ProgramStartEventHandler

## 声明

- C#版

```c#
public class DevClient
{
    //加工程序启停的委托定义
    public delegate void ProgramStartEventHandler(NcLinkEventArgs e);
    //加工程序启停的事件定义
    public event ProgramStartEventHandler ProgramStartEvent;
}
```

## 描述

​        本API为DevClient类成员方法，其中ProgramStartEvent是与委托相关联的事件，DevClient对象不是直接调用ProgramStartEventHandler方法，而是通过（客户端句柄）调用事件ProgramStartEvent，用于描述设备的加工程序启动、加工的数据类型和内容。

## 参数

1. NcLinkEventArgs: 此参数本身为一个类，用于给委托变量（委托相关联的事件）绑定的方法（ProgramStartEventMonitor)提供设备的一些基本信息，基本信息中最重要的是NcLinkEventArgs类中的Value变量，利用这个变量，ProgramStartEvent事件能判断加工程序是否启动。

  ```c#
  NcLinkEventArgs.Value.ToString() == "running"或者"0"
  ```
## 返回值与异常

- 期望返回值：返回值为空，但是有Log输出信息某个设备的加工程序启动以及数据类型和内容。
- 各类异常：无异常抛出，相关异常/错误信息通过Log文件反馈。

  1.  "（设备ID）加工程序启动，数据类型：（ValueType），内容：running"
  
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
            #region ProgramStartEventHandler
            mc1.ProgramStartEvent += ProgramStartEventMonitor;//绑定方法
            ProgramStartEventMonitor(NcLinkEventArgs pse);
            Log.Information(pse.DevGuid + " 加工程序启动, 数据类型: " + pse.ValueType +", 内容: " + pse.Value);
            #endregion ProgramStartEventHandler
        }
    }
}
```

