//
//  UIImageView+QS.m
//  SydneyToday
//
//  Created by Qson on 16/9/24.
//  Copyright © 2016年 Qson. All rights reserved.
//

#import "UIImageView+QS.h"
#import "SDWebImageDownloader.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (QS)
/**
 *  处理图片控件加载和动画显示
 *
 *  @param url            要加载的url字符串地址
 *  @param completedBlock 完成的回调
 */
- (void)qs_setImageWithUrlStr:(NSString *)url completion:(QSImageCompletionBlock)completedBlock{
    if (url == nil || url.length == 0) { // 排除地址为nil的情况
        [self setImage:[UIImage imageNamed:@"listPlaceHolder"]];
        if (completedBlock) {completedBlock(nil,nil,nil);}
        return;
    }

    SDWebImageDownloader *manager = [SDWebImageManager sharedManager].imageDownloader;
    [manager setValue:@"http://www.chinesetoday.cn" forHTTPHeaderField:@"Referer"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"listPlaceHolder"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image && cacheType == SDImageCacheTypeNone) { // 防止上划，出现图片交替现象
            self.alpha = 0.3;
            [UIView transitionWithView:self duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                self.alpha = 1.0;
                if (completedBlock) {completedBlock(image,error,imageURL);}
            } completion:nil];
        }
        else {
            if (completedBlock) {completedBlock(image,error,imageURL);}
        }
    }];
}


/**
 *  处理图片控件加载和动画显示
 *
 *  @param placeholderImg 占位图片名
 *  @param url            要加载的url字符串地址
 *  @param completedBlock 完成的回调
 */
- (void)qs_setImageWithUrlStr:(NSString *)url placeholder:(NSString *)imgName completion:(QSImageCompletionBlock)completedBlock {
    // 占位图
    UIImage *placeholderImage = (imgName.length) ? [UIImage imageNamed:imgName] : nil;

    if (url == nil || url.length == 0) { // 排除地址为nil的情况
        [self setImage:placeholderImage];
        
        if (completedBlock) {
            completedBlock(nil,nil,nil);
        }
        return;
    }
    // @"http://www.chinesetoday.cn
    SDWebImageDownloader *manager = [SDWebImageManager sharedManager].imageDownloader;
    [manager setValue:@"http://www.chinesetoday.cn" forHTTPHeaderField:@"Referer"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (image && cacheType == SDImageCacheTypeNone) { // 防止上划，出现图片交替现象
            self.alpha = 0.3;
            [UIView transitionWithView:self duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                self.alpha = 1.0;
                if (completedBlock) {completedBlock(image,error,imageURL);}
            } completion:nil];
        }
        else {
            if (completedBlock) {completedBlock(image,error,imageURL);}
        }
    }];
}

/**
 *  处理图片控件加载和动画显示
 *
 *  @param placeholderImg 占位图片名
 *  @param url            要加载的url字符串地址
 *  @param url            要加载的url字符串地址
 *  @param completedBlock 完成的回调
 */
- (void)qs_setImageWithUrlStr:(NSString *)url placeholder:(NSString *)imgName duration:(NSTimeInterval)duration completion:(QSImageCompletionBlock)completedBlock {
    
    // 占位图
    UIImage *placeholderImage = (imgName.length) ? [UIImage imageNamed:imgName] : nil;
    
    if (url == nil || url.length == 0) { // 排除地址为nil的情况
        [self setImage:placeholderImage];
        
        if (completedBlock) {
            completedBlock(nil,nil,nil);
        }
        return;
    }
    // @"http://www.chinesetoday.cn
    SDWebImageDownloader *manager = [SDWebImageManager sharedManager].imageDownloader;
    [manager setValue:@"http://www.chinesetoday.cn" forHTTPHeaderField:@"Referer"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (image && cacheType == SDImageCacheTypeNone) { // 防止上划，出现图片交替现象
            self.alpha = 0.3;
            [UIView transitionWithView:self duration:duration options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                self.alpha = 1.0;
                if (completedBlock) {completedBlock(image,error,imageURL);}
            } completion:nil];
        }
        else {
            if (completedBlock) {completedBlock(image,error,imageURL);}
        }
    }];
}

/**
 *  处理图片控件加载和动画显示
 *
 *  @param placeholderImage 占位图
 *  @param url            要加载的url字符串地址
 *  @param completedBlock 完成的回调
 */
- (void)qs_setImageWithUrlStr:(NSString *)url placeholderImage:(UIImage *)placeholderImage completion:(QSImageCompletionBlock)completedBlock {
    if (url == nil || url.length == 0) { // 排除地址为nil的情况
        [self setImage:placeholderImage];
        
        if (completedBlock) {
            completedBlock(nil,nil,nil);
        }
        return;
    }
    // @"http://www.chinesetoday.cn
    SDWebImageDownloader *manager = [SDWebImageManager sharedManager].imageDownloader;
    [manager setValue:@"http://www.chinesetoday.cn" forHTTPHeaderField:@"Referer"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (image && cacheType == SDImageCacheTypeNone) { // 防止上划，出现图片交替现象
            self.alpha = 0.3;
            [UIView transitionWithView:self duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                self.alpha = 1.0;
                if (completedBlock) {completedBlock(image,error,imageURL);}
            } completion:nil];
        }
        else {
            if (completedBlock) {completedBlock(image,error,imageURL);}
        }
    }];
}

// !!!: 视图特效
- (void)setEffectWithStyle:(UIBlurEffectStyle)style alpha:(CGFloat)alpha
{
    // 创建需要的毛玻璃特效类型
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:style];
    // 毛玻璃view 视图
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    // 添加到要有毛玻璃特效的控件中
    effectView.frame = self.bounds;
    [self addSubview:effectView];
    // 设置模糊透明度
    effectView.alpha = alpha;
}
@end
