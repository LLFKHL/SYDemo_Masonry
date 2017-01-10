//
//  TableViewCell.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/27.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "TableViewCell.h"

#define kLabelHorizontalInsets      15.0f
#define kLabelVerticalInsets        10.0f


// 方法1

/*
@interface TableViewCell ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *detailLabel;

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

- (void)setUI
{
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(WidthScreen);
    }];
    
    self.contentView.backgroundColor = [UIColor purpleColor];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.label];
    self.label.backgroundColor = [UIColor orangeColor];
    self.label.preferredMaxLayoutWidth = (WidthScreen - 10.0 * 2);
    [self.label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    self.label.numberOfLines = 0;
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10.0);
        make.right.mas_equalTo(-10.0);
        make.top.mas_equalTo(10.0);
    }];
    
    self.detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.detailLabel];
    self.detailLabel.backgroundColor = [UIColor redColor];
    self.detailLabel.textColor = [UIColor yellowColor];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.label.mas_bottom).offset(5);
        make.left.and.right.equalTo(self.label);
    }];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

//- (void)setText:(NSString *)text
//{
//    _text = text;
//    self.label.text = _text;
//}
//
//- (void)setDetailText:(NSString *)detailText
//{
//    _detailText = detailText;
//    self.detailLabel.text = _detailText;
//}

- (void)setModel:(TableViewModel *)model
{
    if (model)
    {
        NSString *title = model.title;
        self.label.text = title;
        
        NSString *content = model.text;
        self.detailLabel.text = content;
        
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
        
//        self.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}

- (CGFloat)heightTableCell
{
//    [self.contentView layoutIfNeeded];
//    [self.contentView updateConstraintsIfNeeded];
    
//    [self setNeedsUpdateConstraints];
//    [self updateConstraintsIfNeeded];
//    [self setNeedsLayout];
//    [self layoutIfNeeded];
    
    CGSize size = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    CGFloat height = size.height + 1.0;
    
    NSLog(@"heightTableCell height = %f", height);
    
    return height;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints)
    {
        // 用masonry布局
        __weak typeof(self) weakSelf = self;
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView.top).offset(10);
            make.left.equalTo(weakSelf.contentView.left).offset(10);
            make.right.equalTo(weakSelf.contentView.right).offset(-10);
        }];
        
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.label.bottom).offset(5);
            make.left.equalTo(weakSelf.contentView.left).offset(10);
            make.right.equalTo(weakSelf.contentView.right).offset(-10);
            make.bottom.equalTo(weakSelf.contentView.bottom).offset(-10);
        }];
        
        self.didSetupConstraints = YES;
    }
    
    //[super updateConstraints];必须最后调用
    [super updateConstraints];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
}
 
@end
 
*/


// 方法2


@interface TableViewCell ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.1];
        self.contentView.bounds = CGRectMake(0.0f, 0.0f, 99999.0f, 99999.0f);//解决Autolayout错误警告
        
        self.titleLabel = [UILabel new];
        [self.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.titleLabel setNumberOfLines:1];
        [self.titleLabel setTextAlignment:NSTextAlignmentLeft];
        [self.titleLabel setTextColor:[UIColor blackColor]];
        self.titleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.1];
        
        self.bodyLabel = [UILabel new];
        [self.bodyLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.bodyLabel setNumberOfLines:0];
        [self.bodyLabel setTextAlignment:NSTextAlignmentLeft];
        [self.bodyLabel setTextColor:[UIColor darkGrayColor]];
        self.bodyLabel.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.1];
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.bodyLabel];
        
        [self updateFonts];
    }
    
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        //用masonry布局
        __weak typeof(self) weakSelf = self;
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView.top).offset(kLabelVerticalInsets);
            make.left.equalTo(weakSelf.contentView.left).offset(kLabelHorizontalInsets);
            make.right.equalTo(weakSelf.contentView.right).offset(-kLabelHorizontalInsets);
        }];
        
        [self.bodyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.titleLabel.bottom).offset(kLabelVerticalInsets);
            make.left.equalTo(weakSelf.contentView.left).offset(kLabelHorizontalInsets);
            make.right.equalTo(weakSelf.contentView.right).offset(-kLabelHorizontalInsets);
            make.bottom.equalTo(weakSelf.contentView.bottom).offset(-kLabelVerticalInsets);
        }];
        
        self.didSetupConstraints = YES;
    }
    //[super updateConstraints];必须最后调用
    [super updateConstraints];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    self.bodyLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.bodyLabel.frame);
}

