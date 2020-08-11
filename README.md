# TBTools
一个iOS开发常用的 Tool Box，因自己平时开发总是会用到，于是抽取出来做成pod 进行引用，减少重复工作量

TBDeviceTool 

主要用于获取设备类型、屏幕尺寸;APP版本信息等

TBUICreater

主要用于工厂模式创建常见控件

TBUITool

主要用于设置view 圆角阴影等

### 提交App Store时，因为使用如下代码，记得勾选使用IDFA
```
NSString * idfa = ASIdentifierManager.sharedManager.advertisingIdentifier.UUIDString;

```

