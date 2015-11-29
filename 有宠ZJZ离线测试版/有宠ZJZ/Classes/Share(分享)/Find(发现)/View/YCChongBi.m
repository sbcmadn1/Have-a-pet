//
//  YCChongBi.m
//  有宠ZJZ
//
//  Created by li on 15/10/2.

//

#import "YCChongBi.h"

@interface YCChongBi ()

@end

@implementation YCChongBi

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    // 创建第一个组模型
    YCSettingItemArrow *item1=[YCSettingItemArrow itemWithTitle:@"品种百科" subTitle:@"宠物品种百科" icon:@"fy_neighbourhood_sift_all"];
    YCSettingItem *item2 = [YCSettingItemArrow itemWithTitle:@"疾病百科" subTitle:@"最齐全的宠物疾病百科" icon:@"fy_raise_disease_subjects"];
    YCSettingItem *item3 = [YCSettingItemArrow itemWithTitle:@"疾病自查" subTitle:@"宠物疾病自检自查" icon:@"fy_raise_disease_check"];
    YCSettingItem *item4 = [YCSettingItemArrow itemWithTitle:@"体重测试" subTitle:@"宠物体重健康测试" icon:@"fy_raise_weight_test"];
    YCSettingItem *item5 = [YCSettingItemArrow itemWithTitle:@"年龄转换" subTitle:@"看一看宠物的人类年龄" icon:@"fy_raise_age_transform"];
    YCSettingItem *item6 = [YCSettingItemArrow itemWithTitle:@"宠物训练" subTitle:@"宠物训练大全" icon:@"fy_raise_train"];
    YCSettingGroup *group1 = [YCSettingGroup groupWithItems:@[item1,item2,item3,item4,item5,item6]];
    self.groups = [NSMutableArray arrayWithObjects:group1, nil];
}

@end
