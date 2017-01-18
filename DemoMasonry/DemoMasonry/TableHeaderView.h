//
//  TableHeaderView.h
//  DemoMasonry
//
//  Created by zhangshaoyu on 17/1/18.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const identifierTableHeader = @"TableHeaderView";
static CGFloat const heightTableHeader = 40.0;

@interface TableHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) UILabel *titleLabel;

@end
