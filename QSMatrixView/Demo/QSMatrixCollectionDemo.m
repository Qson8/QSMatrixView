//
//  QSMatrixCollectionDemo.m
//  QSMatrixView
//
//  Created by Qson on 2018/7/10.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "QSMatrixCollectionDemo.h"
#import "UIImage+MV.h"
#import "UIColor+MV.h"

@interface QSMatrixCollectionDemo () <QSMatrixCollectionViewDelegate>
@property (nonatomic, strong) NSMutableArray *cells;
@end

@implementation QSMatrixCollectionDemo
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor whiteColor];
    _cells = [NSMutableArray array];
    [self setupCells];
    [self.tableView reloadData];
}

- (NSArray *)items {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"resources.plist" ofType:nil];
    NSDictionary *data = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *array = data[@"tool"];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        QSMatrixCollectionItem *item = [[QSMatrixCollectionItem alloc] init];
        item._id = dict[@"id"];
        item.title = dict[@"title"];
        item.photo = dict[@"photo"];
        item.cateid = dict[@"cateid"];
        item.placeholderImage = [UIImage imageWithImageName:@"sh_qt"];
        
        [arrayM addObject:item];
    }
    
    return arrayM;
}

- (QSMatrixUIItem *)UIItem {
    QSMatrixUIItem *item = [[QSMatrixUIItem alloc] init];
    item.minimumLineSpacing = 1;
    item.minimumInteritemSpacing = 1;
    item.titleColor = QSColorFromRGB(0x333333);
    item.titleFont = [UIFont systemFontOfSize:12];
    item.itemMarginEdge = UIEdgeInsetsMake(35, 0, 14, 0);
    item.itemMiddleMargin = 11;
    item.itemImageSize = CGSizeMake(32, 32);
    item.itemWidth = ((kScreenWidth - (4 - 1) * 1.0) / 4);
    item.itemHeight = (35) + 32 + 11 + item.titleFont.lineHeight + 14;
    
    item.collectionViewBotlineHeight = 1;
    item.collectionViewToplineHeight = 1;
    
    item.contentWidth = kScreenWidth;
    
    return item;
}

- (QSMatrixHeaderAndFooterItem *)headerItem {
    
    QSSupportButtonItem *leftItem = [[QSSupportButtonItem alloc] init];
    leftItem.title = @"实用工具";
    leftItem.titleColor = QSColorFromRGB(0x333333);
    leftItem.titleFont = [UIFont systemFontOfSize:16];
    leftItem.marginEdge = UIEdgeInsetsMake(0, 12, 0, 0);
    
    QSSupportButtonItem *rightItem = [[QSSupportButtonItem alloc] init];
    rightItem.title = @"更多服务请点这里 >";
    rightItem.titleColor = QSColorFromRGB(0xA0A0A0);
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
    return nil;
}

- (UITableViewCell *)matrixCollectionViewCell {
    
    QSMatrixCollectionView *collectionView = [[QSMatrixCollectionView alloc] init];
    collectionView.frame = CGRectMake(0, 0, kScreenWidth, 0);
    collectionView.backgroundColor = [UIColor colorWithHexValue:0xdfdfdf alpha:0.3];
    collectionView.delegate = self;
    
    [collectionView setDataItems:[self items]
                          UIItem:[self UIItem]
                      headerItem:[self headerItem]
                      footerItem:[self footerItem]];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.contentView addSubview:collectionView];
    cell.height = collectionView.height;
    cell.width = kScreenWidth;
    
    return cell;
}

- (void)setupCells {
    
    UITableViewCell *cell = [self matrixCollectionViewCell];
    
    [self.cells addObject:cell];
}

#pragma mark - 事件
- (void)headerActionDidClick {
    NSLog(@"%s",__func__);
}

#pragma mark - <QSMatrixCollectionViewDelegate>
- (void)matrixView:(QSMatrixCollectionView *)matrixView didSelectItem:(QSMatrixCollectionItem *)item {
    NSLog(@"%s -- %@",__func__,item.title);
}

#pragma mark - UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cells[indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (UITableViewCell *)self.cells[indexPath.row];
    return cell.height;
}

@end
