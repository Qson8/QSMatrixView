//
//  QSSupportView.m
//  QSMatrixView
//
//  Created by Qson on 2018/7/9.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "QSSupportView.h"
#import "UIButton+MV.h"
#import "UIView+MV.h"

@interface QSSupportView ()
@property (nonatomic, weak) QSSupportButtonItem *leftButtonItem;
@property (nonatomic, weak) QSSupportButtonItem *rightButtonItem;

@property (nonatomic, weak) UIButton *leftButton;
@property (nonatomic, weak) UIButton *rightButton;
@end

@implementation QSSupportView

- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self setupFrame];
}

#pragma mark - 内部实现
- (void)setupFrame {
    
    CGFloat x = 0,y = 0,w = 0,h = 0;
    x = _leftButtonItem.marginEdge.left;
    w = self.leftButton.width;
    h = self.leftButton.height;
    y = (self.height - h) * 0.5;
    self.leftButton.frame = CGRectMake(x, y, w, h);
    
    w = self.rightButton.width;
    h = self.rightButton.height;
    y = (self.height - h) * 0.5;
    x = self.width - self.rightButtonItem.marginEdge.right - w;
    self.rightButton.frame = CGRectMake(x, y, w, h);
    
    
    if(_leftButtonItem.title.length && _leftButtonItem.image) {
        CGFloat spa = _leftButtonItem.imageEdge.right + _leftButtonItem.titleEdge.left;
        [self.leftButton layoutButtonWithEdgeInsetsStyle:MVButtonEdgeInsetsStyleLeft imageTitleSpace:spa];
    }
    if(_rightButtonItem.title.length && _rightButtonItem.image) {
        CGFloat spa = _rightButtonItem.titleEdge.right + _rightButtonItem.imageEdge.left;
        [self.rightButton layoutButtonWithEdgeInsetsStyle:MVButtonEdgeInsetsStyleRight imageTitleSpace:spa];
    }
}

- (void)setLeftButtonItem:(QSSupportButtonItem *)leftButtonItem {
    _leftButtonItem = leftButtonItem;
    
    self.leftButton.titleLabel.font = leftButtonItem.titleFont;
    [self.leftButton setTitleColor:leftButtonItem.titleColor forState:(UIControlStateNormal)];
    [self.leftButton setTitle:leftButtonItem.title forState:(UIControlStateNormal)];
    [self.leftButton setImage:leftButtonItem.image forState:(UIControlStateNormal)];
    [self.leftButton setImageEdgeInsets:leftButtonItem.imageEdge];
    [self.leftButton setTitleEdgeInsets:leftButtonItem.titleEdge];
    [self.leftButton setContentEdgeInsets:leftButtonItem.contentEdge];
    self.leftButton.backgroundColor = leftButtonItem.backgroundColor;
    [self.leftButton sizeToFit];
    
    if(leftButtonItem.action) {
        self.leftButton.userInteractionEnabled = YES;
        [self.leftButton addTarget:leftButtonItem.target action:leftButtonItem.action forControlEvents:(UIControlEventTouchUpInside)];
    }
}

- (void)setRightButtonItem:(QSSupportButtonItem *)rightButtonItem {
    _rightButtonItem = rightButtonItem;
    
    self.rightButton.titleLabel.font = rightButtonItem.titleFont;
    [self.rightButton setTitleColor:rightButtonItem.titleColor forState:(UIControlStateNormal)];
    [self.rightButton setTitle:rightButtonItem.title forState:(UIControlStateNormal)];
    [self.rightButton setImage:rightButtonItem.image forState:(UIControlStateNormal)];
    [self.rightButton setImageEdgeInsets:rightButtonItem.imageEdge];
    [self.rightButton setTitleEdgeInsets:rightButtonItem.titleEdge];
    [self.rightButton setContentEdgeInsets:rightButtonItem.contentEdge];
    self.rightButton.backgroundColor = rightButtonItem.backgroundColor;
    [self.rightButton sizeToFit];
    
    if(rightButtonItem.action) {
        self.rightButton.userInteractionEnabled = YES;
        [self.rightButton addTarget:rightButtonItem.target action:rightButtonItem.action forControlEvents:(UIControlEventTouchUpInside)];
    }
}

#pragma mark - 外部方法
- (void)setItem:(QSMatrixHeaderAndFooterItem *)item {
    _item = item;
    
    self.leftButtonItem = item.leftItem;
    self.rightButtonItem = item.rightItem;
    
    [self setupFrame];
}

#pragma mark - 懒加载
- (UIButton *)leftButton
{
    if(_leftButton == nil) {
        UIButton *leftButton = [[UIButton alloc] init];
        leftButton.userInteractionEnabled = NO;
        [self addSubview:leftButton];
        _leftButton = leftButton;
    }
    return _leftButton;
}

- (UIButton *)rightButton
{
    if(_rightButton == nil) {
        UIButton *rightButton = [[UIButton alloc] init];
        rightButton.userInteractionEnabled = YES;
        [self addSubview:rightButton];
        _rightButton = rightButton;
    }
    return _rightButton;
}
@end
