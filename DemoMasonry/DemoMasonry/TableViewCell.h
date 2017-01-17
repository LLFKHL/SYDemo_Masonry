//
//  TableViewCell.h
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/27.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewModel.h"

static NSString *const identifierTableViewCell = @"TableViewCell";
static CGFloat const heightTableViewCell = (10.0 + 30.0 + 10.0 + 30.0 + 10.0 + 80.0 + 10.0);

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) TableViewModel *model;

+ (CGFloat)heightTableCellWithModel:(TableViewModel *)model;

@end



