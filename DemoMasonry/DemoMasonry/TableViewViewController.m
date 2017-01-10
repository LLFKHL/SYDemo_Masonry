//
//  TableViewViewController.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "TableViewViewController.h"
#import "TableViewModel.h"
#import "TableViewCell.h"

@interface TableViewViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSArray *array;

@property (nonatomic, strong) TableViewCell *heightCell;

// 方法3
@property (nonatomic, strong) NSMutableDictionary *prototypeCell;

@end

@implementation TableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"tableview";
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 视图

- (void)setUI
{
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewModel *model = self.array[indexPath.row];
    
    // 方法1
//    self.heightCell.model = model;
//    CGFloat height = [self.heightCell heightTableCell];
    
    
    // 方法2
    if (!self.heightCell)
    {
        self.heightCell = [[TableViewCell alloc] init];
    }
    
    [self.heightCell updateFonts];

    self.heightCell.titleLabel.text =  model.title;
    self.heightCell.bodyLabel.text = model.text;
    
    [self.heightCell setNeedsUpdateConstraints];
    [self.heightCell updateConstraintsIfNeeded];
    
    self.heightCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(self.heightCell.bounds));
    [self.heightCell setNeedsLayout];
    [self.heightCell layoutIfNeeded];
    
    CGFloat height = [self.heightCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    height += 1;

    
    // 方法3
    
    /*
    TableViewCell *cell = (TableViewCell *)[self.prototypeCell objectForKey:identifierTableViewCell];
    if (!cell)
    {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierTableViewCell];
        
        [self.prototypeCell setObject:cell forKey:identifierTableViewCell];
    }
    [(TableViewCell *)cell initModel:model.text];
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
//    TableViewModel *model = self.array[indexPath.row];
//    [(TableViewCell *)self.heightCell initModel:model.text];
//    self.heightCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(self.heightCell.bounds));
//    [self.heightCell setNeedsLayout];
//    [self.heightCell layoutIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    height += 1;
    */
    

    // 方法4
    
    /*
    if (!self.heightCell)
    {
        self.heightCell = [[TableViewCell alloc] init];
    }
    [self.heightCell updateFonts];
    self.heightCell.titleLabel.text =  model.title;
    self.heightCell.bodyLabel.text = model.text;
    [self.heightCell setNeedsUpdateConstraints];
    [self.heightCell updateConstraintsIfNeeded];
    self.heightCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(self.heightCell.bounds));
    [self.heightCell setNeedsLayout];
    [self.heightCell layoutIfNeeded];
    
    CGFloat height = [self.heightCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    height += 1;
//    // 或
//    CGFloat height = [self.heightCell heightTableViewCell:model];
    */
    
    
    NSLog(@"index=%ld, height:%@", indexPath.row, @(height));
    
    return height;
}

// 方法3
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 70.0;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifierTableViewCell];
    if (cell == nil)
    {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierTableViewCell];
        self.heightCell = cell;
    }
    
    TableViewModel *model = self.array[indexPath.row];

    
    // 方法1
////    cell.text = model.title;
////    cell.detailText = model.text;
//    cell.model = model;
    
    
    // 方法2
    [cell updateFonts];

    cell.titleLabel.text =  model.title;
    cell.bodyLabel.text = model.text;
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    
    // 方法3
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.contentLabel.text = model.text;

    
    // 方法4
//    [cell updateFonts];
//    cell.titleLabel.text =  model.title;
//    cell.bodyLabel.text = model.text;
//    [cell setNeedsUpdateConstraints];
//    [cell updateConstraintsIfNeeded];
////    cell.model = model;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TableViewModel *model = self.array[indexPath.row];
    NSLog(@"index=%ld, title=%@", indexPath.row, model.title);
}

#pragma mark - setter

- (UITableView *)mainTableView
{
    if (!_mainTableView)
    {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_mainTableView];

        _mainTableView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        
        // 设置为动态高度
        _mainTableView.estimatedRowHeight = UITableViewAutomaticDimension;
    }
    
    return _mainTableView;
}

