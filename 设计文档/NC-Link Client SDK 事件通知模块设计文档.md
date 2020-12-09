# NC-Link Client SDK 事件通知模块设计文档

## 设计目的
增加“事件通知”功能，使得应用程序能以极小代价监控某些数据变化。

## 事件的类型与定义
- MachineOnOffLineEvent: 设备上线/离线
- WarningEvent: 设备报警
- ProgramStartEvent: 加工程序启动
- ProgramStopEvent: 加工程序停止
- ProgramLineNumberEvent: G代码程序运行行号改变
- FeedHoldEvent: 设备进给保持

## 事件响应操作的定义

