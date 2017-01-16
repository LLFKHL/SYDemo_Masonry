//
//  ProgressViewController.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSMutableArray *pickerArray;

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"其他视图";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"hidden" style:UIBarButtonItemStyleDone target:self action:@selector(hiddenClick:)];
    
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 视图

- (void)setUI
{
    UILabel *labelSegment = [[UILabel alloc] init];
    [self.view addSubview:labelSegment];
    [labelSegment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(30.0);
    }];
    labelSegment.text = @"UISegmentedControl";
    labelSegment.textColor = RandomColor;
    
    UIView *currentView = labelSegment;
    
    NSArray *array = @[@"alert", @"sheet", @"picker", @"datePicker"];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:array];
    [self.view addSubview:segmentControl];
    [segmentControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
    [segmentControl addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    
    currentView = segmentControl;
    
    UILabel *labelUISwitch = [[UILabel alloc] init];
    [self.view addSubview:labelUISwitch];
    [labelUISwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(30.0);
    }];
    labelUISwitch.text = @"UISwitch/UIActivityIndicatorView";
    labelUISwitch.textColor = RandomColor;
    
    currentView = labelUISwitch;
    
    UISwitch *switchView = [[UISwitch alloc] init];
    [self.view addSubview:switchView];
    [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.bottom).offset(10);
        make.left.mas_equalTo(10);
    }];
    switchView.on = NO;
    [switchView addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventValueChanged];
    
    currentView = switchView;
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:activityView];
    [activityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.top);
        make.left.mas_equalTo(currentView.right).offset(30);
    }];
    activityView.color = [UIColor redColor];
    activityView.hidesWhenStopped = YES;
    [activityView stopAnimating];
    activityView.tag = 1005;
    
    
    UILabel *labelSlider = [[UILabel alloc] init];
    [self.view addSubview:labelSlider];
    [labelSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(30.0);
    }];
    labelSlider.text = @"UISlider/UIProgressView";
    labelSlider.textColor = RandomColor;
    
    currentView = labelSlider;
    
    UISlider *slider = [[UISlider alloc] init];
    [self.view addSubview:slider];
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(10);
    }];
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.value = 0.2;
    [slider addTarget:self action:@selector(sliderClick:) forControlEvents:UIControlEventValueChanged];
    
    currentView = slider;
    
    UIProgressView *progressview = [[UIProgressView alloc] init];
    [self.view addSubview:progressview];
    [progressview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.bottom).offset(20);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(10);
    }];
    progressview.trackTintColor = [UIColor yellowColor];
    progressview.tintColor = [UIColor redColor];
    progressview.progress = slider.value;
    progressview.tag = 1006;
}

#pragma mark - 响应事件

- (void)hiddenClick:(UIBarButtonItem *)sender
{
    UIPickerView *pickerView = (UIPickerView *)[self.view viewWithTag:1007];
    if (pickerView)
    {
        [pickerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view.frame.size.height);
        }];
        [UIView animateWithDuration:0.6 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
    
    UIDatePicker *datePicker = (UIDatePicker *)[self.view viewWithTag:1008];
    if (datePicker)
    {
        [datePicker mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view.frame.size.height);
        }];
        [UIView animateWithDuration:0.6 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}

