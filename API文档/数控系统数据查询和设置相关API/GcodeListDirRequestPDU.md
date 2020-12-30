# GcodeListDirRequestPDU

## 声明

- C#版：

```c#
public class GcodeListDirRequestPDU : QueryRequestPDU
    {
        public GcodeListDirRequestPDU(string path = "CONTROLLER/FILE") : base()
    }
```

## 描述

​        本PDU类型为支持型数据结构，是QueryRequestPDU数据结构的子类，可以访问QueryRequestPDU数据结构的公有属性，用于向设备请求G代码目录名列表，其包含的可访问对象如下表所示:
**无**

## 参数

1. path：G代码文件的路径，默认为 "CONTROLLER/FILE"。

## 返回值与异常

- 期望返回值：一个GcodeListDirRequestPDU对象。
- 各类异常：无异常抛出。

