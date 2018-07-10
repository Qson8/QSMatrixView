//
//  QSMatrixCollectionDemo3.m
//  QSMatrixView
//
//  Created by Qson on 2018/7/10.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "QSMatrixCollectionDemo3.h"

@interface QSMatrixCollectionDemo3 ()

@end

@implementation QSMatrixCollectionDemo3

- (QSMatrixHeaderAndFooterItem *)headerItem {
    
    QSSupportButtonItem *leftItem = [[QSSupportButtonItem alloc] init];
    leftItem.title = @"实用工具";
    leftItem.image = [UIImage imageNamed:@"fw_cwfw"];
    leftItem.titleColor = QSColorFromRGB(0x333333);
    leftItem.titleFont = [UIFont systemFontOfSize:16];
    leftItem.marginEdge = UIEdgeInsetsMake(0, 12, 0, 0);
    
    QSSupportButtonItem *rightItem = [[QSSupportButtonItem alloc] init];
    rightItem.title = @"更多服务请点这里 >";
    rightItem.titleColor = [UIColor whiteColor];
    rightItem.titleFont = [UIFont systemFontOfSize:12];
    rightItem.marginEdge = UIEdgeInsetsMake(0, 0, 0, 12);
    
    rightItem.target = self;
    rightItem.action = @selector(headerActionDidClick);
    
    QSMatrixHeaderAndFooterItem *item = [[QSMatrixHeaderAndFooterItem alloc] init];
    item.leftItem = leftItem;
    item.rightItem = rightItem;
    item.contentSize = CGSizeMake(kScreenWidth, 38);
    item.backgroundColor = [UIColor whiteColor];
    
    return item;
}

- (QSMatrixHeaderAndFooterItem *)footerItem {
    
    QSSupportButtonItem *rightItem = [[QSSupportButtonItem alloc] init];
    rightItem.title = @"更多服务请点这里 >";
    rightItem.titleColor = [UIColor whiteColor];
    rightItem.titleFont = [UIFont systemFontOfSize:12];
    rightItem.marginEdge = UIEdgeInsetsMake(0, 0, 0, 12);
    
    rightItem.target = self;
    rightItem.action = @selector(footerActionDidClick);
    
    QSMatrixHeaderAndFooterItem *item = [[QSMatrixHeaderAndFooterItem alloc] init];
    item.rightItem = rightItem;
    item.contentSize = CGSizeMake(kScreenWidth, 38);
    item.backgroundColor = [UIColor whiteColor];
    return item;
}

#pragma mark - 事件
- (void)headerActionDidClick {
    NSLog(@"%s",__func__);
}

- (void)footerActionDidClick {
    NSLog(@"%s",__func__);
}

@end
