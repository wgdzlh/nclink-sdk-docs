# DevClient.SetRequest

## 声明
- C# 版：

``` C#
public class DevClient
{
    public SetResponsePDU SetRequest(SetRequestPDU srPdu, int timeoutMS = DefaultTimeOutMS);
}
```

## 描述
 本API为DevClient类成员方法，通过DevClient对象（客户端句柄）调用，用于向设备发出设置请求。

## 参数
1. qrPdu：设置请求的目标字段，以SetRequestPDU对象给出
2. timeoutMS：请求超时阈值，单位：毫秒，默认值：2000，要求为正整数，否则重置为默认

## 返回值与异常
- 期望返回值：请求到的查询结果，即一个SetResponsePDU对象
- 各类异常：无异常抛出，查询失败信息通过返回值SetResponsePDU对象的RetCode属性给出，各类RetCode见如下代码示例

## 代码
- C# 版：

``` c#
using System;
using System.Collections.Generic;
using nclink_client;

namespace nclink_client_app
{
    class TestApp
    {
        static List<string> wantSetPathList = new List<string>();
        static List<SetRequestPDU> wantSetPDUList = new List<SetRequestPDU>();

        static public void InitTestSet()
        {
            wantSetPathList.Add("CONTROLLER/TOOL_PARAM");  // Y 刀具参数，ConfigNode settable = true，必须成功，LIST类型
            wantSetPathList.Add("CONTROLLER/COORDINATE");  // Y 坐标系，ConfigNode settable = true，必须成功，LIST类型
            wantSetPathList.Add("CONTROLLER/CONSOLE");     // N 指令，ConfigNode settable = false，必须失败
            wantSetPathList.Add("CONTROLLER/PARAMETER");   // N 参数，ConfigNode settable = true， 必须成功，LIST类型
            wantSetPathList.Add("CONTROLLER/PROGRAM");     // 主程序名，DataItem settable = false， 必须失败
            wantSetPathList.Add("CONTROLLER/VARIABLE@REG_X");  // Y 寄存器X, DataItem settable = true， 必须成功
            wantSetPathList.Add("CONTROLLER/VARIABLE@REG_Y");  // Y 寄存器Y, DataItem settable = true， 必须成功
            wantSetPathList.Add("CONTROLLER/VARIABLE@REG_F");  // Y 寄存器F, DataItem settable = true， 必须成功
            wantSetPathList.Add("CONTROLLER/VARIABLE@REG_G");  // Y 寄存器G, DataItem settable = true， 必须成功

            foreach (string path in wantSetPathList)
            {
                SetRequestPDU srpdu = new SetRequestPDU();
                srpdu.Path = path;

                switch (path)
                {
                    case "CONTROLLER/TOOL_PARAM":
                        srpdu.Index = 1;
                        srpdu.Value = "{\"value\":{\"length\":200,\"radius\":18}}";
                        break;
                    case "CONTROLLER/COORDINATE":
                        srpdu.Index = 1;
                        srpdu.Value = "{\"value\":{\"x\":10,\"y\":10,\"z\":10}}";
                        break;
                    case "CONTROLLER/CONSOLE":
                        srpdu.Value = "{\"value\":[\"this is console\", 1, 2]}";
                        break;
                    case "CONTROLLER/PARAMETER":
                        srpdu.Index = 50;
                        srpdu.Value = "{\"value\":1}";
                        break;
                    case "CONTROLLER/PROGRAM":
                        srpdu.Value = "{\"value\":\"MAIN_PROGRAM_1.gcode\"}";
                        break;
                    case "CONTROLLER/VARIABLE@REG_X":
                        srpdu.Index = 0;
                        srpdu.Value = "{\"value\":10}";
                        break;
                    case "CONTROLLER/VARIABLE@REG_Y":
                        // 设置寄存器 1 的第 12 位为 1
                        srpdu.Index = 1;
                        srpdu.Offset = 12;
                        srpdu.Value = "{\"value\":1}";
                        break;
                    case "CONTROLLER/VARIABLE@REG_F":
                        // 设置寄存器 20 的第 5 位为 1
                        srpdu.Index = 20;
                        srpdu.Offset = 5;
                        srpdu.Value = "{\"value\":1}";
                        break;
                    case "CONTROLLER/VARIABLE@REG_G":
                        // 设置寄存器 10 的第 2 位为 1
                        srpdu.Index = 10;
                        srpdu.Offset = 2;
                        srpdu.Value = "{\"value\":1}";
                        break;
                    default:
                        continue;
                }

                if (srpdu.Validate())
                {
                    wantSetPDUList.Add(srpdu);
                }
                else
                {
                    Log.Warning("错误：设置对象无效 " + path);
                }
            }
        }

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
                return;
            }
            InitTestSet();
            
            foreach (SetRequestPDU srpdu in wantSetPDUList)
            {
                SetResponsePDU respPdu = mc1.SetRequest(srpdu);
                if (respPdu.RetCode == NcLinkResponseCode.OK)
                {
                    Console.WriteLine("\t-Y- 成功设置{0}: \t{1}， 耗时: {2} 毫秒", respPdu.Path, respPdu.Value, respPdu.TimeElapsedMs);
                }
                else
                {
                    string errString = @"未知错误";
                    switch (respPdu.RetCode)
                    {
                        case NcLinkResponseCode.ERR_CONNECT_LOST:
                        case NcLinkResponseCode.ERR_NULL_REF:       errString = "连接丢失"; break;
                        case NcLinkResponseCode.ERR_NODE_NONEXIST:  errString = "节点不存在"; break;
                        case NcLinkResponseCode.ERR_PARAMETER:      errString = "请求参数错误"; break;
                        case NcLinkResponseCode.ERR_TIMEOUT:        errString = "请求超时"; break;
                        case NcLinkResponseCode.ERR_UNEXPECTED_PDU: errString = "NC-Link协议数据单元错误"; break;
                        case NcLinkResponseCode.ERR_NODETYPE:       errString = "请求节点的类型错误"; break;
                        case NcLinkResponseCode.ERR_MACHINE_DENY:   errString = "机器拒绝"; break;
                    }
                    Console.WriteLine("\t-N- 失败查询{0}, 错误原因: {1}, 耗时: {2} 毫秒", respPdu.Path, errString, respPdu.TimeElapsedMs);
                }
            }
            
            Console.ReadKey();
        }
    }
}

```

