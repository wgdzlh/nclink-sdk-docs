# GcodeAddOrDelFileRequestPDU

## 声明

- C#版：

```c#
public class GcodeAddOrDelFileRequestPDU: SetRequestPDU
{
    public GcodeAddOrDelFileRequestPDU(string fname = null, string path = "CONTROLLER/FILE") : base();
}
```

## 描述

​       本PDU类型为支持型数据结构，是SetRequestPDU数据结构的子类，可以访问SetRequestPDU数据结构的公有属性，用于向设备请求添加或者删除G代码文件，其包含的可访问对象如下表所示:

| 名称          | 类型            | 说明                |
| ------------- | --------------- | ------------------- |
| FileOperation | FileOrDirAction | 文件/文件夹操作类型 |
| FileName      | string          | 文件/文件夹名       |

## 参数

1. fname：请求创建或删除的G代码文件/文件夹名，默认为null。
2. path：请求创建或删除的G代码文件/文件夹路径，默认为"CONTROLLER/FILE"。

## 返回值与异常

- 期望返回值：一个GcodeAddOrDelFileRequestPDU对象。
- 各类异常：无异常抛出。