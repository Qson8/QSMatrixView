//
//  UIColor+QS.h
//  QSMatrixView
//
//  Created by Qson on 2018/7/9.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (QS)
/**
 *  16进制格式的颜色转化成类对象
 */
+ (UIColor *)colorWithHexValue:(NSInteger)hexValue alpha:(CGFloat)alpha;


/**
 *  16进制格式的颜色转化成类对象
 */
+ (UIColor *)colorWithHexValue:(NSInteger)hexValue;

/** 十六进制字符串 转成 颜色 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color;
@end