- (void)updateFonts
{
//    self.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
//    self.bodyLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
}

@end



// 方法3

/*
@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.headImgView = [[UIImageView alloc]init];
        self.headImgView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.headImgView];
        //
        [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(10);
            make.left.equalTo(self.contentView.mas_left).with.offset(10);
            make.width.equalTo(50);
            make.height.equalTo(50);
        }];
        
        self.contentLabel = [[UILabel alloc]init];
        self.contentLabel.backgroundColor = [UIColor greenColor];
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
        self.contentLabel.font = [UIFont systemFontOfSize:16.0];
        [self.contentView addSubview:self.contentLabel];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(10);
            make.left.equalTo(self.headImgView.mas_right).with.offset(10);
            make.right.equalTo(self.contentView.mas_right).with.offset(-10);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-10);
        }];
        
        UILabel *line = [[UILabel alloc]init];
        line.backgroundColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1.0];
        [self.contentView addSubview:line];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(0);
            make.right.equalTo(self.contentView.mas_right).with.offset(0);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0.5);
            make.height.equalTo(0.5);
        }];
        
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    self.contentLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.contentLabel.frame);
    //
}

- (void)updateConstraints {
    if (!self.didSetupConstraints) {
        
        [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(10);
            make.left.equalTo(self.contentView.mas_left).with.offset(10);
            make.width.equalTo(50);
            make.height.equalTo(50);
        }];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(10);
            make.left.equalTo(self.headImgView.mas_right).with.offset(10);
            make.right.equalTo(self.contentView.mas_right).with.offset(-10);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-10);
        }];
        
        self.didSetupConstraints = YES;
    }
    [super updateConstraints];
}

- (void)initModel:(NSString *)str {
    self.contentLabel.text = str;
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
*/



// 方法4

/*
@interface TableViewCell ()

//@property (strong, nonatomic) UILabel *titleLabel;
//@property (strong, nonatomic) UILabel *bodyLabel;
//- (void)updateFonts;

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.1];
        self.contentView.bounds = CGRectMake(0.0f, 0.0f, 99999.0f, 99999.0f); //解决Autolayout错误警告
        
        self.titleLabel = [UILabel new];
        [self.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.titleLabel setNumberOfLines:1];
        [self.titleLabel setTextAlignment:NSTextAlignmentLeft];
        [self.titleLabel setTextColor:[UIColor blackColor]];
        self.titleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.1];
        
        self.bodyLabel = [UILabel new];
        [self.bodyLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.bodyLabel setNumberOfLines:0];
        [self.bodyLabel setTextAlignment:NSTextAlignmentLeft];
        [self.bodyLabel setTextColor:[UIColor darkGrayColor]];
        self.bodyLabel.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.1];
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.bodyLabel];
        
        [self updateFonts];
    }
    
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints)
    {
        // 用masonry布局
        __weak typeof(self) weakSelf = self;
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView.top).offset(kLabelVerticalInsets);
            make.left.equalTo(weakSelf.contentView.left).offset(kLabelHorizontalInsets);
            make.right.equalTo(weakSelf.contentView.right).offset(-kLabelHorizontalInsets);
        }];
        
        [self.bodyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.titleLabel.bottom).offset(kLabelVerticalInsets);
            make.left.equalTo(weakSelf.contentView.left).offset(kLabelHorizontalInsets);
            make.right.equalTo(weakSelf.contentView.right).offset(-kLabelHorizontalInsets);
            make.bottom.equalTo(weakSelf.contentView.bottom).offset(-kLabelVerticalInsets);
        }];
        
        self.didSetupConstraints = YES;
    }
    
    // [super updateConstraints];必须最后调用
    [super updateConstraints];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    self.bodyLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.bodyLabel.frame);
}

- (void)updateFonts
{
//    self.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
//    self.bodyLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
}

- (void)setModel:(TableViewModel *)model
{
    if (model)
    {
        [self updateFonts];
        
        self.titleLabel.text =  model.title;
        self.bodyLabel.text = model.text;
        
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
}

- (CGFloat)heightTableViewCell:(TableViewModel *)model;
{
    self.model = model;
    
    self.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight(self.bounds));
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGFloat height = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    height += 1;
    
    return height;
}

@end
 
*/



