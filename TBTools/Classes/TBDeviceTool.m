//
//  DeviceTool.m
//  deviceTool
//
//  Created by careyang on 2018/12/21.
//  Copyright © 2018 careyang. All rights reserved.
//

#import "TBDeviceTool.h"
#import <sys/utsname.h>
#import "TBValidTool.h"
#import <AdSupport/AdSupport.h>

@implementation TBDeviceTool

+(NSString *) deviceModel{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return TBStringnil(deviceString);
}
/*
 判断是否是刘海屏
 */
+(BOOL) isPhoneXModel{
    if (@available(iOS 11 , *)) {
        BOOL isXModel = [UIApplication.sharedApplication delegate].window.safeAreaInsets.bottom > 0;
        return isXModel;;
    }
    return NO;
}

/// 返回状态栏的高度
+ (CGFloat)statusBarHeight {
    CGFloat statusBarHeight = 0;
    if (@available(iOS 13.0, *)) {
        statusBarHeight = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height;
    } else {
        statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    }
    return statusBarHeight;
}
// 这里可以灵活运用
+ (DeviceType) currentDeviceType{

    if (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        return DeviceType_iPad;
    }else if (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomTV){
        return DeviceType_TV;
    }else if (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone){
        return DeviceType_iPhone;
    }else{
        return DeviceType_unknow;
    }
}

+(CGSize) screenSize{
    return UIScreen.mainScreen.bounds.size;
}
#pragma mark 常用参数

/// APP 的 version
+(NSString *) appVersion{
    NSString * appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return TBStringnil(appVersion);
}
/// APP 的 build version
+(NSString *) appBuildVersion{
    NSString * buildVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    return TBStringnil(buildVersion);
}
/// APP 的bundleid
+(NSString *) appBundleId{
    return TBStringnil([NSBundle mainBundle].bundleIdentifier);
}
/// APP名称
+(NSString *) appDisplayName{
    NSString * appNmae = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    return TBStringnil(appNmae);
}
@end
