# GcodeStateFileRequestPDU

## 声明

- C#版：

```c#
public class GcodeStateFileRequestPDU : QueryRequestPDU
{
    public GcodeStateFileRequestPDU(string fname = null, string path = "CONTROLLER/FILE") : base()
}
```

## 描述

​       本PDU类型为支持型数据结构，是QueryRequestPDU数据结构的子类，可以访问QueryRequestPDU数据结构中的公有属性，用于向设备请求查询某个G代码文件状态信息，其包含的可访问对象属性如下表所示：

| 属性名称 |  类型  | 说明                  |
| -------- | :----: | --------------------- |
| Fname    | string | 请求的G代码文件的名字 |

## 参数

1. fname：请求的G代码文件的名字，默认为null。
2. path：请求的G代码文件的路径，默认为"CONTROLLER/FILE"。

## 返回值与异常

- 期望返回值：一个GcodeStateFileRequestPDU对象。
- 各类异常：无异常抛出。