//
//  TableFooterView.h
//  DemoMasonry
//
//  Created by zhangshaoyu on 17/1/18.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const identifierTableFooter = @"TableFooterView";
static CGFloat const heightTableFooter = 20.0;

@interface TableFooterView : UITableViewHeaderFooterView

@property (nonatomic, strong) UILabel *titleLabel;

@end
