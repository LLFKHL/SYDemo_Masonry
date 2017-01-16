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
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.view addSubview:label4];
    label4.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    label4.text = @"Masonry是一个轻量级的布局框架与更好的包装AutoLayout语法。Masonry有它自己的布局方式，描述NSLayoutConstraints使布局代码更简洁易读。Masonry支持iOS和Mac OS X。Masonry github 地址:https://github.com/SnapKit/Masonry";
    // 多行显示时设置
    label4.preferredMaxLayoutWidth = (WidthScreen - 10.0 * 2);
    [label4 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    label4.numberOfLines = 0;
    
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10.0);
        make.right.mas_equalTo(-10.0);
        make.top.mas_equalTo(currentView.mas_bottom).offset(10.0);
//        make.height.mas_equalTo(40.0); // 自适应label多行显示时，无需设置label高度
    }];
    
    /*
     label多行显示处理
     1 label4.preferredMaxLayoutWidth = (WidthScreen - 10.0 * 2);
     2 [label4 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
     3 label4.numberOfLines = 0;
     4 make.height.mas_equalTo(???); // 自适应label多行显示时，无需设置label高度
    */

    currentView = label4;
    
    
    NSLog(@"height = %@", currentView.mas_height);
    
    
}

@end
