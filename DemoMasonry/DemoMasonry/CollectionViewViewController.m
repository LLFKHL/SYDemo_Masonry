//
//  CollectionViewViewController.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "CollectionViewViewController.h"

#import "CollectionModel.h"
#import "CollectionHeaderView.h"
#import "CollectionFooterView.h"
#import "CollectionCell.h"

@interface CollectionViewViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *array;

@end

@implementation CollectionViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"collectionview";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 视图

- (void)setUI
{
    // 确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.allowsSelection = YES;
    collectionView.allowsMultipleSelection = NO;
    collectionView.alwaysBounceVertical = YES;
    collectionView.backgroundColor = [UIColor whiteColor];
    
    [collectionView registerClass:[CollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifierCollectionHeader];
    [collectionView registerClass:[CollectionFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:identifierCollectionFooter];
    [collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:identifierCollectionCell];
}

#pragma mark - UICollectionViewDataSource

// 定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSInteger count = arc4random() % 10 + 1;
    return count;
}

// 添加一个补充视图(页眉或页脚)
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqual:UICollectionElementKindSectionHeader])
    {
        CollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifierCollectionHeader forIndexPath:indexPath];
        
        headerView.titleLabel.text = [[NSString alloc] initWithFormat:@"Header：%ld Section", indexPath.section];
        
        return headerView;
    }
    else if ([kind isEqual:UICollectionElementKindSectionFooter])
    {
        CollectionFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:identifierCollectionFooter forIndexPath:indexPath];
        
        footerView.titleLabel.text = [[NSString alloc] initWithFormat:@"Footer：%ld Section", indexPath.section];
        
        return footerView;
    }
    
    return nil;
}

// 定义展示的UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.array.count;
    return count;
}

// 每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierCollectionCell forIndexPath:indexPath];
    
    CollectionModel *model = [self.array objectAtIndex:indexPath.row];
    cell.model = model;

    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

// 定义每个UICollectionViewCell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(widthCollectionCell, heightCollectionCell);
}

// 定义每个UICollectionViewCell的margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0);
}

// UICollectionViewCell最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0;
}

// UICollectionViewCell最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}

// 设定页眉的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(WidthScreen, heightCollectionHeader);
}

// 设定页脚的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(WidthScreen, heightCollectionFooter);
}

#pragma mark - UICollectionViewDelegate

// UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

// 返回这个UICollectionView是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

#pragma mark - getter

- (NSArray *)array
{
    if (!_array)
    {
        NSInteger count = arc4random() % 20 + 1;
        NSMutableArray *arrayTmp = [[NSMutableArray alloc] initWithCapacity:count];
        for (int i = 0; i < count; i++)
        {
            CollectionModel *model = [[CollectionModel alloc] init];
            model.imageName = ((i % 2 == 0) ? @"tianshi.png" : @"futou.png");
            model.title = [NSString stringWithFormat:@"index %@", @(i + 1)];
            
            [arrayTmp addObject:model];
        }
        
        _array = [[NSArray alloc] initWithArray:arrayTmp];
    }
    
    return _array;
}

@end
