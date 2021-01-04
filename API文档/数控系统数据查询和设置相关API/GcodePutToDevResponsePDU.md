# GcodePutToDevResponsePDU

## 声明

- C#版：

```c#
public class GcodePutToDevResponsePDU : SetResponsePDU
{
    public GcodePutToDevResponsePDU() : base()
}
```

## 描述

​     本API类型为支持型数据结构，是SetResponsePDU数据结构的子类，可以访问SetResponsePDU数据结构的公有属性。用于接收向设备上传G代码文件的响应信息，其包含的可访问属性如下表所示:

| 名称 | 类型 | 说明 |
| --- | --- | --- |
| FileOperation | FileOrDirAction | 文件操作类型 |
| LocalGcodeFileName | string | 本地G代码文件路径名 |
| DevGcodeFileName | string | 目的设备G代码文件名 |
| FileTotalSize | long | G代码文件大小（字节） |
| TransmitedLength | long | 已上传大小（字节） |

## 参数

无

## 返回值与异常

- 期望返回值：一个GcodePutToDevResponsePDU对象。
- 各类异常：无异常抛出。