//
//  CYToolBox.h
//  toolsBox
//
//  Created by careyang on 2018/6/22.
//  Copyright © 2018年 careyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TBUITool : NSObject

#pragma mark ToolBox

/** 计算文本高度 */
+ (float)getLabelHeight:(NSString *)text andFont:(UIFont *)font andWidth:(float)width;


/** 设置view圆角 */
+(void) viewBeizerRect:(CGRect) rect view:(UIView *) view corner:(UIRectCorner) corner cornerRad:(CGSize)rad;
/** 设置view 的毛玻璃,其实是一个遮罩层 */
+(void) blurEffect:(UIView *) view blurStyle:(UIBlurEffectStyle) style blurViewAlpha:(CGFloat) alpha;
/** 设置view阴影 */
+(void)setViewShodow:(UIView *)view shadowColor:(UIColor *)sColor shadowOffset:(CGSize)sSize shadowRadius:(CGFloat)rad shadowOpacity:(float)opacity;
/** 设置圆角和边框 */
+(void)setViewRadiusAndBorder:(UIView *)view radius:(CGFloat)rad maskToBounds:(BOOL)mask borderColor:(UIColor *)color borderWidth:(CGFloat)width;

/** 设置某个view抖动*/
+(void) shakeAnimationForView:(UIView *) shakeView;
/** 获取文本宽度,不超过一屏幕*/
+(CGFloat) getWidthWithText:(NSString *) text font:(UIFont *) font;

/** 获取屏幕截图 */
+(UIImage *) getCurrentScreenShot;
/** 获取某个view 上的截图 */
+(UIImage *) getCurrentViewShot:(UIView *) view;
/** 获取某个scrollview 上的截图 */
+(UIImage *) getCurrentScrollviewShot:(UIScrollView *) scrollview;
/** 获取某个 范围内的 截图 */
+ (UIImage *) getCurrentInnerViewShot: (UIView *) innerView atFrame:(CGRect)rect;



@end
