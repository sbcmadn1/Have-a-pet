//
//  YCTabBarController.m
//  有宠ZJZ
//


#import "YCTabBarController.h"

@interface YCTabBarController ()

@end

@implementation YCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1. 设置tabBar的背景色，消除穿透效果
    self.tabBar.backgroundColor=[UIColor whiteColor];
    
    //2. 设置UIBarButtonItem的title的属性，可以设置颜色和字体大小等
    for (UIBarButtonItem *item in self.tabBar.items){
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
