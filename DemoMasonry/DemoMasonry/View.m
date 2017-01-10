//
//  View.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/30.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "View.h"

static CGFloat const padding = 10.0;

@interface View ()

@property (nonatomic, strong) UIImageView *imageview;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation View

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setUI];
    }
    
    return self;
}

- (void)setUI
{
    self.imageview = [[UIImageView alloc] init];
    [self addSubview:self.imageview];
    self.imageview.backgroundColor = [UIColor greenColor];
    [self.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(padding);
        make.size.equalTo(CGSizeMake(60.0, 60.0));
    }];
    
    self.textLabel = [UILabel new];
    [self addSubview:self.textLabel];
    self.textLabel.backgroundColor = [UIColor redColor];
    self.textLabel.numberOfLines = 0;
    self.textLabel.preferredMaxLayoutWidth = 0.0;
    [self.textLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageview.mas_top);
        make.left.mas_equalTo(self.imageview.mas_right).offset(padding);
        make.right.mas_equalTo(-padding);
    }];
    
    self.timeLabel = [UILabel new];
    [self addSubview:self.timeLabel];
    self.timeLabel.backgroundColor = [UIColor orangeColor];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.textLabel.mas_bottom).offset(padding);
        make.left.and.right.equalTo(self.textLabel);
        make.height.mas_equalTo(20);
    }];
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.imageview.image = [UIImage imageNamed:_imageName];
}

- (void)setText:(NSString *)text
{
    _text = text;
    self.textLabel.text = _text;
}

- (void)setTime:(NSString *)time
{
    _time = time;
    self.timeLabel.text = _time;
}

@end
