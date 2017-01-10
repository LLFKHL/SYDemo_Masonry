//
//  BaseViewController.h
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 随机颜色
#define RandomColor ([UIColor colorWithHue:(arc4random() % 256 / 256.0) saturation:(arc4random() % 256 / 256.0) brightness:(arc4random() % 256 / 256.0) alpha:1])

@interface BaseViewController : UIViewController

@end
