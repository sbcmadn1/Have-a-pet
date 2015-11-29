//
//  YCPushViewController.m
//  有宠ZJZ
//


#import "YCPushViewController.h"

@interface YCPushViewController ()

@end

@implementation YCPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    // 创建第一个组模型
    YCSettingItem *item1=[YCSettingItemArrow itemWithTitle:@"专家在线" subTitle:@"宠物专家为您解答各类养宠问题" icon:@"fy_find_expert"];
    YCSettingGroup *group1=[YCSettingGroup groupWithItems:@[item1]];
    
    // 创建第二个组模型
    
    YCSettingItem *item21 = [YCSettingItemArrow itemWithTitle:@"养宠宝典" subTitle:@"各类宝典助你成为养宠达人" icon:@"fy_find_raise_book"];
    YCSettingItem *item31 = [YCSettingItemArrow itemWithTitle:@"有宠资讯" subTitle:@"宠物趣闻,热点资讯每日推送" icon:@"fy_find_news"];
    YCSettingGroup *group2 = [YCSettingGroup groupWithItems:@[item21,item31]];
    self.groups = [NSMutableArray arrayWithObjects:group1,group2, nil];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.tableView.tableHeaderView == nil) {
        // 设置头部控件
        self.tableView.tableHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"YCOpenPushHeaderView" owner:nil options:nil] lastObject];
    }
}

@end
