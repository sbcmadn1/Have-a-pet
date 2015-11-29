//
//  YCScoreLiveViewController.m
//  有宠ZJZ
//


#import "YCScoreLiveViewController.h"

@implementation YCScoreLiveViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建第一个组模型
    YCSettingItemSwitch *item1 = [YCSettingItemSwitch itemWithTitle:@"推送我关注的比赛" ];
    YCSettingGroup *group1 = [YCSettingGroup groupWithItems:@[item1]];
    // 设置尾部描述
    self.groups = [NSMutableArray arrayWithObjects:group1, nil];
}


@end
