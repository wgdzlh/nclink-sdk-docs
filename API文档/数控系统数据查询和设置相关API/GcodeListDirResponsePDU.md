# GcodeListDirResponsePDU

## 声明

- C#版：

```c#
public class GcodeListDirResponsePDU: QueryResponsePDU
{
    public GcodeListDirResponsePDU();
}
```

## 描述

​        本PDU类型为支持型数据结构，是QueryResponsePDU数据结构的子类，可以访问QueryResponsePDU数据结构的公有属性，用于向设备请求查询G代码目录名列表时收到的响应数据信息，其包含的可访问对象如下表所示:

| 名称      | 类型           | 说明            |
| --------- | -------------- | --------------- |
| GcodeList | List\<string\> | G代码目录名列表 |

## 参数

无

## 返回值与异常

- 期望返回值：请求到的查询结果，即一个GcodeListDirResponsePUD对象。
- 各类异常：无异常抛出。
