//
//  UIButton+MV.h
//  QSMatrixView
//
//  Created by Qson on 2018/7/11.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>

// 定义一个枚举（包含了四种类型的button）
typedef NS_ENUM(NSUInteger, MVButtonEdgeInsetsStyle) {
    MVButtonEdgeInsetsStyleTop, // image在上，label在下
    MVButtonEdgeInsetsStyleLeft, // image在左，label在右
    MVButtonEdgeInsetsStyleBottom, // image在下，label在上
    MVButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (MV)
/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(MVButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;
@end