- (void)segmentClick:(UISegmentedControl *)sender
{
    NSInteger index = sender.selectedSegmentIndex;
    if (0 == index)
    {
        // alert
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"alert" message:@"masonry alert" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"calcel");
        }];
        [alertController addAction:actionCancel];
        UIAlertAction *actionConfirm = [UIAlertAction actionWithTitle:@"confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"confirm");
        }];
        [alertController addAction:actionConfirm];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else if (1 == index)
    {
        // sheet
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"actionSheet" message:@"masonry actionSheet" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"calcel");
        }];
        [alertController addAction:actionCancel];
        UIAlertAction *actionConfirm = [UIAlertAction actionWithTitle:@"confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"confirm");
        }];
        [alertController addAction:actionConfirm];
        UIAlertAction *actionDestructive = [UIAlertAction actionWithTitle:@"destructive" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"destructive");
        }];
        [alertController addAction:actionDestructive];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    else if (2 == index)
    {
        // picker
        UIDatePicker *datePicker = (UIDatePicker *)[self.view viewWithTag:1008];
        if (datePicker)
        {
            [datePicker mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.view.frame.size.height);
            }];
            [UIView animateWithDuration:0.6 animations:^{
                [self.view layoutIfNeeded];
            }];
        }
        
        UIPickerView *pickerView = (UIPickerView *)[self.view viewWithTag:1007];
        if (!pickerView)
        {
            pickerView = [[UIPickerView alloc] init];
            [self.view addSubview:pickerView];
            [pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.view.frame.size.height);
                make.width.mas_equalTo(self.view.frame.size.width);
                make.height.mas_equalTo(200);
            }];
        }
        [pickerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view.frame.size.height - 200);
        }];
        [UIView animateWithDuration:0.6 animations:^{
            [self.view layoutIfNeeded];
        }];
        pickerView.backgroundColor = [UIColor redColor];
        pickerView.delegate = self;
        pickerView.dataSource = self;
        [pickerView reloadAllComponents];
        pickerView.tag = 1007;
    }
    else if (3 == index)
    {
        // datePicker
        UIPickerView *pickerView = (UIPickerView *)[self.view viewWithTag:1007];
        if (pickerView)
        {
            [pickerView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.view.frame.size.height);
            }];
            [UIView animateWithDuration:0.6 animations:^{
                [self.view layoutIfNeeded];
            }];
        }
        
        UIDatePicker *datePicker = (UIDatePicker *)[self.view viewWithTag:1008];
        if (!datePicker)
        {
            datePicker = [[UIDatePicker alloc] init];
            [self.view addSubview:datePicker];
            [datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.view.frame.size.height);
                make.width.mas_equalTo(self.view.frame.size.width);
                make.height.mas_equalTo(200);
            }];
        }
        [datePicker mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view.frame.size.height - 200);
        }];
        [UIView animateWithDuration:0.6 animations:^{
            [self.view layoutIfNeeded];
        }];
        datePicker.backgroundColor = [UIColor greenColor];
        datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        datePicker.tag = 1008;
    }
}

- (void)switchClick:(UISwitch *)sender
{
    BOOL isStart = sender.on;
    
    UIActivityIndicatorView *activityView = (UIActivityIndicatorView *)[self.view viewWithTag:1005];
    if (isStart)
    {
        [activityView startAnimating];
    }
    else
    {
        [activityView stopAnimating];
    }
}

- (void)sliderClick:(UISlider *)sender
{
    CGFloat value = sender.value;
    UIProgressView *progressview = (UIProgressView *)[self.view viewWithTag:1006];
    progressview.progress = value;
}

#pragma mark - UIPickerViewDelegate, UIPickerViewDataSource

- (NSMutableArray *)pickerArray
{
    if (!_pickerArray)
    {
        NSArray *provinces = @[@"广东省",@"广西省",@"湖南省",@"湖北省"];
        NSArray *citys = @[@"深圳市",@"桂林市",@"长沙市",@"武汉市"];
        NSArray *towns = @[@"罗湖区",@"福田区",@"龙华区",@"南山区"];
        
        _pickerArray = [[NSMutableArray alloc] init];
        [_pickerArray addObject:provinces];
        [_pickerArray addObject:citys];
        [_pickerArray addObject:towns];
    }
    
    return _pickerArray;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    NSInteger count = self.pickerArray.count;
    return count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *array = self.pickerArray[component];
    NSInteger count = array.count;
    return count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *array = [self.pickerArray objectAtIndex:component];
    NSString *title = [array objectAtIndex:row];
    return title;
}

@end
