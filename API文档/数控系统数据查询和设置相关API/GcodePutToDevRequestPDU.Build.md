# GcodePutToDevRequestPDU.Build

## 声明

- C#版：

```C#
public class GcodePutToDevRequestPDU
{
    public bool Build(string clientId = null, long msgId = 0)
}
```

## 描述

​       本API为数据结构GcodePutToDevRequestPDU类成员方法，通过GcodePutToDevRequestPDU对象调用，将该对象包含的各属性字段进行发送前的封装，封装得到的消息体写入对象的RequestMsg属性中。

## 参数

1. clientId：发送上传G代码请求的客户端的ID
2. msgId：上传G代码请求消息的ID

## 返回值与异常

- 期望返回值：表示bool型的false或者true。
- 各类异常：有一个异常抛出，当对象的RequestMsg属性为空时会抛出异常，具体异常信息会记录进Log信息。
  1. "上传G代码生成请求PDU时出错：+ 异常名称"

## 代码

- C#版：

```c#
using System;
using nclink_client;
namespace nclink_client_app
{
    class TestApp
    {
        DevClient mc1 = null;
        mc1 = new DevClient("127.0.0.1", 1883, "STRESS_TEST_00001", false);
        GcodePutToDevRequestPDU reqPdu = new GcodePutToDevRequestPDU();
        #region Validate
 		string formatstring = null;
		try
        {
             if (clientId == null || clientId.Trim().Length < 1)
             {
                 formatstring = "{\"values\":[{\"id\":\"" + this.Id + "\",\"params\":{";
             }
             else
             {
                 formatstring = "{\"@id\":\"" + clientId + "-" + msgId + "\",\"values\":[{\"id\":\"" + this.Id + "\",\"params\":{";
             }

                 formatstring = formatstring + "\"key\":\"" + this.mGcodeFileName + "\",\"offset\":" + this.mOffset + ",\"length\":" + this.mLength + ",\"value\":\"" + this.mValue + "\"}}]}";

                 this.mRequestMsg = System.Text.Encoding.Default.GetBytes(formatstring);
            }
            catch (Exception xe)
            {
                this.mRequestMsg = null;
                Log.Warning("上传G代码生成请求PUD时出错：" + xe.ToString());
            }
            if (this.mRequestMsg == null)
            {
                return false;
            }

            return true;
        #endregion Validate
    }
}
```