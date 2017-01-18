//
//  CollectionCell.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 17/1/17.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "CollectionCell.h"

static CGFloat const originXY = 10.0;
static CGFloat const heightImage = (60.0 - originXY);
static CGFloat const heightLabel = 20.0;

@interface CollectionCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation CollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor redColor].CGColor;
        
        [self setUI];
    }
    
    return self;
}

#pragma mark - 视图

- (void)setUI
{
    // 60.0 + 10.0 + 20.0
    self.iconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(originXY);
        make.right.mas_equalTo(-originXY);
        make.height.mas_equalTo(heightImage);
    }];
    self.iconImageView.backgroundColor = [UIColor blueColor];
    self.iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    UIView *currentView = self.iconImageView;
    
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.mas_bottom).offset(originXY);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(widthCollectionCell);
        make.height.mas_equalTo(heightLabel);
    }];
    self.titleLabel.backgroundColor = [UIColor yellowColor];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

#pragma mark - setter

- (void)setModel:(CollectionModel *)model
{
    _model = model;
    if (_model)
    {
        NSString *name = _model.imageName;
        UIImage *image = [UIImage imageNamed:name];
        self.iconImageView.image = image;
        
        NSString *title = _model.title;
        self.titleLabel.text = title;
    }
}

@end
