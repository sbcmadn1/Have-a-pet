//
//  YCNavigationController.m
//  有宠ZJZ
//

#import "YCNavigationController.h"

@implementation YCNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}


/**
 *  第一次使用这个类的时候调用
 */
+ (void)initialize
{
    UINavigationBar *navBar=[UINavigationBar appearance];
    //设置导航栏背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavigationBar_image"] forBarMetrics:UIBarMetricsDefault];
     //设置导航栏标题
    navBar.tintColor=[UIColor whiteColor];
    navBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:YCWshySize(18)};
    //设置导航栏按钮文字样式
    UIBarButtonItem *barItem=[UIBarButtonItem appearance];
    [barItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:YCWshySize(14)} forState:UIControlStateNormal];
}

@end
