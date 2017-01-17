//
//  Commons.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/3/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//  github：https://github.com/potato512/SYDemo_Masonry

#ifndef Commons_h
#define Commons_h

#define WidthScreen ([UIScreen mainScreen].bounds.size.width)
#define HeightScreen ([UIScreen mainScreen].bounds.size.height)
#define ScaleHW (HeightScreen / WidthScreen)


/*
Masonry使用技巧:
定义以下两个宏,在使用Masonry框架时就不需要加mas_前缀了
(定义宏一定要在引入Masonry.h文件之前).
*/
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS


#endif /* Commons_h */


