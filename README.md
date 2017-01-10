# SYDemo_Masonry
使用masonry进行适配

#使用注意事项
 * 1、使用autolayout之前，一定要将视图添加到父视图上，否则会报错。
 * 2、使用autolayout时，不能同事对同一个视图使用mas_makeConstraints，否则会报错。
 * 3、使用autolayout时，如果非要修改约束时，可使用mas_updateConstraints进行修改更新。
 * 4、使用autolayout时，可使用mas_remakeConstraints清除之前的所有约束，仅保留最新的约束。
 * 5、mas_equal支付的数据类型包括：NSNumber，CGPoint，CGSize，UIEdgeInsets。
 * 6、equalTo与mas_equalTo的区别：equalTo比较的是view，而mas_equalTo比较的是值。
 * 7、边界中顶部、左侧边界的数值为正整数；而底部、右侧边界的数值为负整数（原因在于计算的是绝对的数值，即计算的底部，或右侧边界的数值时，相对的视图底部高度，或右侧宽度，所以要负数）。
 * 8、多个视图的父视图相同时，须先实例化多个视图，且多个视图都添加到视图后才进行约束设置。

#使用
 * 1、居中设置
  * 垂直居中：make.centerY.mas_equalTo(self.window.mas_centerY)
  * 水平居中：make.centerX.mas_equalTo(self.window.mas_centerX)
  * 全屏居中：make.center.equalTo(self.window)

 * 2、边界设置
  * 上边界：make.top.equalTo(self.window).with.offset(15.0)
  * 左边界：make.left.equalTo(self.window).with.offset(15.0)
  * 下边界：make.bottom.equalTo(self.window).with.offset(-15.0)
  * 右边界：make.right.equalTo(self.window).with.offset(-15.0)
或：
  * 上边界：make.top.mas_equalTo(15.0)
  * 左边界：make.left.mas_equalTo(15.0)
  * 下边界：make.bottom.mas_equalTo(-15.0)
  * 右边界：make.right.mas_equalTo(-15.0)
或：
  * 上边界、左边界：make.top.left.mas_equalTo(15.0)
  * 下边界、右边界：make.bottom.right.mas_equalTo(-15.0)
或：
  * make.top.left.bottom.and.right.equalTo(self.window).with.insets(UIEdgeInsetsMake(15.0,15.0,15.0,15.0))
或：
  * make.edges.equalTo(self.window).with.insets(UIEdgeInsetsMake(15.0,15.0,15.0,15.0))
与另一个视图的边界间距设置
与另一个视图右部边界间距：
  * make.right.mas_equalTo(currentView.mas_left).offset(10.0);
与另一个视图底部边界间距：
  * make.top.mas_equalTo(currentView.mas_bottom).offset(10.0);

 * 3、equalTo与mas_equalTo有什么区别？
  * equalTo比较的是view
  * mas_equalTo比较的是数值

 * 4、and和with？
  * 什么事情都没做，只是增加代码可读性。

 * 5、倍数设置
  * 设置宽度为self.view的一半，multipliedBy是倍数的意思，也就是，使宽度等于self.view宽度的0.5倍
  * make.width.equalTo(self.view.mas_width).multipliedBy(0.5);
  * 设置高度为self.view高度的一半
  * make.height.equalTo(self.view.mas_height).multipliedBy(0.5);

 * 6、大小设置
  * （1）宽：
  * make.width.equalTo(self.view.mas_width).multipliedBy(0.5);
  * 或：make.width. mas_equalTo(320.0).multipliedBy(0.5);
  * 或：make.width. mas_equalTo(160.0);
  * （2）高：make.height.equalTo(self.view.mas_height).multipliedBy(0.5);
  * 或：make.height. mas_equalTo(320.0).multipliedBy(0.5);
  * 或：make.height. mas_equalTo(160.0);
  * （3）size：make.size. mas_equalTo(CGSizeMake(300.0,50.0));
  * 或：make.size.equalTo(view);
  * 或：make.size.mas_equalTo(CGSizeMake(150.0,50.0)).multipliedBy(0.5);


#疑问：
 * 1、UILable如何设置多行显示？

