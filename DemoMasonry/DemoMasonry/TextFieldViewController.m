//
//  TextFieldViewController.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "TextFieldViewController.h"

@implementation TextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"textfield";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 视图

- (void)setUI
{

    
}


- (void)keyboardWillChangeFrameNotification:(NSNotification *)notification
{
    // 获取键盘基本信息（动画时长与键盘高度）
    NSDictionary *userInfo = [notification userInfo];
    CGRect rect =
    [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    CGFloat keyboardHeight = CGRectGetHeight(rect);
    CGFloat keyboardDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 修改下边距约束
//    [_textField mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(-keyboardHeight); }];
    
    // 更新约束
    
    [UIView animateWithDuration:keyboardDuration animations:^{
        [self.view layoutIfNeeded]; }];
}

@end
