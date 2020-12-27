# QueryRequestPDU

## 声明
- C# 版：

``` C#
public class QueryRequestPDU
{
    public QueryRequestPDU();
}
```

## 描述
本PDU类型为支持型数据结构，用于对DevClient句柄在向设备请求查询信息时的各种参数进行包装，其包含的可访问对象属性如下表所示：

| 属性名称 | 类型 | 说明 |
| --- | :-: | --- |
| Id | string | 请求数据包的ID |
| Path | string | 请求目标的路径 |
| Indexs | List\<string\> | 请求的索引列表 |
| Operation | string | 操作类型 |
| Keys | List\<string\> | 请求的关键字列表 |
| Offset | int | 请求目标的偏移量 |
| Length | int | 请求目标的长度 |
| RequestMsg | byte[] | 请求消息体 |
| BeginTime | long | 请求开始的时间戳（毫秒） |

## 参数
无

## 返回值与异常
- 期望返回值：一个QueryRequestPDU对象
- 各类异常：无异常抛出


