//
//  ViewViewController.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ViewViewController.h"

@implementation ViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"view";
    
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
    
    // 横向居中，大小50 * 50
    UIView *centerXView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:centerXView];
    centerXView.backgroundColor = [UIColor grayColor];
    
//    [centerXView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
//        make.top.mas_equalTo(10.0);
//        make.size.mas_equalTo(CGSizeMake(50.0, 50.0));
//    }];
    // 或（定义宏，可省略mas_。且定义宏一定要在引入Masonry.h文件之前)
    [centerXView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(10.0);
        make.size.mas_equalTo(CGSizeMake(50.0, 50.0));
    }];
    
    
    
    
    
    currentView = centerXView;
    
    
    
    
    // 让2个高度为50的view等宽且等间隔排列，间隔为10(自动计算其宽度)
    UIView *view100 = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:view100];
    view100.backgroundColor = [UIColor greenColor];
    
    UIView *view101 = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:view101];
    view101.backgroundColor = [UIColor blueColor];

    CGFloat paddingView = 10.0;
    [view100 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.mas_bottom).offset(10.0);
        make.left.equalTo(self.view.mas_left).with.offset(paddingView);
        make.right.equalTo(view101.mas_left).with.offset(-paddingView);
        make.height.mas_equalTo(50.0);
        make.width.equalTo(view101);
    }];
    [view101 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view100.mas_top);
        make.left.equalTo(view100.mas_right).with.offset(paddingView);
        make.right.equalTo(self.view.mas_right).with.offset(-paddingView);
        make.height.mas_equalTo(50.0);
        make.width.equalTo(view100);
    }];

    
    
    
    
    currentView = view100;
    
    
    
    
    
    
    // 随尺寸变化
    UIView *scaleView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:scaleView];
    scaleView.backgroundColor = [UIColor blueColor];

    [scaleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.mas_bottom).offset(10.0);
        make.left.equalTo(self.view.mas_left).with.offset(10.0);
        make.right.equalTo(view101.mas_left).with.offset(-10.0);
        make.width.mas_equalTo(50.0);
        make.height.mas_equalTo(self.view.mas_width).multipliedBy(0.5);
    }];
    
    
    
    
    
    // 屏幕居中，大小300 * 50
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:centerView];
    centerView.backgroundColor = [UIColor blackColor];
    
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300.0, 50.0));
    }];
    
    
    
}

@end
