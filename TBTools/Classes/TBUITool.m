//
//  CYToolBox.m
//  toolsBox
//
//  Created by careyang on 2018/6/22.
//  Copyright © 2018年 careyang. All rights reserved.
//

#import "TBUITool.h"

@implementation TBUITool

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
+(UIButton *) createButtonWithFrame:(CGRect)frame andBackgroundImageName:(NSString *) bgImageName orImageName:(NSString *) imageName
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
    else if (imageName)
    {
        UIImage * image = [UIImage imageNamed:imageName];
        if (image)
            [button setImage:image forState:UIControlStateNormal];
        else
            NSLog(@"创建Button,setImage 为空");

        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }

    return button;
}
+(UIView *) createViewWithFrame:(CGRect) frame andBackGroundColor:(UIColor *) color
{
    UIView * view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    return view;
}
#pragma mark 创建textview
+(UITextField *) createTextFieldWithFrame:(CGRect) frame andFont:(UIFont *) font andTextColor:(UIColor *)textColor andPlaceholder:(NSString *) holderText andClearButtonMode:(UITextFieldViewMode) mode
{
    UITextField * textField = [[UITextField alloc] initWithFrame:frame];
    textField.placeholder = holderText;
    textField.textColor = textColor;
    textField.font = font;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    return textField;
}

#pragma mark 计算文本的高度
+ (float)getLabelHeight:(NSString *)text andFont:(UIFont *)font andWidth:(float)width
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    CGSize size = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height+1;
}


#pragma mark 设置view 的圆角
+(void) viewBeizerRect:(CGRect) rect view:(UIView *) view corner:(UIRectCorner) corner cornerRad:(CGSize)rad
{
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:rad];

    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = view.bounds;
    shapeLayer.path = path.CGPath;
    view.layer.mask = shapeLayer;
}

#pragma mark 设置view的毛玻璃效果
+(void) blurEffect:(UIView *) view blurStyle:(UIBlurEffectStyle) style blurViewAlpha:(CGFloat) alpha
{
    UIBlurEffect * blur = [UIBlurEffect effectWithStyle:style];

    UIVisualEffectView * blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
    blurView.alpha = alpha;
    blurView.frame = view.bounds;
    [view addSubview:blurView];
}

#pragma mark 设置view阴影
+(void)setViewShodow:(UIView *)view shadowColor:(UIColor *)sColor shadowOffset:(CGSize)sSize shadowRadius:(CGFloat)rad shadowOpacity:(float)opacity
{
    view.layer.shadowColor = sColor.CGColor;
    view.layer.shadowOffset = sSize;
    view.layer.shadowRadius = rad;
    view.layer.shadowOpacity = opacity;
}

#pragma mark 设置圆角和边框
+(void)setViewRadiusAndBorder:(UIView *)view radius:(CGFloat)rad maskToBounds:(BOOL)mask borderColor:(UIColor *)color borderWidth:(CGFloat)width
{
    view.layer.cornerRadius  = rad;
    view.layer.masksToBounds = mask;
    view.layer.borderColor   = color.CGColor;
    view.layer.borderWidth   = width;
}
#pragma mark 设置某个view抖动
+(void) shakeAnimationForView:(UIView *) shakeView
{
    CALayer * layer = shakeView.layer;
    CGPoint position = layer.position;
    CGPoint X = CGPointMake(position.x + 10, position.y);
    CGPoint Y = CGPointMake(position.x - 10, position.y);

    CABasicAnimation * animate = [CABasicAnimation animationWithKeyPath:@"position"];
    [animate setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [animate setFromValue:[NSValue valueWithCGPoint:X]];
    [animate setToValue:[NSValue valueWithCGPoint:Y]];
    [animate setAutoreverses:YES];
    [animate setDuration:0.1];
    [animate setRepeatCount:2];
    [layer addAnimation:animate forKey:@"shakeAnimate"];
}

#pragma mark 获取文字的宽度(小于屏幕宽度)
+(CGFloat) getWidthWithText:(NSString *) text font:(UIFont *) font
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(UIScreen.mainScreen.bounds.size.width, 50) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.width + 20;
}

#pragma mark 获取当前屏幕的截图
+(UIImage *) getCurrentScreenShot
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(size, YES, scale);
    [[UIApplication sharedApplication].keyWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage *) getCurrentViewShot:(UIView *) view
{
    CGSize size = view.frame.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(size, YES, scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+(UIImage *) getCurrentScrollviewShot:(UIScrollView *) scrollview
{
    CGSize size = scrollview.contentSize;
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(size, YES, scale);

    //获取当前scrollview的frame 和 contentOffset
    CGRect saveFrame = scrollview.frame;
    CGPoint saveOffset = scrollview.contentOffset;
    //置为起点
    scrollview.contentOffset = CGPointZero;
    scrollview.frame = CGRectMake(0, 0, scrollview.contentSize.width, scrollview.contentSize.height);

    [scrollview.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    scrollview.frame = saveFrame;
    scrollview.contentOffset = saveOffset;

    return image;
}

//获得某个范围内的屏幕图像
+ (UIImage *) getCurrentInnerViewShot: (UIView *) innerView atFrame:(CGRect)rect
{
    UIGraphicsBeginImageContext(innerView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(rect);
    [innerView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return  theImage;
}

@end
