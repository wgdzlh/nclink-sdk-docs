# DevClient.GetAllSupportedEventPointsPath

## 声明

- C#版：

```c#
public class DevClient
{
    public List<string> GetAllSupportedEventPointsPath();
}    
```

## 描述

​        本API为DevClient类成员方法，本API不是通过DevClient对象（客户端句柄）调用，而是在DevClient类中，被ConnectToDev这个API调用，用于获取所有支持的事件点PATH。

## 参数

无

## 返回值与异常

- 期望返回值：返回一个列表，列表里包含所有支持的事件点的PATH。后续会把所有支持的事件点的ID输出到Log文件中。
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
            #region GetAllSupportedEventPointsPath
            Dictionary<string, NclinkBaseNode> mSupportedEventNodes = null;
            List<string> sepPath = new List<string>();
            foreach (NclinkBaseNode en in mSupportedEventNodes.Values)
            {
                string path = en.Path.Substring(NodePathHeader.Length);
                sepPath.Add(path);
            }
            #endregion GetAllSupportedEventPointsPath
            foreach (string xx in sepPath)
            {
                xxCnt += 1;
                Log.Information("\t#:" + xxCnt.ToString() + ":\t" + xx);
            }
        }
    }
}
```

