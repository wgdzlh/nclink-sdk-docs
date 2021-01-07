# DevClient.QueryRequest

## 声明
- C# 版：

``` C#
public class DevClient
{
    public QueryResponsePDU QueryRequest(QueryRequestPDU qrPdu, int timeoutMS = DefaultTimeOutMS);
}
```

## 描述
本API为DevClient类成员方法，通过DevClient对象（客户端句柄）调用，用于向设备发出查询请求。
*本文档特别介绍关于轴数据查询方面的内容。*

## 参数
1. qrPdu：查询请求的目标字段，以QueryRequestPDU对象给出
2. timeoutMS：请求超时阈值，单位：毫秒，默认值：2000，要求为正整数，否则重置为默认

## 返回值与异常
- 期望返回值：请求到的查询结果，即一个QueryResponsePDU对象
- 各类异常：无异常抛出，请求失败信息通过日志及返回值QueryResponsePDU对象的RetCode属性给出，各类RetCode见如下代码示例，即NcLinkResponseCode枚举类包含的几种错误类型

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
        static List<string> wantQueryPathList = new List<string>();
        static List<QueryRequestPDU> wantQueryPDUList = new List<QueryRequestPDU>();

        static public void InitTestQuery()
        {
            // 以下示例以X轴为例，若所连机床设备支持，同样可以查询Y轴（AXIS@1）、Z轴（AXIS@2）、C轴（AXIS@3）的对应信息
            wantQueryPathList.Add("AXIS@0");         // X轴，这个必须报错，该数据项是“组件节点”
            wantQueryPathList.Add("AXIS@0/NAME");    // X轴的名称，必须可以取出
            wantQueryPathList.Add("AXIS@0/NUMBER");  // X轴的编号，必须可以取出
            wantQueryPathList.Add("AXIS@0/TYPE");    // X轴的类型，必须可以取出
            wantQueryPathList.Add("AXIS@0/SERVO_DRIVER"); // X轴的驱动器，这个必须报错，该数据项是“组件节点”
            wantQueryPathList.Add("AXIS@0/SERVO_DRIVER/POSITION");  // X轴的指令位置，必须可以取出
            wantQueryPathList.Add("AXIS@0/SERVO_DRIVER/SPEED");     // X轴的指令速度，必须可以取出
            wantQueryPathList.Add("AXIS@0/MOTOR");          // X轴电机，这个必须报错，该数据项是“组件节点”
            wantQueryPathList.Add("AXIS@0/MOTOR/CURRENT");  // X轴电机的电流，必须可以取出
            wantQueryPathList.Add("AXIS@0/SCREW");          // X轴丝杆，这个必须报错，该数据项是“组件节点”
            wantQueryPathList.Add("AXIS@0/SCREW/POSITION"); // X轴实际位置
            wantQueryPathList.Add("AXIS@0/SCREW/SPEED");    // X轴实际速度

            foreach (string path in wantQueryPathList)
            {
                QueryRequestPDU qrpdu = new QueryRequestPDU();
                qrpdu.Path = path;
                if (path.Contains("@REG") || path.Contains("@AXIS") || path.Contains("@SYS") ||
                    path.Contains("@MACRO") || path.Contains("@VAR_"))
                {
                    qrpdu.Indexs = new List<string> { "0-9", "13", "19-25" };
                }
                if (qrpdu.Validate())
                {
                    wantQueryPDUList.Add(qrpdu);
                }
                else
                {
                    Console.WriteLine("错误：查询对象 {0} 无效", path);
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
                Console.ReadKey();
                return;
            }
            InitTestQuery();
            
            foreach (QueryRequestPDU qrpdu in wantQueryPDUList)
            {
                QueryResponsePDU respPdu = mc1.QueryRequest(qrpdu);
                if (respPdu.RetCode == NcLinkResponseCode.OK)
                {
                    Console.WriteLine("\t-Y- 成功查询{0}: \t{1}， 耗时: {2} 毫秒", respPdu.Path, respPdu.Value, respPdu.TimeElapsedMs);
                }
                else
                {
                    string errString = "未知错误";
                    switch (respPdu.RetCode)
                    {
                        case NcLinkResponseCode.ERR_CONNECT_LOST:
                        case NcLinkResponseCode.ERR_NULL_REF:       errString = "连接丢失"; break;
                        case NcLinkResponseCode.ERR_NODE_NONEXIST:  errString = "节点不存在"; break;
                        case NcLinkResponseCode.ERR_PARAMETER:      errString = "查询参数错误"; break;
                        case NcLinkResponseCode.ERR_TIMEOUT:        errString = "查询超时"; break;
                        case NcLinkResponseCode.ERR_UNEXPECTED_PDU: errString = "NC-Link协议数据单元错误"; break;
                        case NcLinkResponseCode.ERR_NODETYPE:       errString = "查询节点的类型错误，只能查询 ConfigNode 或者 DataItem 节点"; break;
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

