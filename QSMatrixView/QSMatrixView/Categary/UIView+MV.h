//
//  UIView+MV.h
//  QSMatrixView
//
//  Created by Qson on 2018/7/11.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MV)
// frame
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, weak, readonly) UIViewController *topViewController;
@end
