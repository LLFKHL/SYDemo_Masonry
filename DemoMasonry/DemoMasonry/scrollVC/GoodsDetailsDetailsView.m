//
//  GoodsDetailsDetailsView.m
//  VSTMALL
//
//  Created by zhangshaoyu on 16/4/7.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "GoodsDetailsDetailsView.h"

@interface GoodsDetailsDetailsView () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, assign) BOOL isSuccess;

@end

@implementation GoodsDetailsDetailsView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setUI];
    }
    
    return self;
}

#pragma mark - 视图

- (void)setUI
{
    [self addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
    }];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"load start");
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"load fail");
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"load success");
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    self.isSuccess = YES;
}

#pragma mark - setter/getter

- (UIWebView *)webView
{
    if (_webView == nil)
    {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;
        
        _webView.scrollView.scrollEnabled = YES;
    }
    
    return _webView;
}

- (void)setDetailsUrl:(NSString *)detailsUrl
{
    _detailsUrl = detailsUrl;
    if (_detailsUrl && !self.isSuccess)
    {
        NSURL *url = [[NSURL alloc] initWithString:_detailsUrl];
        NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
        [self.webView loadRequest:urlRequest];
    }
}

@end
