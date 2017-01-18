//
//  CollectionHeaderView.h
//  DemoMasonry
//
//  Created by zhangshaoyu on 17/1/17.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const identifierCollectionHeader = @"CollectionHeaderView";
static CGFloat const heightCollectionHeader = 40.0;

@interface CollectionHeaderView : UICollectionReusableView

@property (nonatomic, strong) UILabel *titleLabel;

@end
