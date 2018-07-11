//
//  QSMatrixCollectionViewCell.m
//  QSMatrixView
//
//  Created by Qson on 2018/7/9.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "QSMatrixCollectionViewCell.h"
#import "QSMatrixCollectionItem.h"
#import "UIImageView+MV.h"

@interface QSMatrixCollectionViewCell ()
@property (nonatomic, weak) UIView *customView;
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *titleLabel;
@end

@implementation QSMatrixCollectionViewCell


#pragma mark - 内部实现
- (void)setupData {
    self.titleLabel.text = _item.title;
    self.titleLabel.textColor = _UIItem.titleColor;
    self.titleLabel.font = _UIItem.titleFont;
    
    [self.iconView mv_setImageWithUrlStr:_item.photo placeholderImage:_item.placeholderImage completion:nil];
}

- (void)setupFrame {
    CGFloat x = 0,y = 0,w = 0,h = 0;
    CGFloat itemw = _UIItem.itemWidth;
    
    w = _UIItem.itemImageSize.width;
    h = _UIItem.itemImageSize.height;
    x = (itemw - w) * 0.5;
    y = _UIItem.itemMarginEdge.top;
    self.iconView.frame = CGRectMake(x, y, w, h);
    
    y = CGRectGetMaxY(self.iconView.frame) + _UIItem.itemMarginEdge.bottom;
    w = itemw;
    x = 0;
    h = self.titleLabel.font.lineHeight;
    self.titleLabel.frame = CGRectMake(x, y, w, h);
    
    h = _UIItem.itemHeight;
    w = itemw;
    x = 0;
    y = 0;
    self.customView.frame = CGRectMake(x, y, w, h);
}

#pragma mark - 外部方法
- (void)setDataItem:(QSMatrixCollectionItem *)dataItem UIItem:(QSMatrixUIItem *)UIItem {
    
    _item = dataItem;
    _UIItem = UIItem;
    
    [self setupData];
    [self setupFrame];
}

#pragma mark - 懒加载
- (UIImageView *)iconView
{
    if (_iconView == nil) {
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.contentMode = UIViewContentModeScaleAspectFill;
        iconView.clipsToBounds = YES;
        [self.customView addSubview:iconView];
        _iconView = iconView;
    }
    return _iconView;
}
- (UILabel *)titleLabel
{
    if(_titleLabel == nil) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.adjustsFontSizeToFitWidth = YES;
//        titleLabel.font = [UIFont systemFontOfSize:14];
//        titleLabel.textColor = QSColorFromRGB(0x333333);
        [self.customView addSubview:titleLabel];
        _titleLabel = titleLabel;
    }
    return  _titleLabel;
}

- (UIView *)customView
{
    if(_customView == nil) {
        UIView *customView = [[UIView alloc] init];
        customView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:customView];
        _customView = customView;
    }
    return _customView;
}
@end
