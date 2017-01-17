//
//  TableViewModel.h
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableViewModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *imageName;

@property (nonatomic, assign) CGFloat height;

@end
