# DevClient.SubSampleData

## 声明

- C#版：

```c#
public class DevClient
{
    public bool SubSampleData();
}
```

## 描述

​        本API为DevClient类成员方法，本API不是通过DevClient对象（客户端句柄）调用，而是在DevClient类中，通过DevClient的一个实例this来调用，用于判断对 "内部采样周期 != 上传周期" 并且 "上传周期 < 500 毫秒" 的采样通道进行订阅和采样。

## 参数

无

## 返回值与异常

- 期望返回值：反映对"内部采样周期 != 上传周期" 并且 "上传周期 < 500 毫秒" 的采样通道进行订阅和采样是否成功的bool值，bool值为true是为成功，否则为失败。
- 各类异常：无异常抛出，当订阅采样数据失败时，即bool=false时，相关异常/错误信息通过Log反馈。
  1. "警告： 订阅采样数据失败"

## 代码

- C#版：

```c#
using System;
using nclink_client;
namespace nclink_client_app
{
    class TestApp
    {
        static void Main(string[] args)
        {
            DevClient mc1 = null;
            mc1 = new DevClient("127.0.0.1", 1883, "STRESS_TEST_00001", false);
            #region SubSampleData
            if (this.DevNode == null)
            {
                return false;
            }

            if (this.DevNode.SampleChannelNodes.Count <= 0)
            {
                return true;
            }

            do
            {
                foreach (NclinkSampleChannelNode scNode in this.DevNode.SampleChannelNodes.Values)
                {
                    if (scNode.SampleInterval == scNode.UploadInterval && scNode.UploadInterval >= 500/*毫秒*/)
                    {
                        this.mSubSampleTopics.Add("Sample/" + this.mDevGuid + "/" + scNode.Id);
                        this.mSubSampleQos.Add(0);
                    }
                }
            } while (false);

            if (this.mEnableBigDataSample)
            {
                foreach (NclinkSampleChannelNode scNode in this.DevNode.SampleChannelNodes.Values)
                {
                    if (scNode.SampleInterval != scNode.UploadInterval || scNode.UploadInterval < 500/*毫秒*/)
                    {
                        this.mSubSampleTopics.Add("Sample/" + this.mDevGuid + "/" + scNode.Id);
                        this.mSubSampleQos.Add(0);
                    }
                }
            }

            if (this.mSubSampleTopics.Count > 0)
            {
                ushort src = this.mMqttClient.Subscribe(this.mSubSampleTopics.ToArray<string>(), this.mSubSampleQos.ToArray<byte>());
                if (src > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }

            return true;
        }
        #endregion SubSampleData  
        }
    }
}
```

