//
//  TableViewModel.m
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "TableViewModel.h"
#import "TableViewCell.h"

@implementation TableViewModel

- (CGFloat)height
{
    if (!_height)
    {
        // 调用cell的方法计算出高度
        _height = [TableViewCell heightTableCellWithModel:self];
    }
    
    return _height;
}

@end
