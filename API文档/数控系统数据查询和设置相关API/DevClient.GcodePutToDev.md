# DevClient.GcodePutToDev

## 声明
- C# 版：

``` C#
public class DevClient
{
    public GcodePutToDevResponsePDU GcodePutToDev(string LocalGcodeFileName, string DevGcodeFileName);
}
```

## 描述
本API为DevClient类成员方法，通过DevClient对象（客户端句柄）调用，用于向设备上传G代码文件，返回值包含以下几个属性字段，具体见 GcodePutToDevResponsePDU 数据结构文档：

| 名称 | 类型 | 说明 |
| --- | --- | --- |
| FileOperation | FileOrDirAction | 文件操作类型 |
| LocalGcodeFileName | string | 本地G代码文件路径名 |
| DevGcodeFileName | string | 目的设备G代码文件名 |
| FileTotalSize | long | G代码文件大小（字节） |
| TransmitedLength | long | 已上传大小（字节） |

## 参数
1. LocalGcodeFileName：需上传的本地G代码文件名（完整路径）
2. DevGcodeFileName：目的设备G代码文件名，格式为：“G代码文件夹名/文件名”

## 返回值与异常
- 期望返回值：请求到的查询结果，即一个GcodePutToDevResponsePDU对象
- 各类异常：无异常抛出，请求失败信息通过日志及返回值GcodePutToDevResponsePDU对象的RetCode属性给出，详见NcLinkResponseCode枚举类包含的错误类型。

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
                Console.ReadKey();
                return;
            }
            
            string gfname = "gcode-b4946930.gc";
            string devgfname = gfdir + "/" + gfname;
            string lgfdir = "D:\\nclink_client_cs\\local_gcode_dir\\" + gfname;
            GcodePutToDevResponsePDU pg = mc1.GcodePutToDev(lgfdir, devgfname);
            if (pg.RetCode == NcLinkResponseCode.OK)
            {
                Console.WriteLine("-Y- 上传G代码成功... {0} , 耗时：{1} , 传输长度：{2} , 文件总长度：{3}",
                    devgfname, pg.TimeElapsedMs.ToString(), pg.TransmitedLength.ToString(), pg.FileTotalSize);
            }
            else
            {
                Console.WriteLine("-N- 上传G代码失败... {0} , 返回码：{1} , 传输长度：{2} , 文件总长度：{3}",
                    devgfname, pg.RetCode.ToString(), pg.TransmitedLength.ToString(), pg.FileTotalSize);
            }
            Console.ReadKey();
        }
    }
}
```

