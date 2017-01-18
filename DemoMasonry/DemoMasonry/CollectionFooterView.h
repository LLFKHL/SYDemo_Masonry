//
//  CollectionFooterView.h
//  DemoMasonry
//
//  Created by zhangshaoyu on 17/1/17.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const identifierCollectionFooter = @"CollectionFooterView";
static CGFloat const heightCollectionFooter = 20.0;

@interface CollectionFooterView : UICollectionReusableView

@property (nonatomic, strong) UILabel *titleLabel;

@end
