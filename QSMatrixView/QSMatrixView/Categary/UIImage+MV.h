//
//  UIImage+MV.h
//  QSMatrixView
//
//  Created by Qson on 2018/7/11.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MV)
+ (UIImage *)imageWithImageName:(NSString *)imageName;

- (UIImage *)scaleToSize:(CGSize)size;
@end
