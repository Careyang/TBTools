//
//  TBUICreater.m
//  Pods-TBTools_Example
//
//  Created by careyang on 11/8/2020.
//

#import "TBUICreater.h"

@implementation TBUICreater

#pragma mark 创建UILabel
+(UILabel *) createLabelWithFrame:(CGRect) frame andText:(NSString *) text andTextAlignment:(NSTextAlignment)textAlignment andFont:(UIFont *) font andTextColor:(UIColor *)textColor andNumOfLine:(NSInteger) numLine
{
    UILabel * label = [[UILabel alloc] initWithFrame:frame];
    label.font = font;
    label.text = text;
    label.textAlignment = textAlignment;
    label.numberOfLines = numLine;
    label.textColor = textColor;
    return label;
}
#pragma mark 创建文字UIButton
+(UIButton *) createButtonWithFrame:(CGRect) frame andTitle:(NSString *) text andTextFont:(UIFont *) font andTextColor:(UIColor *) color backGroundColor:(UIColor *) backgroundColor
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.titleLabel.font = font;
    if (text)
        [button setTitle:text forState:UIControlStateNormal];
    if (color)
        [button setTitleColor:color forState:UIControlStateNormal];
    if (backgroundColor)
        button.backgroundColor = backgroundColor;
    return button;
}
#pragma mark 创建图片UIButton
+(UIButton *) createButtonWithFrame:(CGRect)frame andBackgroundImageName:(NSString *) bgImageName
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;

    if (bgImageName) {
        UIImage * image = [UIImage imageNamed:bgImageName];
        if (image)
            [button setBackgroundImage:image forState:UIControlStateNormal];
        else
            NSLog(@"创建Button,setBackgroundImage 为空");
    }
    return button;
}
+(UIButton *) createButtonWithFrame:(CGRect)frame ImageName:(NSString *) imageName edgeInest:(UIEdgeInsets) insets
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
   if (imageName)
    {
        UIImage * image = [UIImage imageNamed:imageName];
        if (image)
            [button setImage:image forState:UIControlStateNormal];
        else
            NSLog(@"创建Button,setImage 为空");

        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    button.imageEdgeInsets = insets;
    return button;
}

+(UIView *) createViewWithFrame:(CGRect) frame andBackGroundColor:(UIColor *) color
{
    UIView * view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    return view;
}
#pragma mark 创建 textField
+(UITextField *) createTextFieldWithFrame:(CGRect) frame andFont:(UIFont *) font andTextColor:(UIColor *)textColor andPlaceholder:(NSString *) holderText andClearButtonMode:(UITextFieldViewMode) mode
{
    UITextField * textField = [[UITextField alloc] initWithFrame:frame];
    textField.placeholder = holderText;
    textField.textColor = textColor;
    textField.font = font;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    return textField;
}


@end
