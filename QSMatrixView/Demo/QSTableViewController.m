//
//  QSTableViewController.m
//  QSMatrixView
//
//  Created by Qson on 2018/7/10.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "QSTableViewController.h"
#import "QSMatrixCollectionDemo.h"
#import "QSMatrixCollectionDemo1.h"
#import "QSMatrixCollectionDemo2.h"
#import "QSMatrixCollectionDemo3.h"
#import "QSMatrixView.h"

@interface QSTableViewController ()

@end

@implementation QSTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"QSMatrixCollectionDemo";
    
    self.tableView.backgroundColor = QSColor(239, 239, 239, 1);
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    self.dataArray = @[@{@"title":@"QSMatrixCollectionDemo1"},
                       @{@"title":@"QSMatrixCollectionDemo2"},
                       @{@"title":@"QSMatrixCollectionDemo3"},
                       @{@"title":@"QSMatrixCollectionDemo4"}];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tableView.frame = self.view.bounds;
}

#pragma mark - 内部实现
- (void)pushQSMatrixCollectionDemo1
{
    QSMatrixCollectionDemo *vc = [[QSMatrixCollectionDemo alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushQSMatrixCollectionDemo2
{
    QSMatrixCollectionDemo1 *vc = [[QSMatrixCollectionDemo1 alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushQSMatrixCollectionDemo3
{
    QSMatrixCollectionDemo2 *vc = [[QSMatrixCollectionDemo2 alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pushQSMatrixCollectionDemo4
{
    QSMatrixCollectionDemo3 *vc = [[QSMatrixCollectionDemo3 alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self pushQSMatrixCollectionDemo3];
            break;
        case 1:
            [self pushQSMatrixCollectionDemo1];
            break;
        case 2:
            [self pushQSMatrixCollectionDemo2];
            break;
        case 3:
            [self pushQSMatrixCollectionDemo4];
            break;
        default:
            break;
    }
}

@end
