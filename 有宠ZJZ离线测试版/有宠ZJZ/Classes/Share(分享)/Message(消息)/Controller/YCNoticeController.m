//
//  YCNoticeController.m
//  有宠ZJZ
//


#import "YCNoticeController.h"
#import "YCTableViewController.h"
@interface YCNoticeController ()

@end

@implementation YCNoticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (UIView *view in self.navigationController.navigationBar.subviews)
    {
        if ([view isKindOfClass:[UISegmentedControl class]])
        {
            [view removeFromSuperview];
        }
    }
    
    self.tableView.contentInset=UIEdgeInsetsMake(-35, 0, 0, 0);
   
   
//    [[UIBarButtonItem appearance]setBackButtonBackgroundImage:backButtomImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    [[UIBarButtonItem appearance]setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];

        /**
     *  创建模型数据
     */
    YCMessageItem *itme21=[YCMessageItemArrow itmesWithTitel:@"有宠资讯" icon:@"fy_find_expert" subTitle:@"报告那只仓鼠又在吃吃吃"];
    ;
    YCMessageItem *itme22=[YCMessageItemArrow itmesWithTitel:@"通知"  icon:@"fy_find_neighbourhoodPet"subTitle:@"花好月圆，萌宠闹中秋!"];
   
    YCMessageGroup *group=[YCMessageGroup groupWithItmes:@[itme21,itme22]];
    
    [self.groups addObject:group];
    
    
}
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    if (self.tableView.tableHeaderView == nil) {
//        // 设置头部控件
//        self.tableView.tableHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"JYOpenPushHeaderView" owner:nil options:nil] lastObject];
//    }
//}



@end
