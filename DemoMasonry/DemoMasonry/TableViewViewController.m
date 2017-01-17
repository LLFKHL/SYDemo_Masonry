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
    CGFloat height = model.height;
    
    NSLog(@"index = %ld, height:%@", indexPath.row, @(height));
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifierTableViewCell];
    if (cell == nil)
    {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierTableViewCell];
    }
    
    TableViewModel *model = self.array[indexPath.row];
    cell.model = model;    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TableViewModel *model = self.array[indexPath.row];
    NSLog(@"index = %ld, height = %@", indexPath.row, @(model.height));
}

#pragma mark - getter

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
        NSArray *tmpArray = @[@"hello，我是iOS开发菜鸟。",@"很多iOS开发者应该都用过autolayout，如果用故事版和XIB的话非常好用，但是如果用纯代码的方式写的话就感觉这东西太啰嗦了，一点都不好用，还不如frame来得快，然而在公司项目中一般都是多人开发，因此还是以纯代码写的方式比较多。",@"一个国外大神推出了一套封装好autolayout框架Masnory，Masonry是一个轻量级的布局框架拥有自己的描述语法采用更优雅的链式语法封装自动布局简洁明了并具有高可读性而且同时支持iOS和Max OS X。",@"银行不改变，就让支付宝就改变银行，至少让银行睡不着。",@"其实押金池这个是有很多争议的，押金金融确实是令很多人高潮，也是摩拜被人议论得最多的一种盈利模式。押金池的本质是滚雪球，每个进来的用户都要交299块押金，那么这些押金是否可以用于下一批单车的采购，然后投放到其他城市，接着又有人用，又有押金，如此滚雪球似的增长。但是如果是这样的话，那么很多行业都有押金机制，那是否都可以这样玩呢？",@"其实在很多外行看来，几千万的注册量确实是很厉害，但是这个注册量的月活流量真的不怎么值得去关注，毕竟像摩拜这样的大公司，这些广告费只能是算做一个外快钱，并不能作为支持企业活下去。",@"政府自己就有公益车，有什么理由要补贴你，不竞争就不错了吧？政府关系参考滴滴至今，大谈这是优势的人，应该再考虑考虑。",@"类似广告，现阶段只是快钱，单车背后的人群，量级，产品回报率，这些东西究竟能在广告主品牌主值多少钱，打问号。",@"租金就是用户租用单车平台所得到的钱，一小时一块钱，那这样必须得有很高的使用频率才能够获取高的租金，但是摩拜其运营就是一个无底洞，单单这些租金恐怕是成本也很难赚回来。",@"融资仍然是摩拜如今最赚钱的手段，在1月4好，摩拜已经完成了D轮融资，融资金额为2.15亿美元，摩拜就是在不断的融资中拓展了其资金链，使其能够继续的生存下去。",@"有人分析出来摩拜利用GPS来分析用户的具体行为，通过统计用户的行为包装成数据卖给需要的大企业，但是这些数据具体参考价值也是用户的活跃地区在哪几个地方而已，具体价值还是有待研究的。",@"晚上跟公司领导和同事打麻将，散场后回到家，老婆问怎么样？我苦着脸说：“跟领导打牌能赢吗？输了五百多。”老婆听后点了点头，说：“下次别去打了，这次的钱就不从你下个月零用钱里扣了。”我爽快的答应了。第二天和老婆去菜场买菜，正巧遇到领导老婆，那老娘们一开口：“小律啊，你昨天手气真是太好了！一摞三，赢了一千多啊！”额，我特么差点没被这句话给噎死....。",@"表姐大龄剩女一枚，昨天有人给她介绍对象，表姐去了。见面地点约在一家餐厅，男人又矮又丑，表姐看不上。“本来我想走的，后来……”表姐没说完就害羞起来……我问：后来你被他的言谈吸引没走？表姐：他都走了，还点了一桌子菜，我怕浪费……",@"一天李靖对哪吒说，儿啊，你知道我为何总是对你不满吗？哪吒说难道是因为我太调皮了吗。李靖一巴掌就扇了上去，你个小逼崽子在你娘肚子里一待就是三年，急得为父手都能托塔了！哪吒母亲一笑说，怪不得塔下面有一个洞呢。",@"我四肢发达，好斗，一次在学校打伤一同学，去医院花了好多钱，不敢跟家里讲，于是找同学借，一同班女同学借给我最多……一段时间后，她没钱吃饭，催我还钱，我没办法，天天带她到朋友那里蹭饭……不久，她就变成我女朋友了…………终于，她将我带到她家见父母，居然遇到被我打伤的那个学生，他开口说：姐夫好！。",@"罗纳尔迪尼奥，个人荣誉：世界足球先生（2004，2005），金球奖（2005），南美足球先生（2013），金足奖（2009），国家队荣誉：美洲杯冠军（1999），世界杯冠军（2002），联合会杯冠军（2005），俱乐部荣誉：西甲冠军（2004,2005），欧洲冠军联赛冠军（2006），南美解放者杯冠军（2013），西班牙超级杯冠军（2004,2005）。",@"自从360免费后，一下子电脑的病毒似乎都消失了。",@"周鸿祎在一次节目上透露开始做360时，自己把别人卖到200元的软件，自己卖到25元，发现还是做不过别人。因为自己不是第一个做了，可能是第四个，第五个，市场都被别人占领了。",@"哪怕改变一个模式也是重新。",@"你现在做什么行业呢？是否能把自己卖的东西和360一样做到免费，而从其他地方赚钱？这是给每个创业者启发的。",@"一位锤子科技前员工在微博上发布长文《我为什么离开锤子科技》，向网友公开他离开锤子科技的原因。这位锤子科技前员工主要叙述了三个问题：一个是对上级的管理方式的不满，经常催促任务和越过中间级别布置详细任务；另一个是公司福利减少，没有中秋红包；最后一个是锤子科技的所谓弹性工作制度的问题，作者认为“所谓的弹性工作制就是一种可以让你每天加班到10点但是不用付薪水的制度。",@"马云曾经说过：“员工的离职原因很多，只有两点最真实： 1、钱，没给到位； 2、心，委屈了。”",@"华为的薪酬主要包括三部分：工资、奖金和分红；当然如若外派国外，还有外派补助+艰苦补助。华为的这种高薪政策及配“股票”的政策让员工极具“主人翁”意识：在公司大发展时，一起享受公司发展带来的红利；在公司困难时，能迎难而上与公司同舟共济。",@"华为不仅“舍得花钱”，更重要是“懂得分钱”，设计了一套“定岗定薪，易岗易薪”，意思就是工资薪酬是根据岗位来设定。",@"很多时候我们过高估计了机遇的力量，低估了规划的重要性，不明确的乐观主义者只知道未来越来越好，却不知道究竟多好，因此不去制定具体计划。他想在未来获利，但是却认为没有必要制定具体规划。"];
        
        NSMutableArray *modelArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < tmpArray.count; i++)
        {
            TableViewModel *model = [[TableViewModel alloc] init];
            model.title = [NSString stringWithFormat:@"第 %@ 个cell", @(i)];
            model.content = tmpArray[i];
            model.imageName = (arc4random() % 10 % (i + 1) == 2 ? @"tianshi.png" : @"futou.png");
            if (i % 3 == 1)
            {
                model.imageName = nil;
            }
            
            [modelArray addObject:model];
        }
        
        _array = [[NSArray alloc] initWithArray:modelArray];
    }
    
    return _array;
}

@end
