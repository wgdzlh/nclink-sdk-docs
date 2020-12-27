# MachineOnOffLineCode

## 声明
- C# 版：

``` C#
public enum MachineOnOffLineCode
{
    MachineOnOffUnknown = 0,
    MachineOnLine = 1,
    MachineOffLine = 2
}
```

## 描述
本枚举类型为支持型数据结构，用于DevClient对象句柄维护所连接设备的在线状态，各枚举状态码含义如下表所示：

| 名称 | 值 | 说明 |
| --- | :-: | --- |
| MachineOnOffUnknown | 0 | 初始化/未知状态 |
| MachineOnLine | 1 | 设备在线 |
| MachineOffLine | 2 | 设备离线 |

