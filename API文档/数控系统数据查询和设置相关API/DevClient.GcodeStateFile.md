# DevClient.GcodeStateFile

## 声明
- C# 版：

``` C#
public class DevClient
{
    public GcodeStateFileResponsePDU GcodeStateFile(string fname, int timeoutMS = DefaultTimeOutMS);
}
```

## 描述
本API为DevClient类成员方法，通过DevClient对象（客户端句柄）调用，用于向设备请求查询某个G代码文件状态信息，返回值包含以下几个属性字段，具体见 GcodeStateFileResponsePDU 数据结构文档：

| 名称 | 类型 | 说明 |
| --- | --- | --- |
| FileName | string | 文件名 |
| Type | string | 文件类型 |
| ChangeTime  | string | 文件修改时间 |
| Size | int | 文件大小（字节） |

## 参数
1. fname：请求查询的目标G代码文件名
2. timeoutMS：请求超时阈值，单位：毫秒，默认值：2000，要求为正整数，否则重置为默认

## 返回值与异常
- 期望返回值：请求到的查询结果，即一个GcodeStateFileResponsePDU对象
- 各类异常：无异常抛出，请求失败信息通过日志及返回值GcodeStateFileResponsePDU对象的RetCode属性给出，详见NcLinkResponseCode枚举类包含的错误类型。

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
            
            GcodeStateFileResponsePDU sf = mc1.GcodeStateFile("some_file_name", 2000);
            if (sf.RetCode == NcLinkResponseCode.OK)
            {
                Console.WriteLine("-Y- 获取G代码文件状态成功：\n文件名：{0}\n文件类型：{1}\n文件修改时间：{2}\n文件大小：{3}",
                    sf.FileName, sf.Type, sf.ChangeTime, sf.Size); 
            }
            else
            {
                Console.WriteLine("-N- 获取G代码文件状态失败：\n错误代码：{0}", sf.RetCode);
            }
            Console.ReadKey();
        }
    }
}
```

