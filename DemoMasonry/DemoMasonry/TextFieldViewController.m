//
//  TextFieldViewController.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "TextFieldViewController.h"

@interface TextFieldViewController () <UITextFieldDelegate>

@end

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
    UITextField *textfield = [[UITextField alloc] init];
    [self.view addSubview:textfield];
    [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
    textfield.layer.borderColor = RandomColor.CGColor;
    textfield.layer.borderWidth = 1.0;
    textfield.textColor = [UIColor blackColor];
    textfield.delegate = self;
    textfield.returnKeyType = UIReturnKeyDone;
    textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
