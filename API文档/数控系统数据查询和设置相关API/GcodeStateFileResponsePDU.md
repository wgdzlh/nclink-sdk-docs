# GcodeStateFileResponsePDU

## 声明

- C#版：

```c#
public class GcodeStateFileResponsePDU : QueryResponsePDU
{
    public GcodeStateFileResponsePDU() : base()
}
```

## 描述

​         本PDU类型为支持型数据结构，是QueryResponsePDU数据结构的子类，可以访问QueryResponsePDU数据结构的公有属性，用于向设备请求查询某个G代码文件状态时收到的响应数据信息，其包含的可访问对象如下表所示:

| 属性名称   |  类型  | 说明                      |
| ---------- | :----: | ------------------------- |
| Fname      | string | 响应的G代码文件的名字     |
| Type       | string | 响应的G代码文件的类型     |
| ChangeTime | string | 响应的G代码文件的更改时间 |
| Size       |  int   | 响应的G代码文件的大小     |

## 参数

无

## 返回值与异常

- 期望返回值：一个GcodeStateFileResponsePDU对象。
- 各类异常：无异常抛出。