# DevClient.ProgramLineNumberEventHandler

## 声明

- C#版：

```c#
public class DevClient
{
    //程序行号变化的委托定义
    public delegate void ProgramLineNumberEventHandler(NcLinkEventArgs e);
    //程序行号变化的事件定义
    public event ProgramLineNumberEventHandler ProgramLineNumberEvent;
}
```

## 描述

​		本API为DevClient类成员方法，其中ProgramLineNumberEvent是与委托相关联的事件，DevClient对象不是直接调用ProgramLineNumberEventHandler方法，而是通过（客户端句柄）调用事件ProgramLineNumberEvent，用于记录程序运行的行号的变化情况。

## 参数

1. NcLinkEventArgs: 此参数本身为一个类，用于给委托变量（委托相关联的事件）绑定的方法（ProgramLineNumberEventMonitor)提供设备的一些基本信息，基本信息中最重要的是NcLinkEventArgs类中的path变量，利用这个变量，ProgramStartEvent事件能判断路径是否与DevClient.EventPath_LineNumber相当，相等则发出行号改变通知，并且会给出当前行号。

  ```c#
  NcLinkEventArgs.Path == "CONTROLLER/LINE_NUMBER"
  ```

## 返回值与异常

- 期望返回值：返回值为空，但是有Log输出信息某个设备的加工程序启动以及数据类型和内容。
- 各类异常：无异常抛出，相关异常/错误信息通过Log文件反馈。

  1.  "（设备ID）程序行号发生改变, 数据类型:（ValueType）， 当前行号：(Value)"

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
            #region ProgramLineNumberEventHandler
            mc1.ProgramLineNumberEvent += ProgramLineNumberEventMonitor;//绑定方法
            ProgramLineNumberEventMonitor(NcLinkEventArgs plne);
            Log.Information(plne.DevGuid + " 程序行号发生改变, 数据类型: " + plne.ValueType + "， 当前行号: " + plne.Value);
            #endregion ProgramLineNumberEventHandler
        }
    }
}
```

