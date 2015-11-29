//
//  YCSetingController.m
//  有宠ZJZ
//


#import "YCSetingController.h"
#import "YCPushViewController.h"
#import "YCOpenPushController.h"
#import "YCConvert.h"

#import "MBProgressHUD+PKX.h"

@interface YCSetingController ()

//@property(nonatomic,strong)NSMutableArray *groups;

@end

@implementation YCSetingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
// 创建第一个组模型
    YCSettingItem *item1=[YCSettingItemArrow itemWithTitle:@"专家在线" subTitle:@"宠物专家为您解答各类养宠问题" icon:@"fy_find_expert" destVc:[YCPushViewController class]];
    YCSettingGroup *group1=[YCSettingGroup groupWithItems:@[item1]];
  
    
    // 创建第二个组模型

    YCSettingItem *item21 = [YCSettingItemArrow itemWithTitle:@"养宠宝典" subTitle:@"各类宝典助你成为养宠达人" icon:@"fy_find_raise_book" destVc:[YCOpenPushController class]];
    YCSettingItem *item31 = [YCSettingItemArrow itemWithTitle:@"有宠资讯" subTitle:@"宠物趣闻,热点资讯每日推送" icon:@"fy_find_news" destVc:[YCPushViewController class]];
    YCSettingGroup *group2 = [YCSettingGroup groupWithItems:@[item21,item31]];
  
    
    // 创建第三个组模型
    
    YCSettingItem *item41 = [YCSettingItemArrow itemWithTitle:@"热赞榜" subTitle:@"萌宠点赞榜" icon:@"fy_find_rank" destVc:[YCPushViewController class]];
    YCSettingItem *item51 = [YCSettingItemArrow itemWithTitle:@"附近萌宠" subTitle:@"总有萌宠在身边" icon:@"fy_find_neighbourhoodPet" destVc:[YCPushViewController class]];
    YCSettingGroup *group4 = [YCSettingGroup groupWithItems:@[item41,item51]];
    

    // 创建第四个组模型

    YCSettingItem *item61 = [YCSettingItemArrow itemWithTitle:@"兑换商场" subTitle:@"免费兑换各种礼品" icon:@"fy_find_creditMall" destVc:[YCConvert class]];
    YCSettingGroup *group6 = [YCSettingGroup groupWithItems:@[item61]];
    
    self.groups = [NSMutableArray arrayWithObjects:group1,group2,group4,group6, nil];
    
    
}




@end