//
//  ScrollViewViewController.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ScrollViewViewController.h"

@implementation ScrollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"scrollview";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 视图

- (void)setUI
{
    CGFloat height = (self.view.frame.size.height - 10.0 * 3) / 2;
    
    // 垂直方向的滚动视图
    UIScrollView *verticalScrollView = [[UIScrollView alloc] init];
    verticalScrollView.backgroundColor = [UIColor greenColor];
    verticalScrollView.pagingEnabled = YES;
    // 添加scrollView添加到父视图，并设置其约束
    [self.view addSubview:verticalScrollView];
    [verticalScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10.0);
        make.height.mas_equalTo(height);
    }];
    // 设置scrollView的子视图，即过渡视图contentSize，并设置其约束
    UIView *verticalContainerView = [[UIView alloc] init];
    [verticalScrollView addSubview:verticalContainerView];
    [verticalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.and.right.equalTo(verticalScrollView).with.insets(UIEdgeInsetsZero);
        make.width.equalTo(verticalScrollView);
    }];
    // 过渡视图添加子视图
    UIView *lastView = nil;
    for (NSInteger index = 0; index < 10; index++)
    {
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 2;
        label.backgroundColor = RandomColor;
        label.text = [NSString stringWithFormat:@"垂直方向\n第 %ld 个视图", (index + 1)];
        
        // 添加到父视图，并设置过渡视图中子视图的约束
        [verticalContainerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(verticalContainerView);
            make.height.mas_equalTo(verticalScrollView.mas_height);
            
            if (lastView)
            {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else
            {
                make.top.mas_equalTo(0);
            }
        }];
        
        lastView = label;
    }
    
    // 设置过渡视图的底边距（此设置将影响到scrollView的contentSize）
    [verticalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);  
    }];
    
    
    UIView *currentView = verticalScrollView;
    
    // 水平方向滚动视图
    UIScrollView *horizontalScrollView = [[UIScrollView alloc] init];
    horizontalScrollView.backgroundColor = [UIColor orangeColor];
    horizontalScrollView.pagingEnabled = YES;
    // 添加scrollView添加到父视图，并设置其约束
    [self.view addSubview:horizontalScrollView];
    [horizontalScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-10);
    }];
    // 设置scrollView的子视图，即过渡视图contentSize，并设置其约束
    UIView *horizontalContainerView = [[UIView alloc] init];
    [horizontalScrollView addSubview:horizontalContainerView];
    [horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(horizontalScrollView);
        make.height.equalTo(horizontalScrollView);
    }];
    //过渡视图添加子视图
    UIView *previousView = nil;
    for (int i = 0; i < 10; i++)
    {
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 2;
        label.backgroundColor = RandomColor;
        label.text = [NSString stringWithFormat:@"水平方向\n第 %d 个视图", (i + 1)];
        
        // 添加到父视图，并设置过渡视图中子视图的约束
        [horizontalContainerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.equalTo(horizontalContainerView);
            make.width.equalTo(horizontalScrollView);
            
            if (previousView)
            {
                make.left.mas_equalTo(previousView.mas_right);
            }
            else
            {
                make.left.mas_equalTo(0);
            }
        }];
        
        previousView = label;
    }
    // 设置过渡视图的右距（此设置将影响到scrollView的contentSize）
    [horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(previousView.mas_right);  
    }];
}



@end
