# NcLinkResponseCode

## 声明
- C# 版：

``` C#
public enum NcLinkResponseCode
{
    OK = 0,
    ERR_NULL_REF = 1,
    ERR_PARAMETER = 2,
    ERR_NODE_NONEXIST = 3,
    ERR_CONNECT_LOST = 4,
    ERR_TIMEOUT = 5,
    ERR_UNEXPECTED_PDU = 6,
    ERR_NODETYPE = 7,
    ERR_MACHINE_DENY = 8,
    ERR_WRITE_VIOLATION = 9,
    ERR_NODE_NOTFOUDN = 10,
    ERR_FILE_NOTFOUND = 100,
    ERR_GCODE_LOCAL_FILE_NOTEXIST = 101,
    ERR_GCODE_TRANSMIT_INTERRUPT = 102,
    ERR_INTERNEL = 500,
    ERR_UNKNOWN = 1000
}
```

## 描述
本枚举类型为支持型数据结构，用于DevClient对象句柄在向设备请求查询或设置信息时的返回结果状态码，各枚举状态码含义如下表所示：

| 名称 | 值 | 说明 |
| --- | :-: | --- |
| OK | 0 | 请求成功 |
| ERR_NULL_REF | 1 | 空句柄错误 |
| ERR_PARAMETER | 2 | 请求参数错误 |
| ERR_NODE_NONEXIST | 3 | 节点不存在 |
| ERR_CONNECT_LOST | 4 | 连接断开 |
| ERR_TIMEOUT | 5 | 请求超时 |
| ERR_UNEXPECTED_PDU | 6 | 返回数据包错误 |
| ERR_NODETYPE | 7 | 节点类型错误 |
| ERR_MACHINE_DENY | 8 | 设备拒绝 |
| ERR_WRITE_VIOLATION | 9 | 不可写 |
| ERR_NODE_NOTFOUDN | 10 | 节点未找到 |
| ERR_FILE_NOTFOUND | 100 | 文件未找到 |
| ERR_GCODE_LOCAL_FILE_NOTEXIST | 101 | G代码本地文件不存在 |
| ERR_GCODE_TRANSMIT_INTERRUPT | 102 | G代码文件传输中断 |
| ERR_INTERNEL | 500 | 内部错误 |
| ERR_UNKNOWN | 1000 | 未知错误 |


