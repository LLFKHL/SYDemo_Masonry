//
//  AnimationViewController.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 17/1/16.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@property (nonatomic, assign) CGSize sizeScale;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"动画视图";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 视图

- (void)setUI
{
    UIButton *buttonMove = [[UIButton alloc] init];
    [self.view addSubview:buttonMove];
    [buttonMove mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(80.0, 80.0));
    }];
    [buttonMove setTitle:@"移动" forState:UIControlStateNormal];
    [buttonMove setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    buttonMove.backgroundColor = RandomColor;
    [buttonMove addTarget:self action:@selector(buttonMoveClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *buttonScale = [[UIButton alloc] init];
    [self.view addSubview:buttonScale];
    [buttonScale setTitle:@"放大" forState:UIControlStateNormal];
    [buttonScale setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    buttonScale.backgroundColor = RandomColor;
    [buttonScale addTarget:self action:@selector(buttonScaleClick:) forControlEvents:UIControlEventTouchUpInside];
    buttonScale.tag = 1000;
    
    // 方法1 先设置约束
    [self scaleClick1WithUI:buttonScale];
    // 方法2 暂不设置约束
//    [self scaleClick2WithUI];
}

#pragma mark - 响应

- (void)buttonMoveClick:(UIButton *)sender
{
    [self.view bringSubviewToFront:sender];
    
    CGFloat originTop = (arc4random() % ((int)self.view.frame.size.height));
    if (originTop < 10)
    {
        originTop = 10;
    }
    else if (originTop > (self.view.frame.size.height - sender.frame.size.height))
    {
        originTop = (self.view.frame.size.height - sender.frame.size.height);
    }
    
    CGFloat originLeft = (arc4random() % ((int)self.view.frame.size.width));
    if (originLeft < 10)
    {
        originLeft = 10;
    }
    else if (originLeft > (self.view.frame.size.width - sender.frame.size.width))
    {
        originLeft = (self.view.frame.size.width - sender.frame.size.width);
    }
    
    // 修改更新某一个约束
//    [sender mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(originTop);
//        make.left.mas_equalTo(originLeft);
//    }];
    // 或，移除之前的所有约束，重新设置约束
    [sender mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(originTop);
        make.left.mas_equalTo(originLeft);
        make.size.mas_equalTo(CGSizeMake(80.0, 80.0));
    }];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}


BOOL isScaleBig = YES;
- (void)buttonScaleClick:(UIButton *)sender
{
    [self.view bringSubviewToFront:sender];

    // 方法1
    [self scaleClick1:sender];
    
    // 方法2
//    [self scaleClick2:sender];
}

#pragma mark 方法1

- (void)scaleClick1WithUI:(UIButton *)button
{
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(80.0, 80.0));
    }];
}

- (void)scaleClick1:(UIButton *)button
{
    CGSize size = button.frame.size;
    if (size.height >= 160.0)
    {
        isScaleBig = NO;
        [button setTitle:@"缩小" forState:UIControlStateNormal];
    }
    else if (size.height <= 80.0)
    {
        isScaleBig = YES;
        [button setTitle:@"放大" forState:UIControlStateNormal];
    }
    if (isScaleBig)
    {
        size = CGSizeMake(button.frame.size.width * 1.2, button.frame.size.height * 1.2);
    }
    else
    {
        size = CGSizeMake(button.frame.size.width / 1.2, button.frame.size.height / 1.2);
    }
    
    // 仅修改更新某一个约束
//    [sender mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(size);
//    }];
    // 或，清除之前的所有约束，重新设置约束
    [button mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(size);
    }];
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark 方法2

//- (void)scaleClick2WithUI
//{
//    self.sizeScale = CGSizeMake(80.0, 80.0);
//}
//
//- (void)updateViewConstraints
//{
//    UIButton *button = (UIButton *)[self.view viewWithTag:1000];
//    [button mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.size.mas_equalTo(self.sizeScale);
//    }];
//    
//    [super updateViewConstraints];
//}
//
//- (void)scaleClick2:(UIButton *)button
//{
//    if (self.sizeScale.height >= 160.0)
//    {
//        isScaleBig = NO;
//        [button setTitle:@"缩小" forState:UIControlStateNormal];
//    }
//    else if (self.sizeScale.height <= 80.0)
//    {
//        isScaleBig = YES;
//        [button setTitle:@"放大" forState:UIControlStateNormal];
//    }
//    if (isScaleBig)
//    {
//        self.sizeScale = CGSizeMake(self.sizeScale.width * 1.2, self.sizeScale.height * 1.2);
//    }
//    else
//    {
//        self.sizeScale = CGSizeMake(self.sizeScale.width / 1.2, self.sizeScale.height / 1.2);
//    }
//    
//    [self.view setNeedsUpdateConstraints];
//    [UIView animateWithDuration:0.3 animations:^{
//        [self.view layoutIfNeeded];
//    }];
//}

@end
