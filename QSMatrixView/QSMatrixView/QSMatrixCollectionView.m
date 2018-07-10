//
//  QSMatrixCollectionView.m
//  QSMatrixView
//
//  Created by Qson on 2018/7/9.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "QSMatrixCollectionView.h"
#import "QSCollectionViewFlowLayout.h"
#import "QSMacro.h"
#import "QSMatrixCollectionItem.h"
#import "QSSupportView.h"
#import "UIImage+Extension.h"
#import "QSMatrixHeaderAndFooterItem.h"

#define kColCount 4 // 列数

@interface QSMatrixCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, weak) UIView *customView;
@property (nonatomic, weak) QSSupportView *headerView;
@property (nonatomic, weak) QSSupportView *footerView;
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation QSMatrixCollectionView

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self setupFrame];
}

#pragma mark - 外部方法
- (void)setDataItems:(NSArray *)dataItems
              UIItem:(QSMatrixUIItem *)UIItem
          headerItem:(QSMatrixHeaderAndFooterItem *)headerItem
          footerItem:(QSMatrixHeaderAndFooterItem *)footerItem {
    self.items = dataItems;
    self.UIItem = UIItem;
    self.headerItem = headerItem;
    self.footerItem = footerItem;
    
    [self.collectionView reloadData];
    
    [self setupFrame];
}


#pragma mark - setting
- (void)setUIItem:(QSMatrixUIItem *)UIItem {
    _UIItem = UIItem;
}

- (void)setItems:(NSArray<QSMatrixCollectionItem *> *)items {
    _items = items;
    
    // 补起空缺的 创建空的站位
    int exponentiation = _items.count % kColCount;
    if(exponentiation) {
        int lackCount = (kColCount - exponentiation);
        NSMutableArray *itemsM = [NSMutableArray arrayWithArray:_items];
        for (int i = 0; i < lackCount; i++) {
            QSMatrixCollectionItem *item = [[QSMatrixCollectionItem alloc] init];
            [itemsM addObject:item];
        }
        _items = [itemsM mutableCopy];
    }
}

- (void)setHeaderItem:(QSMatrixHeaderAndFooterItem *)headerItem {
    _headerItem = headerItem;
    
    self.headerView.item = headerItem;
    self.headerView.backgroundColor = _headerItem.backgroundColor;
}

- (void)setFooterItem:(QSMatrixHeaderAndFooterItem *)footerItem {
    _footerItem = footerItem;

    self.footerView.item = footerItem;
    self.footerView.backgroundColor = _footerItem.backgroundColor;
}

#pragma mark - 事件
- (void)viewMoreServices {
    
}

#pragma mark - 内部实现
- (void)setupFrame {
    
    int rows = ceilf(1.0 * _items.count / kColCount);
    CGFloat x = 0,y = 0,w = 0,h = 0;
    
    y = 0;
    w = _headerItem.contentSize.width;
    h = _headerItem.contentSize.height;
    self.headerView.frame = CGRectMake(x, y, w, h);
    
    h = ceilf(rows * _UIItem.itemHeight + (rows - 1) * _UIItem.minimumLineSpacing);
    x = 0;
    w = _UIItem.contentWidth;
    y = CGRectGetMaxY(self.headerView.frame) + _UIItem.collectionViewToplineHeight;
    self.collectionView.frame = CGRectMake(x, y, w, h);
    
    y = ceilf(CGRectGetMaxY(self.collectionView.frame) + _UIItem.collectionViewBotlineHeight);
    w = _footerItem.contentSize.width;
    h = _footerItem.contentSize.height;
    x = 0;
    self.footerView.frame = CGRectMake(x, y, w, h);
    
    w = _UIItem.contentWidth;
    h = ceilf(CGRectGetMaxY(self.footerView.frame));
    x = 0;
    y = 0;
    self.customView.frame = CGRectMake(x, y, w, h);
    
    self.height = ceilf(CGRectGetMaxY(self.customView.frame));
    self.width = _UIItem.contentWidth;
}

#pragma mark - 代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QSMatrixCollectionItem *item = _items[indexPath.row];
    QSMatrixCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell setDataItem:item UIItem:_UIItem];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return _UIItem.itemSize;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    QSMatrixCollectionItem *item = _items[indexPath.row];
    if(!item.title.length) return; // 存在空的站位item，需要过滤
    
    if([_delegate respondsToSelector:@selector(matrixView:didSelectItem:)]) {
        [_delegate matrixView:self didSelectItem:item];
    }
}

#pragma mark - 懒加载
static NSString *identifier = @"QSMatrixCollectionView";
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        
        QSCollectionViewFlowLayout *layout = [[QSCollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = _UIItem.minimumLineSpacing;
        layout.minimumInteritemSpacing = _UIItem.minimumInteritemSpacing;
        layout.itemSize = _UIItem.itemSize;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self.customView addSubview:collectionView];
        _collectionView = collectionView;
        
        collectionView.backgroundColor = [UIColor clearColor];
        [collectionView setDelegate:self];
        [collectionView setDataSource:self];
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.scrollEnabled = NO;
        [collectionView registerClass:[QSMatrixCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    }
    return _collectionView;
}

- (QSSupportView *)headerView {
    if(_headerView == nil) {
//        QSSupportButtonItem *leftItem = [[QSSupportButtonItem alloc] init];
//        leftItem.title = @"热门服务";
//        leftItem.titleColor = QSColor(51, 51, 51, 1.0);
//        leftItem.titleFont = [UIFont systemFontOfSize:16];
//        leftItem.marginEdge = UIEdgeInsetsMake(0, 20, 0, 0);
        
//        QSSupportButtonItem *rightItem = [[QSSupportButtonItem alloc] init];
//        rightItem.title = @"更多服务请点这里";
//        rightItem.titleColor = QSColorFromRGB(0x9a9a9a);
//        rightItem.titleFont = [UIFont systemFontOfSize:14];
//        rightItem.image = [[UIImage imageWithImageName:@"grzx_edit"] scaleToSize:CGSizeMake(6, 11)];
//        rightItem.imageEdge = UIEdgeInsetsMake(0, 10, 0, 0);
//        rightItem.marginEdge = UIEdgeInsetsMake(0, 0, 0, 15);
//        rightItem.target = self;
//        rightItem.action = @selector(viewMoreServices);
        
//        QSMatrixHeaderAndFooterItem *item = [[QSMatrixHeaderAndFooterItem alloc] init];
//        item.leftItem = leftItem;
//        item.rightItem = rightItem;
        
        QSSupportView *headerView = [[QSSupportView alloc] init];
//        headerView.frame = CGRectMake(0, 0, kScreenWidth, 38);
//        headerView.item = item;
        [self.customView addSubview:headerView];
        _headerView = headerView;
    }
    return _headerView;
}

- (QSSupportView *)footerView {
    if(_footerView == nil) {
        QSSupportView *footerView = [[QSSupportView alloc] init];
        [self.customView addSubview:footerView];
        _footerView = footerView;
    }
    return _footerView;
}

- (UIView *)customView {
    if (_customView == nil) {
        UIView *customView = [[UIView alloc] init];
        [self addSubview:customView];
        _customView = customView;
    }
    return _customView;
}
@end
