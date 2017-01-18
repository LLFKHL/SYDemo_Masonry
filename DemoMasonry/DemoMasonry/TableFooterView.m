//
//  TableFooterView.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 17/1/18.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "TableFooterView.h"

@implementation TableFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.backgroundColor = [UIColor brownColor];
        
        [self setUI];
    }
    
    return self;
}

#pragma mark - 视图

- (void)setUI
{
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor purpleColor];
}

@end
