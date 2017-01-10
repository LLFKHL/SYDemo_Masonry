//
//  ImageViewViewController.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ImageViewViewController.h"

@implementation ImageViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"imageview";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 视图

- (void)setUI
{
    UIImageView *imageview = [[UIImageView alloc] init];
    [self.view addSubview:imageview];
    imageview.backgroundColor = RandomColor;
    imageview.image = [UIImage imageNamed:@"miao.jpeg"];
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(80.0, 80.0));
    }];
    
    
    UIView *currentView = imageview;
    
    UIImageView *imageview2 = [[UIImageView alloc] init];
    [self.view addSubview:imageview2];
    imageview2.backgroundColor = RandomColor;
    imageview2.image = [UIImage imageNamed:@"futou"];
    [imageview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(currentView);
        make.left.mas_equalTo(currentView.right).offset(10);
        make.size.equalTo(currentView);
    }];
    
    
    currentView = imageview2;
    
    
    UIImageView *imageview3 = [[UIImageView alloc] init];
    [self.view addSubview:imageview3];
    imageview3.backgroundColor = RandomColor;
    imageview3.image = [UIImage imageNamed:@"tianshi"];
    [imageview3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(currentView);
        make.center.equalTo(self.view);
    }];
}

@end
