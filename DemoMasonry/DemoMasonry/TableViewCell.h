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


// 方法1

/*
 
@interface TableViewCell : UITableViewCell


//@property (nonatomic, strong) NSString *text;
//@property (nonatomic, strong) NSString *detailText;
@property (nonatomic, strong) TableViewModel *model;

- (CGFloat)heightTableCell;

@end
*/


// 方法2


@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *bodyLabel;

- (void)updateFonts;

@end



// 方法3

/*
@interface TableViewCell : UITableViewCell

@property (nonatomic, retain) UIImageView *headImgView;
@property (nonatomic, retain) UILabel *contentLabel;
@property (nonatomic, assign) BOOL didSetupConstraints;

- (void)initModel:(NSString *)str;

@end
*/


// 方法4

/*
@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *bodyLabel;
- (void)updateFonts;

//@property (nonatomic, strong) TableViewModel *model;
//
//- (CGFloat)heightTableViewCell:(TableViewModel *)model;

@end
*/

