//
//  GoodsDetailsVC.m
//  VSTMALL
//
//  Created by zhangshaoyu on 16/4/7.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "GoodsDetailsVC.h"
#import "AppDelegate.h"

#import "GoodsDetailsGoodsView.h"
#import "GoodsDetailsDetailsView.h"
#import "GoodsDetailsCommentsView.h"

#define kBodyHeight         ([UIScreen mainScreen].bounds.size.height - 44.0)

@interface GoodsDetailsVC ()

@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) GoodsDetailsGoodsView *goodsView;
@property (nonatomic, strong) GoodsDetailsDetailsView *detailsView;
@property (nonatomic, strong) GoodsDetailsCommentsView *commentsView;

@end

@implementation GoodsDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /// 导航栏标题
    UISegmentedControl *segmentController = [[UISegmentedControl alloc] initWithItems:@[@"商品", @"详情", @"评价"]];
    [segmentController addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segmentController;
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 视图

- (void)setUI
{
    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(0);
        make.width.equalTo(self.view);
        make.height.mas_equalTo(kBodyHeight);
    }];
    // 设置scrollview的contentSize
    UIView *containerView = [[UIView alloc] init];
    [self.mainScrollView addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(containerView);
        make.height.equalTo(self.mainScrollView);
    }];
    // goodsView
    [containerView addSubview:self.goodsView];
    [self.goodsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(containerView);
        make.left.mas_equalTo(0);
        make.width.equalTo(self.mainScrollView);
    }];
    // detailsView
    [containerView addSubview:self.detailsView];
    [self.detailsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(self.goodsView);
        make.left.mas_equalTo(self.goodsView.mas_right);
        make.width.equalTo(self.goodsView);
    }];
    // commentsView
    [containerView addSubview:self.commentsView];
    [self.commentsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(self.detailsView);
        make.left.mas_equalTo(self.detailsView.mas_right);
        make.width.equalTo(self.detailsView);
    }];
    // containerView的width
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.right.mas_equalTo(self.commentsView.mas_right);
    }];
}

#pragma mark - 响应

- (void)segmentClick:(UISegmentedControl *)segment
{
    NSInteger index = segment.selectedSegmentIndex;
    
    switch (index)
    {
        case 0:
        {
            // 商品
            NSLog(@"商品");
            [self.mainScrollView setContentOffset:CGPointMake(0.0, 0.0) animated:YES];
        }
            break;
        case 1:
        {
            // 详情
            NSLog(@"详情");
            [self.mainScrollView setContentOffset:CGPointMake(CGRectGetWidth(self.mainScrollView.bounds), 0.0) animated:YES];
            
            self.detailsView.detailsUrl = @"http://www.hao123.com";
        }
            break;
        case 2:
        {
            // 评价
            NSLog(@"评价");
            [self.mainScrollView setContentOffset:CGPointMake(CGRectGetWidth(self.mainScrollView.bounds) * 2, 0.0) animated:YES];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 代理

#pragma mark - 网络

#pragma mark - setter/getter

- (UIScrollView *)mainScrollView
{
    if (!_mainScrollView)
    {
        _mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.backgroundColor = [UIColor greenColor];
        
        _mainScrollView.scrollEnabled = YES;
        _mainScrollView.pagingEnabled = YES;
    }
    
    return _mainScrollView;
}

- (GoodsDetailsGoodsView *)goodsView
{
    if (!_goodsView)
    {
        _goodsView = [GoodsDetailsGoodsView new];
        _goodsView.backgroundColor = [UIColor yellowColor];
    }
    
    return _goodsView;
}

- (GoodsDetailsDetailsView *)detailsView
{
    if (!_detailsView)
    {
        _detailsView = [GoodsDetailsDetailsView new];
        _detailsView.backgroundColor = [UIColor orangeColor];
    }
    
    return _detailsView;
}

- (GoodsDetailsCommentsView *)commentsView
{
    if (!_commentsView)
    {
        _commentsView = [GoodsDetailsCommentsView new];
        _commentsView.backgroundColor = [UIColor redColor];
    }
    
    return _commentsView;
}

@end
