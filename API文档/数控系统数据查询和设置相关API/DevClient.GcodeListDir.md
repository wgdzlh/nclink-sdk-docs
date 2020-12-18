# DevClient.GcodeListDir

## 声明
- C# 版：

``` C#
public class DevClient
{
    public GcodeListDirResponsePUD GcodeListDir(int timeoutMS = DefaultTimeOutMS);
}
```

## 描述
本API为DevClient类成员方法，通过DevClient对象（客户端句柄）调用，用于向设备请求G代码目录名列表，返回值包含以下属性字段，具体见 GcodeStateFileResponsePDU 数据结构文档：

| 名称 | 类型 | 说明 |
| --- | --- | --- |
| GcodeList | List\<string\> | G代码目录名列表 |

## 参数
1. timeoutMS：请求超时阈值，单位：毫秒，默认值：2000，要求为正整数，否则重置为默认

## 返回值与异常
- 期望返回值：请求到的查询结果，即一个GcodeListDirResponsePUD对象
- 各类异常：无异常抛出，请求失败信息通过日志及返回值GcodeListDirResponsePUD对象的RetCode属性给出，详见NcLinkResponseCode枚举类包含的错误类型

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
            
            GcodeListDirResponsePUD lc = mc1.GcodeListDir(2000);
            if (lc.RetCode == NcLinkResponseCode.OK)
            {
                int count = lc.GcodeList.Count();
                Console.WriteLine("-Y- 获取G代码目录列表 " + count);
                foreach (string fname in lc.GcodeList)
                {
                    Console.WriteLine("\t-Y- " + fname);
                }
            }
            else
            {
                Console.WriteLine("-N- 获取G代码目录列表失败");
            }
            Console.ReadKey();
        }
    }
}
```

