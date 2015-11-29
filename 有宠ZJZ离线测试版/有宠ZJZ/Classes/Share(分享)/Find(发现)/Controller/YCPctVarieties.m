//
//  YCPctVarieties.m
//  有宠ZJZ
//


#import "YCPctVarieties.h"

@implementation YCPctVarieties
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    // 创建第一个组模型
    YCSettingItemArrow *item1 =[YCSettingItemArrow itemWithTitle:@"狗狗" icon:@"sound02"];
    YCSettingItem *item2 = [YCSettingItemArrow itemWithTitle:@"猫猫" icon:@"sound07"];
    YCSettingItem *item3 = [YCSettingItemArrow itemWithTitle:@"兔子" icon:@"sound08"];
    YCSettingItem *item4 = [YCSettingItemArrow itemWithTitle:@"鼠类" icon:@"sound03"];
    YCSettingItem *item5 = [YCSettingItemArrow itemWithTitle:@"其它" icon:@"sound10"];
    YCSettingGroup *group1 = [YCSettingGroup groupWithItems:@[item1,item2,item3,item4,item5]];
    self.groups = [NSMutableArray arrayWithObjects:group1, nil];
    

    
}
@end
