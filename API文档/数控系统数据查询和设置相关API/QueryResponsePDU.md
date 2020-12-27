# QueryResponsePDU

## 声明
- C# 版：

``` C#
public class QueryResponsePDU
{
    public QueryResponsePDU();
}
```

## 描述
本PDU类型为支持型数据结构，用于对DevClient句柄在向设备请求查询信息时收到的响应数据进行包装，其包含的可访问对象属性如下表所示：

| 属性名称 | 类型 | 说明 |
| --- | :-: | --- |
| Id | string | 响应数据包的ID |
| RetCode | string | 响应代码 |
| Path | string | 请求目标的路径 |
| Indexs | List\<string\> | 请求的索引列表 |
| Operation | string | 操作类型 |
| Keys | List\<string\> | 请求的关键字列表 |
| Offset | int | 请求目标的偏移量 |
| Length | int | 响应消息长度 |
| Value | string | 响应消息内容 |
| TimeElapsedMs | long | 请求耗时（毫秒） |

## 参数
无

## 返回值与异常
- 期望返回值：一个QueryResponsePDU对象
- 各类异常：无异常抛出


