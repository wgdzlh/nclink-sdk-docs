# DevClient.GetAllSupportedEventPointsId

## 声明

- C#版：

```c#
public class DevClient
{
    public List<string> GetAllSupportedEventPointsId();
}
```

## 描述

​        本API为DevClient类成员方法，本API不是通过DevClient对象（客户端句柄）调用，而是在DevClient类中，被ConnectToDev这个API调用，用于获取所有支持的事件点ID。

## 参数

无

## 返回值与异常

- 期望返回值：返回一个列表，列表里包含所有支持的事件点的ID。后续会把所有支持的事件点的ID输出到Log文件中。
- 各类异常：无异常抛出。

## 代码

- C#版：

```c#
using System;
using ns_nclink_exceptions;
using nclink_client;
namespace nclink_client_app
{
    class TestApp
    {
        static void Main(string[] args)
        {
            #region GetAllSupportedEventPointsId
            Dictionary<string, NclinkBaseNode> mSupportedEventNodes = null;
            List<string> sepIds = new List<string>();
            foreach (string spid in mSupportedEventNodes.Keys)
            {
                sepIds.Add(spid);
            }
            #endregion GetAllSupportedEventPointsId
            foreach (string xx in sepids)
            {
                xxCnt += 1;
                Log.Information("\t#:" + xxCnt.ToString() + ":\t" + xx);
            }
        }
    }
}
```

