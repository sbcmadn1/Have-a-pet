//
//  ViewController.m
//  有宠1.0
//

#import "YCShareController.h"
#import "YCShareNavigationBarView.h"
#import "YCCarefullyChosenView.h"
#import "YCAttentionView.h"
#import "YCFirstNewView.h"

@interface YCShareController () <UIScrollViewDelegate,YCShareNavigationBarViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic,weak) YCShareNavigationBarView *navigationBarView;

@end

@implementation YCShareController

#pragma mark - viewDidLoad方法
- (void)viewDidLoad {
    [super viewDidLoad];
   
    //1.设置分享模块的导航栏
    YCShareNavigationBarView *navigationBarView=[YCShareNavigationBarView shareNavigationBarView];
    navigationBarView.frame=CGRectMake(0, -20, screenW, 64);
    navigationBarView.delegate=self;
    [self.navigationController.navigationBar addSubview:navigationBarView];
    self.navigationBarView=navigationBarView;
    
    
    //2.创建scrollView
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:self.view.frame];
    //设置scrollView属性
    scrollView.bounces=NO;
    scrollView.delegate=self;
    scrollView.pagingEnabled=YES;
    scrollView.contentSize=CGSizeMake(screenW*3, screenH);
    //这里不再使用设置contentOffset，使用设置scrollView在storyboard中的under top Bars属性，取消勾选该属性，让scrollView的起始位置从导航栏下边开始，勾选的话是从View的顶部开始
//    scrollView.contentOffset=CGPointMake(0, -64);
  
    //3.1. 添加CarefullyChosenView到scrollView中
    YCCarefullyChosenView *carefullyChosenView=[YCCarefullyChosenView carefullyChosenView];
    [scrollView addSubview:carefullyChosenView];
    
    //3.2. 添加attentionView到scrollView中
    YCAttentionView *attentionView=[YCAttentionView attentionView];
    [scrollView addSubview:attentionView];
    
    //3.2. 添加attentionView到scrollView中
    YCFirstNewView *firstNewView=[YCFirstNewView firstNewView];
    [scrollView addSubview:firstNewView];
    
    //4. 添加scrollView到当前控制器的view中
    [self.view addSubview:scrollView];
    self.scrollView=scrollView;

}

#pragma mark - YCShareNavigationBarViewDelegate方法

- (void)shareNavigationBarView:(YCShareNavigationBarView *)barView DidClickBtnType:(YCShareType)type
{
    //取消代理，防止点击按钮切换界面时引发scrollView滚动，又会反过来引发下划线移动
    self.scrollView.delegate=nil;
    if (type==YCShareTypeCarefully)
    {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        
    }
    else if (type==YCShareTypeAttention)
    {
        [self.scrollView setContentOffset:CGPointMake(screenW, 0) animated:YES];
    }
    else if (type==YCShareTypeNew)
    {
        [self.scrollView setContentOffset:CGPointMake(2*screenW, 0) animated:YES];
    }
    //用GCD延时0.5秒后重新指定scrollView的代理为当前控制器，唤醒拖动鼠标切换界面的功能
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.scrollView.delegate=self;
    });
    
}

#pragma mark - UIScrollViewDelegate方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.navigationBarView.offsetX=scrollView.contentOffset.x;
}



@end
