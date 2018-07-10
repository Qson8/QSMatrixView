//
//  QSMatrixCollectionView.h
//  QSMatrixView
//
//  Created by Qson on 2018/7/9.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QSMatrixCollectionItem,QSMatrixUIItem,QSMatrixHeaderAndFooterItem,QSMatrixCollectionView;

@protocol QSMatrixCollectionViewDelegate <NSObject>
@optional
- (void)matrixView:(QSMatrixCollectionView *)matrixView didSelectItem:(QSMatrixCollectionItem *)item;
@end

@interface QSMatrixCollectionView : UIView
@property (nonatomic, weak) id <QSMatrixCollectionViewDelegate> delegate;
@property (nonatomic, strong,readonly) NSArray <QSMatrixCollectionItem *>*items;
@property (nonatomic, strong, readonly) QSMatrixUIItem *UIItem;
@property (nonatomic, strong, readonly) QSMatrixHeaderAndFooterItem *headerItem;
@property (nonatomic, strong, readonly) QSMatrixHeaderAndFooterItem *footerItem;


- (void)setDataItems:(NSArray *)dataItems
              UIItem:(QSMatrixUIItem *)UIItem
          headerItem:(QSMatrixHeaderAndFooterItem *)headerItem
          footerItem:(QSMatrixHeaderAndFooterItem *)footerItem;
@end
