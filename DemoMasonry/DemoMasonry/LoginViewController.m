//
//  PublicViewController.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/27.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"login登录";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 视图

- (void)setUI
{
    // 头像
    UIImageView *headerImageView = [[UIImageView alloc] init];
    [self.view addSubview:headerImageView];
    [headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30.0);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(90.0, 90.0));
    }];
    headerImageView.layer.cornerRadius = 45.0;
    headerImageView.layer.masksToBounds = YES;
    headerImageView.clipsToBounds = YES;
    headerImageView.backgroundColor = RandomColor;
    headerImageView.image = [UIImage imageNamed:@"futou"];

    // 视图变量，用于传递上一个视图的尺寸坐标
    UIView *currentView = headerImageView;
    
    // 昵称
    UILabel *nameLabel = [[UILabel alloc] init];
    [self.view addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(20);
    }];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.text = @"devZhang 135***000";
    nameLabel.font = [UIFont systemFontOfSize:15.0];
    
    currentView = nameLabel;
    
    // 分割线
    UIView *lineView = [[UIView alloc] init];
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.mas_bottom).offset(10);
        make.left.mas_equalTo(currentView.left);
        make.width.equalTo(currentView);
        make.height.mas_equalTo(@1);
    }];
    lineView.backgroundColor = [UIColor grayColor];
    
    currentView = lineView;
    
    // 帐号
    UITextField *nameTextField = [[UITextField alloc] init];
    [self.view addSubview:nameTextField];
    [nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(currentView.mas_bottom).with.offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
    nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    nameTextField.placeholder = @"请输入登录帐号";
    nameTextField.textColor = [UIColor blackColor];
    nameTextField.font = [UIFont systemFontOfSize:12.0];
    nameTextField.layer.cornerRadius = 5.0;
    nameTextField.layer.masksToBounds = YES;
    nameTextField.layer.borderColor = RandomColor.CGColor;
    nameTextField.layer.borderWidth = 1.0;
    nameTextField.delegate = self;
    
    currentView = nameTextField;
    
    // 密码
    UITextField *passwordTextField = [[UITextField alloc] init];
    [self.view addSubview:passwordTextField];
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(currentView.mas_bottom).with.offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
    passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordTextField.placeholder = @"请输入登录密码";
    passwordTextField.textColor = [UIColor blackColor];
    passwordTextField.font = [UIFont systemFontOfSize:12.0];
    passwordTextField.secureTextEntry = YES;
    passwordTextField.layer.cornerRadius = 5.0;
    passwordTextField.layer.masksToBounds = YES;
    passwordTextField.layer.borderColor = RandomColor.CGColor;
    passwordTextField.layer.borderWidth = 1.0;
    passwordTextField.delegate = self;

    currentView = passwordTextField;
    
    // 登录
    UIButton *loginButton = [[UIButton alloc] init];
    [self.view addSubview:loginButton];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(currentView.mas_height);
    }];
    loginButton.layer.cornerRadius = 5.0;
    loginButton.layer.masksToBounds = YES;
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.backgroundColor = RandomColor;
    loginButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    currentView = loginButton;
    
    // 快速注册
    UIButton *registerButton = [[UIButton alloc] init];
    [self.view addSubview:registerButton];
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(currentView.mas_height);
    }];
    [registerButton setTitle:@"快速注册" forState:UIControlStateNormal];
    registerButton.backgroundColor = [UIColor clearColor];
    registerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    // 忘记密码
    UIButton *forgetButton = [[UIButton alloc] init];
    [self.view addSubview:forgetButton];
    [forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.mas_bottom).offset(10);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(currentView.mas_height);
    }];
    [forgetButton setTitle:@"找回密码" forState:UIControlStateNormal];
    forgetButton.backgroundColor = [UIColor clearColor];
    forgetButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [forgetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [forgetButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


@end
