//
//  LabelViewController.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "LabelViewController.h"

@implementation LabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"label";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 视图

- (void)setUI
{
    UIView *currentView = nil;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.view addSubview:label];
    label.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    label.text = @"Masonry是一个轻量级的布局框架与更好的包装AutoLayout语法。";
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        // 方法1
//        make.left.mas_equalTo(10.0);
//        make.right.mas_equalTo(-10.0);
//        make.top.mas_equalTo(10.0);
//        make.height.mas_equalTo(40.0);
        
        // 方法2
        make.top.mas_equalTo(10.0);
        make.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width - 10.0 * 2, 40.0));
        
        
    }];
    
    currentView = label;
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.view addSubview:label2];
    label2.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    label2.text = @"Masonry是一个轻量级的布局框架与更好的包装AutoLayout语法。";
    label2.font = [UIFont systemFontOfSize:15.0];
    label2.numberOfLines = 2;
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10.0);
        make.right.mas_equalTo(-10.0);
        make.top.mas_equalTo(currentView.mas_bottom).offset(10.0);
        make.height.mas_equalTo(40.0);
    }];
    
    currentView = label2;
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.view addSubview:label3];
    label3.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    label3.text = @"Masonry是一个轻量级的布局框架与更好的包装AutoLayout语法。";
    label3.font = [UIFont systemFontOfSize:15.0];
    label3.numberOfLines = 2;
    
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width - 10.0 * 2, 40.0));
        make.left.mas_equalTo(10.0);
        make.top.mas_equalTo(currentView.mas_bottom).offset(10.0);
    }];
    
    currentView = label3;
    
    NSString *text = @"Masonry是一个轻量级的布局框架与更好的包装AutoLayout语法。Masonry有它自己的布局方式，描述NSLayoutConstraints使布局代码更简洁易读。Masonry支持iOS和Mac OS X。Masonry github 地址:https://github.com/SnapKit/Masonry";
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.view addSubview:label4];
    label4.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    label4.text = text;
    // 多行显示时设置
    // 情况1
    label4.preferredMaxLayoutWidth = (WidthScreen - 10.0 * 2);
    [label4 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    label4.numberOfLines = 0;
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10.0);
        make.right.mas_equalTo(-10.0);
        make.top.mas_equalTo(currentView.mas_bottom).offset(10.0);
        
        // 自适应label多行显示时，无需设置label高度
        // make.height.mas_equalTo(40.0);
    }];
    
    // 情况2（不足：可能导致文本显示不全）
//    label4.numberOfLines = 0;
//    CGSize size = [label4.text boundingRectWithSize:CGSizeMake((WidthScreen - 2 * 10.0), MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label4.font} context:nil].size;
//    CGFloat heightText = size.height;
//    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(10.0);
//        make.right.mas_equalTo(-10.0);
//        make.top.mas_equalTo(currentView.mas_bottom).offset(10.0);
//   
//        // 设置实际文本高度约束
//        make.height.mas_equalTo(heightText);
//    }];
    
    /*
     label多行显示处理
     情况1：设置属性后，然后根据文本自动多行显示，无需设置标签高度约束
     1 属性preferredMaxLayoutWidth，如：label.preferredMaxLayoutWidth = (WidthScreen - 10.0 * 2);
     2 方法setContentHuggingPriority:forAxis:，如：[label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
     3 属性numberOfLines，如：label.numberOfLines = 0;
     4 自适应label多行显示时，无需设置label高度，即无需写以下代码：make.height.mas_equalTo(???); 
     
     情况2：设置多行属性，然后计算文本高度，再设置高度约束（不足：可能导致文本显示不全）
     1 属性numberOfLines，如：label.numberOfLines = 0;
     2 计算高度height，如：CGFloat height = [label4.text boundingRectWithSize:CGSizeMake((WidthScreen - 2 * 10.0), MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label4.font} context:nil].size.height;
     3 设置标签高度约束，如：make.height.mas_equalTo(height);
     
     */

    currentView = label4;
    
    NSLog(@"height = %f", currentView.frame.size.height);
    
    
}

@end
