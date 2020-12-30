# GcodePutToDevRequestPDU

## 声明

- C#版：

```c#
public class GcodePutToDevRequestPDU
{
    public GcodePutToDevRequestPDU();
}
```

## 描述

​        本PDU类型为支持型数据结构，用于请求向设备上传G代码文件，其包含的可访问属性如下表所示:

| 名称          | 类型            | 说明                      |
| ------------- | --------------- | ------------------------- |
| FileOperation | FileOrDirAction | 文件操作类型              |
| GcodeFileName | string          | G代码文件名               |
| Id            | string          | G代码Id                   |
| Path          | string          | G代码的路径               |
| Offset        | int             | 此G代码相对于起始的偏移量 |
| Length        | int             | G代码长度                 |
| Value         | string          | G代码字符串               |
| BeginTime     | long            | 上传G代码文件的开始时间   |
| RequestMsg    | byte[]          | 请求信息                  |

## 参数

无

## 返回值与异常

- 期望返回值：返回一个GcodePutToDevRequestPDU对象。
- 各类异常：无异常抛出。