- (NSArray *)array
{
    if (!_array)
    {
        NSArray *tmpArray = @[@"adasdfasdfasdfadsfdsaf",@"56456asd4f56a4sdf56a4sdf564as56df4as56df4as56df4ads56f4ads564fads56f456asd4f56ads4f56ads4f56asdf456ads4f56ads4fd6",@"56456asd4f56a4sdf56a4sdf564as56df4as56df4as56df4ads56f4ads564fads56f456asd4f56ads4f56ads4f56asdf456ads4f56ads4fd6",@"adasdfasdfasdfadsfdsaf",@"56456asd4f56a4sdf56a4sdf564as56df4as56df4as56df4ads56f4ads564fads56f456asd4f56ads4f56ads4f56asdf456ads4f56ads4fd6",@"56456asd4f56a4sdf56a4sdf564as56df4as56df4as56df4ads56f4ads564fads56f456asd4f56ads4f56ads4f56asdf456ads4f56ads4fd6",@"adasdfasdfasdfadsfdsaf",@"56456asd4f56a4sdf56a4sdf564as56df4as56df4as56df4ads56f4ads564fads56f456asd4f56ads4f56ads4f56asdf456ads4f56ads4fd6",@"56456asd4f56a4sdf56a4sdf564as56df4as56df4as56df4ads56f4ads564fads56f456asd4f56ads4f56ads4f56asdf456ads4f56ads4fd6",@"adasdfasdfasdfadsfdsaf",@"56456asd4f56a4sdf56a4sdf564as56df4as56df4as56df4ads56f4ads564fads56f456asd4f56ads4f56ads4f56asdf456ads4f56ads4fd6",@"56456asd4f56a4sdf56a4sdf564as56df4as56df4as56df4ads56f4ads564fads56f456asd4f56ads4f56ads4f56asdf456ads4f56ads4fd6",@"adasdfasdfasdfadsfdsaf",@"56456asd4f56a4sdf56a4sdf564as56df4as56df4as56df4ads56f4ads564fads56f456asd4f56ads4f56ads4f56asdf456ads4f56ads4fd6",@"adasdfasdfasdfadsfdsaf",@"56456asd4f56a4sdf56a4sdf564as56df4as56df4as56df4ads56f4ads564fads56f456asd4f56ads4f56ads4f56asdf456ads4f56ads4fd6",@"adasdfasdfasdfadsfdsaf",@"56456asd4f56a4sdf56a4sdf564as56df4as56df4as56df4ads56f4ads564fads56f456asd4f56ads4f56ads4f56asdf456ads4f56ads4fd6",@"adasdfasdfasdfadsfdsaf",@"56456asd4f56a4sdf56a4sdf564as56df4as56df4as56df4ads56f4ads564fads56f456asd4f56ads4f56ads4f56asdf456ads4f56ads4fd6",@"adasdfasdfasdfadsfdsaf",@"56456asd4f56a4sdf56a4sdf564as56df4as56df4as56df4ads56f4ads564fads56f456asd4f56ads4f56ads4f56asdf456ads4f56ads4fd6",@"adasdfasdfasdfadsfdsaf",@"56456asd4f56a4sdf56a4sdf564as56df4as56df4as56df4ads56f4ads564fads56f456asd4f56ads4f56ads4f56asdf456ads4f56ads4fd6",@"adasdfasdfasdfadsfdsaf"];
        NSMutableArray *modelArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < tmpArray.count; i++)
        {
            TableViewModel *model = [[TableViewModel alloc] init];
            model.title = [NSString stringWithFormat:@"第 %ld 个cell", i];
            model.text = tmpArray[i];
            
            [modelArray addObject:model];
        }
        
        _array = [[NSArray alloc] initWithArray:modelArray];
    }
    
    return _array;
}

@end
