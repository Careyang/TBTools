//
//  DeviceTool.h
//  deviceTool
//
//  Created by careyang on 2018/12/21.
//  Copyright © 2018 careyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface TBDeviceTool : NSObject



/**
 判断是否iPhone X/XS/MAX 机型

 @return 是 否
 */
+(BOOL) isPhoneXModel;

/**
 获取屏幕size

 @return 屏幕的size
 */
+(CGSize) ScreenSize;


+ (BOOL) isPadModel;
+ (BOOL) isPhoneModel;

#pragma mark 获取常用数据

/**
 iOS10 以后 判断用户是否限制了IDFA的追踪

 @return YES = 没有限制 返回正常， NO = 限制了，返回结果0000-0000-0000-0000
 */
+(BOOL) IDFAisEnable;
+(NSString *) DeviceIDFA;
+(NSString *) DeviceIDFV;
/**
 获取设备的类型

 @return   iPhone , iPad , TV
 */
+(NSString *) DeviceType;
/**
 获取手机型号

 @return 返回形式 iPhone10,4
 */
+(NSString *) DeviceModel;
+(NSString *) AppVersion;
+(NSString *) AppBuildVersion;
+(NSString *) AppBundleId;
+(NSString *) AppDisplayName;
+(NSString *) DeviceIDFV;
@end

NS_ASSUME_NONNULL_END
