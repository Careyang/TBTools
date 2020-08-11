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
 机型            分辨率      逻辑分辨率
 iPhone X/XS    1125x2436  375x812
 iPhone XR      828x1792   414x896
 iPhone XS Max  1242x2688  414x896
 */
+(BOOL) isPhoneXModel{
    UIScreen * mainScreen = UIScreen.mainScreen;
    CGFloat height = MAX(mainScreen.bounds.size.width, mainScreen.bounds.size.height);
    if (height == 812 || height == 896) {
        return YES;
    }
    return NO;
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
+(BOOL) iDFAisEnable{
    BOOL isEnable = ASIdentifierManager.sharedManager.isAdvertisingTrackingEnabled;
    return isEnable;
}
+(NSString *) deviceIDFA{
    NSString * idfa = ASIdentifierManager.sharedManager.advertisingIdentifier.UUIDString;
    return TBStringnil(idfa);
}
+(NSString *) deviceIDFV{
    NSString * idfv = UIDevice.currentDevice.identifierForVendor.UUIDString;
    return TBStringnil(idfv);
}
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
