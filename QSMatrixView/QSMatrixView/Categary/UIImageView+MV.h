//
//  UIImageView+MV.h
//  QSMatrixView
//
//  Created by Qson on 2018/7/11.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (MV)
typedef void(^MVImageCompletionBlock)(UIImage *image, NSError *error,NSURL *imageURL);

/**
 *  处理图片控件加载和动画显示
 *
 *  @param url            要加载的url字符串地址
 *  @param completedBlock 完成的回调
 */
- (void)mv_setImageWithUrlStr:(NSString *)url
                   completion:(MVImageCompletionBlock)completedBlock;


/**
 *  处理图片控件加载和动画显示(带占位图)
 *
 *  @param placeholderImg 占位图片名
 *  @param url            要加载的url字符串地址
 *  @param completedBlock 完成的回调
 */
- (void)mv_setImageWithUrlStr:(NSString *)url
                  placeholder:(NSString *)placeholderImg
                   completion:(MVImageCompletionBlock)completedBlock;

/**
 *  处理图片控件加载和动画显示
 *
 *  @param placeholderImg 占位图片名
 *  @param url            要加载的url字符串地址
 *  @param duration       动画时间
 *  @param completedBlock 完成的回调
 */
- (void)mv_setImageWithUrlStr:(NSString *)url
                  placeholder:(NSString *)placeholderImg
                     duration:(NSTimeInterval)duration completion:(MVImageCompletionBlock)completedBlock;

/**
 *  处理图片控件加载和动画显示
 *
 *  @param placeholderImage 占位图
 *  @param url            要加载的url字符串地址
 *  @param completedBlock 完成的回调
 */
- (void)mv_setImageWithUrlStr:(NSString *)url
             placeholderImage:(UIImage *)placeholderImage
                   completion:(MVImageCompletionBlock)completedBlock;



// !!!: 视图特效
- (void)setEffectWithStyle:(UIBlurEffectStyle)style
                     alpha:(CGFloat)alpha;
@end
