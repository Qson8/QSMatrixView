//
//  UIImage+Extension.m
//  QSSearchDemo
//
//  Created by Qson on 2018/7/3.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)imageWithImageName:(NSString *)imageName
{
    NSString *dirPath = [[NSBundle mainBundle] pathForResource:@"QSMatrixView" ofType:@"bundle"];
    NSString *imagePath = [dirPath stringByAppendingPathComponent:imageName];
    UIImage *image = [UIImage imageNamed:imagePath];
    return image;
}

- (UIImage *)scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

@end
