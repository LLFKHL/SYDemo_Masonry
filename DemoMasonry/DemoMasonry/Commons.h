//
//  Commons.h
//  DemoMasonry
//
//  Created by zhangshaoyu on 16/3/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

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


/*

 http://www.jianshu.com/p/f0b17ecfd04e
 http://www.cocoachina.com/ios/20150527/11936.html
 http://www.jianshu.com/p/598225bb7ddc
 http://adad184.com/2014/09/28/use-masonry-to-quick-solve-autolayout/
 http://www.infoq.com/cn/news/2016/03/ios-weekly-apple-mcqueen?utm_campaign=rightbar_v2&utm_source=infoq&utm_medium=news_link&utm_content=link_text
 https://github.com/Tricertops/Objective-Chain
 https://segmentfault.com/q/1010000002773838
 
*/