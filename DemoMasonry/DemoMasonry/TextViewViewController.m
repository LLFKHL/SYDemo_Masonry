//
//  TextViewViewController.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "TextViewViewController.h"

@interface TextViewViewController () <UITextViewDelegate>

@end

@implementation TextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"textview";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 视图

- (void)setUI
{
    UITextView *textview = [[UITextView alloc] init];
    [self.view addSubview:textview];
    [textview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
    textview.layer.borderColor = RandomColor.CGColor;
    textview.layer.borderWidth = 1.0;
    textview.textColor = RandomColor;
    textview.tag = 1000;
    textview.delegate = self;
    textview.returnKeyType = UIReturnKeyDone;
    
    
    UIView *currentView = textview;
    
    
    UITextView *textview2 = [[UITextView alloc] init];
    [self.view addSubview:textview2];
    NSArray *constraints = [textview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.bottom).offset(10);
        make.left.equalTo(currentView);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
    textview2.layer.borderColor = RandomColor.CGColor;
    textview2.layer.borderWidth = 1.0;
    textview2.textColor = RandomColor;
    textview2.font = [UIFont systemFontOfSize:12.0];
    textview2.tag = 1001;
    textview2.delegate = self;
    textview2.returnKeyType = UIReturnKeyDone;
    
    
    MASConstraint *contraint = constraints.lastObject;
    NSLayoutConstraint *layoutConstraint = [contraint valueForKey:@"layoutConstraint"];
    CGFloat height = layoutConstraint.constant;
    NSLog(@"height = %f", height);
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
    }
    
    if (1001 == textView.tag)
    {
        NSString *string = [textView.text stringByReplacingCharactersInRange:range withString:text];
        NSLog(@"string = %@", string);
        
        CGSize size = [string boundingRectWithSize:CGSizeMake((self.view.frame.size.width - 10.0 * 2), MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0]} context:nil].size;
        CGFloat height = size.height;
        NSLog(@"height = %@", @(height));
        
        // 根据实际高度，更新约束
        if (height > textView.frame.size.height)
        {
            [textView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(height);
            }];
        }
    }
    
    return YES;
}

@end
