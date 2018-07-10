//
//  QSMatrixHeaderAndFooterItem.h
//  QSMatrixView
//
//  Created by Qson on 2018/7/9.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QSSupportButtonItem : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, assign) UIEdgeInsets marginEdge;
@property (nonatomic, assign) UIEdgeInsets contentEdge;
@property (nonatomic, assign) UIEdgeInsets titleEdge;
@property (nonatomic, assign) UIEdgeInsets imageEdge;

@property (nonatomic, weak) id  target;
@property (nonatomic)  SEL action;
@end

@interface QSMatrixHeaderAndFooterItem : NSObject
@property (nonatomic, strong) QSSupportButtonItem *leftItem;
@property (nonatomic, strong) QSSupportButtonItem *rightItem;


@property (nonatomic, assign) CGSize contentSize;
@property (nonatomic, strong) UIColor *backgroundColor;
@end
