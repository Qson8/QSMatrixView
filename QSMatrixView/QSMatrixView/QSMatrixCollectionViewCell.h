//
//  QSMatrixCollectionViewCell.h
//  QSMatrixView
//
//  Created by Qson on 2018/7/9.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QSMatrixCollectionItem,QSMatrixUIItem;

@interface QSMatrixCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) QSMatrixCollectionItem *item;
@property (nonatomic, strong) QSMatrixUIItem *UIItem;

- (void)setDataItem:(QSMatrixCollectionItem *)dataItem UIItem:(QSMatrixUIItem *)UIIte;
@end
