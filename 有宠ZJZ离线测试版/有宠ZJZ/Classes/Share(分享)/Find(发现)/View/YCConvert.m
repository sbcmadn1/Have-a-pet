//
//  YCConvert.m
//  有宠ZJZ
//
//  Created by li on 15/9/29.


#import "YCConvert.h"
#import "YCChongBi.h"

@interface YCConvert ()

@end

@implementation YCConvert
 
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"我的宠币" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemClick)];
    
    
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    // 创建第一个组模型
    YCSettingItem *item1=[YCSettingItemArrow itemWithTitle:@"专家在线" subTitle:@"宠物专家为您解答各类养宠问题" icon:@"fy_find_expert"];
    YCSettingGroup *group1=[YCSettingGroup groupWithItems:@[item1]];
    
    self.groups = [NSMutableArray arrayWithObjects:group1, nil];

}


- (void)rightBarButtonItemClick
{
    //把想要显示的所在控制器，push到导航控制器的子控制器中
    [self.navigationController pushViewController:[[YCChongBi alloc] init] animated:YES];
    

}

@end
