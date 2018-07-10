//
//  QSMatrixCollectionItem.m
//  QSMatrixView
//
//  Created by Qson on 2018/7/9.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import "QSMatrixCollectionItem.h"

@implementation QSMatrixCollectionItem
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)itemWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
}
@end



@implementation QSMatrixUIItem
-(CGSize)itemSize
{
    return CGSizeMake(_itemWidth, _itemHeight);
}

@end
