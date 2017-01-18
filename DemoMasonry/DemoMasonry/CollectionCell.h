//
//  CollectionCell.h
//  DemoMasonry
//
//  Created by zhangshaoyu on 17/1/17.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionModel.h"

static NSString *identifierCollectionCell = @"CollectionCell";

#define widthCollectionCell ((WidthScreen - 10.0 * 3) / 2)
static CGFloat const heightCollectionCell = 90.0;

@interface CollectionCell : UICollectionViewCell

@property (nonatomic, strong) CollectionModel *model;

@end