~~~ javascript
self.detailLabel = [UILabel new]; 
self.detailLabel.font = [UIFont systemFontOfSize:15]; 
self.detailLabel.numberOfLines = 0; 
self.detailLabel.preferredMaxLayoutWidth = WIDTH(self);//要是设置多行Label的话,必须设置此属性 
self.detailLabel.backgroundColor = [UIColor whiteColor]; 
[self addSubview:self.detailLabel]; 
[self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) { 
    make.top.mas_equalTo(self.footTitleBackView.mas_bottom).offset(5); 
    make.left.and.right.mas_equalTo(0); 
    make.bottom.mas_equalTo(self.mas_bottom); 
}]; 
[self.detailLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
~~~

主要是UILabel的高度会有变化，所以这里主要是说说label变化时如何处理，设置UILabel的时候注意要设置preferredMaxLayoutWidth这个宽度，还有ContentHuggingPriority为UILayoutPriorityRequried

~~~ javascript
CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width - 10 * 2;
textLabel.preferredMaxLayoutWidth = maxWidth; 
[textLabel mas_makeConstraints:^(MASConstraintMaker *make) { 
    make.top.equalTo(statusView.mas_bottom).with.offset(10); 
    make.left.equalTo(self.contentView).with.offset(10); 
    make.right.equalTo(self.contentView).with.offset(-10); 
    make.bottom.equalTo(self.contentView).with.offset(-10); 
}];
[textLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
~~~

 * 2、UITextView如何设置多行显示？

 * 3、UISCrollView如何设置contentSize？
通过过滤视图层设置。如：crollView的过渡子视图为containerView，且其约束为make.edges.equalTo(scr);make.width.equalTo(scr);，然后将其他子视图均添加到过渡视图containerView上，最后设置其高度属性约束make.bottom.equalTo(lastView.mas_bottom);即可。

 * 4、UITableView如何设置UITableViewCell的高度？
如果版本支持最低版本为iOS 8以上的话可以直接利用UITableViewAutomaticDimension在tableview的heightForRowAtIndexPath直接返回即可。

~~~ javascript
tableView.rowHeight = UITableViewAutomaticDimension; 
tableView.estimatedRowHeight = 80; //减少第一次计算量，iOS7后支持
~~~ 

~~~ javascript
(CGFloat)tableView:(UITableView )tableView heightForRowAtIndexPath:(NSIndexPath )indexPath { 
    // 只用返回这个！ 
    return UITableViewAutomaticDimension; 
}
~~~ 

但如果需要兼容iOS 8之前版本的话，就要回到老路子上了，主要是用systemLayoutSizeFittingSize来取高。步骤是先在数据model中添加一个height的属性用来缓存高，然后在table view的heightForRowAtIndexPath代理里static一个只初始化一次的Cell实例，然后根据model内容填充数据，最后根据cell的contentView的systemLayoutSizeFittingSize的方法获取到cell的高。具体代码如下：

~~~ javascript
// 在model中添加属性缓存高度 
@interface DataModel : NSObject 

@property (copy, nonatomic) NSString *text; 
@property (assign, nonatomic) CGFloat cellHeight; //缓存高度 

@end

(CGFloat)tableView:(UITableView )tableView heightForRowAtIndexPath:(NSIndexPath )indexPath { 
static CustomCell *cell; 
//只初始化一次cell 
static dispatch_once_t onceToken; 
dispatch_once(&onceToken, ^{ 
    cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomCell class])]; 
    }); 
    DataModel *model = self.dataArray[(NSUInteger) indexPath.row]; 
    [cell makeupData:model];

    if (model.cellHeight <= 0) 
    { 
        // 使用systemLayoutSizeFittingSize获取高度 
        model.cellHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1; 
    } 
    return model.cellHeight; 
}
~~~

 * 5、如何处理动画效果？
因为布局约束就是要脱离frame这种表达方式的，可是动画是需要根据这个来执行，这里面就会有些矛盾，不过根据前面说到的布局约束的原理，在某个时刻约束也是会被还原成frame使视图显示，这个时刻可以通过layoutIfNeeded这个方法来进行控制。具体代码如下

~~~ javascript
[aniView mas_makeConstraints:^(MASConstraintMaker *make) { 
    make.top.bottom.left.right.equalTo(self.view).offset(10); 
}];
~~~ 

~~~ javascript
[aniView mas_updateConstraints:^(MASConstraintMaker *make) { 
    make.top.equalTo(self.view).offset(30); 
}];
~~~ 

~~~ javascript
[UIView animateWithDuration:3 animations:^{ 
    [self.view layoutIfNeeded]; 
}];
~~~ 

 * 6、如何动态修改约束



