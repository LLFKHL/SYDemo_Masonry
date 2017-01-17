//
//  TableViewCell.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/27.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "TableViewCell.h"

static CGFloat const originXY = 10.0;
static CGFloat const heightTitle = 30.0;
static CGFloat const sizeImage = 80.0;

@interface TableViewCell ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIImageView *iconImageView;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setUI];
    }
    
    return self;
}

#pragma mark - 视图

- (void)setUI
{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(WidthScreen);
    }];
    
    self.contentView.backgroundColor = [UIColor purpleColor];
    
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(originXY);
        make.left.mas_equalTo(originXY);
        make.right.mas_equalTo(-originXY);
        make.height.mas_equalTo(heightTitle);
    }];
    self.titleLabel.backgroundColor = [UIColor orangeColor];
    self.titleLabel.numberOfLines = 1;
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.textColor = [UIColor blackColor];
    
    UIView *currentView = self.titleLabel;
    
    self.detailLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.detailLabel];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.mas_bottom).offset(originXY);
        make.left.mas_equalTo(originXY);
        make.right.mas_equalTo(-originXY);

        // 根据实际情况计算高度
    }];
    self.detailLabel.font = [UIFont systemFontOfSize:12.0];
    self.detailLabel.backgroundColor = [UIColor redColor];
    self.detailLabel.textColor = [UIColor yellowColor];
    self.detailLabel.textAlignment = NSTextAlignmentLeft;
    // 多行设置
    self.detailLabel.numberOfLines = 0;
    self.detailLabel.preferredMaxLayoutWidth = (WidthScreen - originXY * 2);
    [self.detailLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    currentView = self.detailLabel;
    
    // 图标
    self.iconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(originXY);
        
        // 根据实际情况计算top，高
    }];
    self.iconImageView.backgroundColor = [UIColor greenColor];
}

#pragma mark - setter

- (void)setModel:(TableViewModel *)model
{
    if (model)
    {
        NSString *title = model.title;
        self.titleLabel.text = title;
        
        NSString *content = model.content;
        self.detailLabel.text = content;

        NSString *name = model.imageName;
        if (name && 0 != name.length)
        {
            UIImage *image = [UIImage imageNamed:name];
            self.iconImageView.image = image;
        }
        
        // 特别注意：如果设置了计算得出的高度约束，可能会造成文本显示不全的情况
//        CGFloat heightText = [[self class] heightTextWithText:content];
//        [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(heightText);
//        }];
        [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.detailLabel.mas_bottom).offset(originXY);
            make.size.mas_equalTo((name && 0 != name.length) ? CGSizeMake(sizeImage, sizeImage) : CGSizeZero);
        }];        
        [self layoutIfNeeded];
    }
}

+ (CGFloat)heightTableCellWithModel:(TableViewModel *)model
{
    // 初化高度
    CGFloat height = originXY + heightTitle;
    
    // 计算高度
    NSString *text = model.content;
    CGFloat heightText = [[self class] heightTextWithText:text];
    height += (originXY + heightText);
    
    // 图片
    NSString *image = model.imageName;
    if (image && 0 != image.length)
    {
        height += (originXY + sizeImage);
    }
    
    height += originXY;
    NSLog(@"heightTableCell = %f, heightText = %f", height, heightText);
    
    return height;
}

+ (CGFloat)heightTextWithText:(NSString *)text
{
    // 计算高度
    CGSize size = [text boundingRectWithSize:CGSizeMake((WidthScreen - 2 * originXY), MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0]} context:nil].size;
    CGFloat heightText = size.height;
    
    return heightText;
}


@end





