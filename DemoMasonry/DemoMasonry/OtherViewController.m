//
//  ProgressViewController.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "OtherViewController.h"

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"其他视图";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 视图

- (void)setUI
{
    UILabel *label = [[UILabel alloc] init];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
    label.text = @"progress;activityview;pickerview;alertview;sliderview;searchbar;switchview;segmentview";
    label.textColor = RandomColor;
    
    
    UIView *currentView = label;
    
    
    UIProgressView *progressview = [[UIProgressView alloc] init];
    progressview.trackTintColor = [UIColor yellowColor];
    progressview.tintColor = [UIColor redColor];
    progressview.progress = 0.6;
    
    [self.view addSubview:progressview];
    [progressview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(10);
    }];
}

@end
