//
//  TBUICreater.h
//  Pods-TBTools_Example
//
//  Created by careyang on 11/8/2020.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBUICreater : NSObject

/** 创建UILabel */
+(UILabel *) createLabelWithFrame:(CGRect) frame andText:(NSString *) text andTextAlignment:(NSTextAlignment)textAlignment andFont:(UIFont *) font andTextColor:(UIColor *)textColor andNumOfLine:(NSInteger) numLine ;

/** 创建UIButton */
+(UIButton *) createButtonWithFrame:(CGRect) frame andTitle:(NSString *) text andTextFont:(UIFont *) font andTextColor:(UIColor *) color backGroundColor:(UIColor *) backgroundColor;

+(UIButton *) createButtonWithFrame:(CGRect)frame andBackgroundImageName:(NSString *) bgImageName;

+(UIButton *) createButtonWithFrame:(CGRect)frame ImageName:(NSString *) imageName edgeInest:(UIEdgeInsets) insets;

/** 创建UIView */
+(UIView *) createViewWithFrame:(CGRect) frame andBackGroundColor:(UIColor *) color;

/** 创建UITextfield */
+(UITextField *) createTextFieldWithFrame:(CGRect) frame andFont:(UIFont *) font andTextColor:(UIColor *)textColor andPlaceholder:(NSString *) holderText andClearButtonMode:(UITextFieldViewMode) mode ;


@end

NS_ASSUME_NONNULL_END
