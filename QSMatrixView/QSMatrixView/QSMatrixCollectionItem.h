//
//  QSMatrixCollectionItem.h
//  QSMatrixView
//
//  Created by Qson on 2018/7/9.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QSMatrixCollectionItem : NSObject

@property (nonatomic, copy) NSString *_id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, strong) UIImage *placeholderImage;
@property (nonatomic, copy) NSString *cateid;

/** 外跳 */
//// 外跳链接
@property (nonatomic, copy) NSString *url;
//// 打开类型
@property (nonatomic, copy) NSString *jump_type;
//// 重定向标题
@property (nonatomic, copy) NSString *jump_title;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)itemWithDict:(NSDictionary *)dict;
@end


@interface QSMatrixUIItem : NSObject

/** collectionView相关 */
@property (nonatomic, assign) CGFloat contentWidth;

/// collectionView顶部分割线
@property (nonatomic, assign) CGFloat collectionViewToplineHeight;
/// collectionView底部分割线
@property (nonatomic, assign) CGFloat collectionViewBotlineHeight;

/** cell相关 */
@property (nonatomic, assign) CGFloat itemHeight;
@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, assign, readonly) CGSize itemSize;

@property (nonatomic, assign) CGFloat minimumLineSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;

@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, assign) UIEdgeInsets itemMarginEdge;
@property (nonatomic, assign) CGFloat itemMiddleMargin;
@property (nonatomic, assign) CGSize itemImageSize;

@end
