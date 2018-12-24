//
//  TBValidTool.h
//  deviceTool
//
//  Created by careyang on 2018/12/21.
//  Copyright © 2018 careyang. All rights reserved.
//
#import <UIKit/UIKit.h>

#ifndef TBValidTool_h
#define TBValidTool_h

/*
 内联函数 在这里就相当于宏定义的作用

 为什么inline能取代宏？
 优点相比于函数:

 inline函数避免了普通函数的,在汇编时必须调用call的缺点:取消了函数的参数压栈，减少了调用的开销,提高效率.所以执行速度确比一般函数的执行速度要快.
 2)集成了宏的优点,使用时直接用代码替换(像宏一样);

 优点相比于宏:

 1)避免了宏的缺点:需要预编译.因为inline内联函数也是函数,不需要预编译.

 2)编译器在调用一个内联函数时，会首先检查它的参数的类型，保证调用正确。然后进行一系列的相关检查，就像对待任何一个真正的函数一样。这样就消除了它的隐患和局限性。

 3)可以使用所在类的保护成员及私有成员。

 摘抄自:https://www.jianshu.com/p/d557b0831c6a

 */

// 直接设置图片
CG_INLINE UIImage * TBImage (NSString * imageName){
    return [UIImage imageNamed:imageName];
}
//判断字符串的长度是否大于0
CG_INLINE BOOL TBStringLength (NSString * string){
    return ([string isKindOfClass:[NSString class]] && string.length > 0);
}
// 验证字符串合法，nil 转 @""
CG_INLINE NSString * TBStringnil (NSString * string){
    return TBStringLength(string) ? string : @"";
}

/// 判断数组存在并且数组的count>0
CG_INLINE BOOL TBArrayCountValid (NSArray *array) {
    return (([array isKindOfClass:[NSArray class]] || [array isKindOfClass:[NSMutableArray class]]) && array.count > 0);
}

CG_INLINE NSString * TBIntToString(NSInteger value){
    return [NSString stringWithFormat:@"%ld",value];
}

#endif /* TBValidTool_h */
