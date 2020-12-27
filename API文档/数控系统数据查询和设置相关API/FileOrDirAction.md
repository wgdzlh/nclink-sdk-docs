# FileOrDirAction

## 声明
- C# 版：

``` C#
public enum FileOrDirAction
{
    Ambiguity = 0,
    CreateFileOrDir = 1,
    DeleteFileOrDir = 2,
    PutGcodeToDev = 3,
    GetGcodeFromDev = 4
}
```

## 描述
本枚举类型为支持型数据结构，用于DevClient对象句柄在向设备请求操作文件/文件夹时定义操作类型，各操作码含义如下表所示：

| 名称 | 值 | 说明 |
| --- | :-: | --- |
| Ambiguity | 0 | 操作类型未明确 |
| CreateFileOrDir | 1 | 创建文件/文件夹 |
| DeleteFileOrDir | 2 | 删除文件/文件夹 |
| PutGcodeToDev | 3 | 向设备上传G代码 |
| GetGcodeFromDev | 4 | 从设备下载G代码 |


