//
//  UIImageView+QS.h
//  SydneyToday
//
//  Created by Qson on 16/9/24.
//  Copyright © 2016年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^QSImageCompletionBlock)(UIImage *image, NSError *error,NSURL *imageURL);

@interface UIImageView (QS)

/**
 *  处理图片控件加载和动画显示
 *
 *  @param url            要加载的url字符串地址
 *  @param completedBlock 完成的回调
 */
- (void)qs_setImageWithUrlStr:(NSString *)url completion:(QSImageCompletionBlock)completedBlock;


/**
 *  处理图片控件加载和动画显示(带占位图)
 *
 *  @param placeholderImg 占位图片名
 *  @param url            要加载的url字符串地址
 *  @param completedBlock 完成的回调
 */
- (void)qs_setImageWithUrlStr:(NSString *)url placeholder:(NSString *)imgName completion:(QSImageCompletionBlock)completedBlock;

/**
 *  处理图片控件加载和动画显示
 *
 *  @param placeholderImg 占位图片名
 *  @param url            要加载的url字符串地址
 *  @param duration       动画时间
 *  @param completedBlock 完成的回调
 */
- (void)qs_setImageWithUrlStr:(NSString *)url placeholder:(NSString *)imgName duration:(NSTimeInterval)duration completion:(QSImageCompletionBlock)completedBlock;

/**
 *  处理图片控件加载和动画显示
 *
 *  @param placeholderImage 占位图
 *  @param url            要加载的url字符串地址
 *  @param completedBlock 完成的回调
 */
- (void)qs_setImageWithUrlStr:(NSString *)url placeholderImage:(UIImage *)placeholderImage completion:(QSImageCompletionBlock)completedBlock;



// !!!: 视图特效
- (void)setEffectWithStyle:(UIBlurEffectStyle)style alpha:(CGFloat)alpha;
@end
