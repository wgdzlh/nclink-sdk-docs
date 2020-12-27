# DevClient.GcodeAddOrDelFile

## 声明
- C# 版：

``` C#
public class DevClient
{
    public GcodeAddOrDelFileResponsePDU GcodeAddOrDelFile(string fname, FileOrDirAction action, int timeoutMS = DefaultTimeOutMS);
}
```

## 描述
本API为DevClient类成员方法，通过DevClient对象（客户端句柄）调用，用于向设备请求创建或删除G代码文件/文件夹，返回值包含以下几个属性字段，具体见 GcodeAddOrDelFileResponsePDU 数据结构文档：

| 名称 | 类型 | 说明 |
| --- | --- | --- |
| FileOperation | FileOrDirAction | 文件/文件夹操作类型 |
| FileName | string | 文件/文件夹名 |

## 参数
1. fname：请求创建或删除的G代码文件/文件夹名
2. action：请求的文件/文件夹操作类型，具体见FileOrDirAction 数据结构文档
3. timeoutMS：请求超时阈值，单位：毫秒，默认值：2000，要求为正整数，否则重置为默认

## 返回值与异常
- 期望返回值：请求到的文件操作结果，即一个GcodeAddOrDelFileResponsePDU对象
- 各类异常：无异常抛出，请求失败信息通过日志及返回值GcodeAddOrDelFileResponsePDU对象的RetCode属性给出，详见NcLinkResponseCode枚举类包含的错误类型

## 代码
- C# 版：

``` c#
using System;
using nclink_client;
namespace nclink_client_app
{
    class TestApp
    {
        static void Main(string[] args)
        {
            DevClient mc1 = null;
            try
            {
                mc1 = new DevClient("127.0.0.1", 1883, "STRESS_TEST_00001", false);
            }
            catch (Exception se)
            {
                Console.WriteLine("连接到设备发生异常: \n" + se.ToString());
            }

            if (mc1 != null && mc1.ConnectToDev(3))
            {
                Console.WriteLine("连接设备成功");
            }
            else
            {
                Console.WriteLine("连接设备失败");
                Console.ReadKey();
                return;
            }
            
            string gfdir = "TEST-20201209";
            GcodeAddOrDelFileResponsePDU gaod = mc1.GcodeAddOrDelFile(gfdir, FileOrDirAction.CreateFileOrDir);
            if (gaod.RetCode == NcLinkResponseCode.OK)
            {
                Console.WriteLine("-Y- 创建G代码文件夹成功" + gfdir);
            }
            else
            {
                Console.WriteLine("-N- 创建G代码文件夹失败：{0}, 返回码：{1}", gfdir, gaod.RetCode);
            }
            Console.ReadKey();
        }
    }
}
```

