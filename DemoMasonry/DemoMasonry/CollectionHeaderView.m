//
//  CollectionHeaderView.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 17/1/17.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "CollectionHeaderView.h"

@implementation CollectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor greenColor];
        
        [self setUI];
    }
    
    return self;
}

#pragma mark - 视图

- (void)setUI
{
    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.mas_equalTo(0);
        make.left.mas_equalTo(10.0);
        make.right.mas_equalTo(-10.0);
    }];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.textColor = [UIColor redColor];
}

@end
