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
        make.height.mas_equalTo(30.0);
    }];
    label.text = @"progress";
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
    
    currentView = progressview;
    
    UILabel *label2 = [[UILabel alloc] init];
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(30.0);
    }];
    label2.text = @"activityview";
    label2.textColor = RandomColor;
    
    currentView = label2;
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] init];
    [self.view addSubview:activityView];
    activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    activityView.hidesWhenStopped = YES;
    activityView.color = RandomColor;
    [activityView stopAnimating];
    activityView.tag = 1000;
}

//@"progress;activityview;pickerview;alertview;sliderview;searchbar;switchview;segmentview"

@end
