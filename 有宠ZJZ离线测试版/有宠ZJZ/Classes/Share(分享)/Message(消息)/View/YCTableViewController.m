//
//  YCTableViewController.m
//  有宠ZJZ
//


#import "YCTableViewController.h"
#import "MessageController.h"
#import "YCNoticeController.h"
@interface YCTableViewController ()<UINavigationControllerDelegate>

@end

@implementation YCTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSegmentedControl];
    [self.groups removeAllObjects];
    //设置tableview的背景
    self.tableView.backgroundColor= [UIColor whiteColor];
    //设置tableview的头部高度
    self.tableView.sectionHeaderHeight=0;
    self.tableView.contentInset=UIEdgeInsetsMake(0, 0, 0, 0);
    //设置隐藏系统的分割线
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    //    // 创建第二个组模型
    YCMessageItem *itme21=[YCMessageItemArrow itmesWithTitel:@"有宠资讯" icon:@"fy_find_expert" subTitle:@"报告那只仓鼠又在吃吃吃" desVc: [YCNoticeController class]];
    ;
    YCMessageItem *itme22=[YCMessageItemArrow itmesWithTitel:@"通知"  icon:@"fy_find_neighbourhoodPet"subTitle:@"花好月圆，萌宠闹中秋!" desVc: [YCNoticeController class]];
    YCMessageItem *itme23=[YCMessageItemArrow itmesWithTitel:@"有宠小助手" icon:@"fy_find_news" subTitle:@"欢迎加入有宠家庭"];
    YCMessageItem *itme24=[YCMessageItemArrow itmesWithTitel:@"赞" icon:@"fy_find_raise_book" subTitle:@"您没有新的赞哦"];
    YCMessageItem *itme25=[YCMessageItemArrow itmesWithTitel:@"评论" icon:@"fy_find_rank" subTitle:@"您没有新的评论哦"];
    YCMessageGroup *group=[YCMessageGroup groupWithItmes:@[itme21,itme22,itme23,itme24,itme25]];
    
    [self.groups addObject:group];
    
}
+ (instancetype)messageController
{
    return [[self alloc]init];
}

- (void)initSegmentedControl
{
    NSArray *segmentedData = [[NSArray alloc]initWithObjects:@"消息",@"好友",@"关注",@"粉丝",nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedData];
    segmentedControl.frame = CGRectMake((screenW-260.0)/2.0, 5,260.0, 30.0);
    self.segmentedControl=segmentedControl;
    segmentedControl.tintColor = [UIColor whiteColor];
    
    segmentedControl.selectedSegmentIndex = 0;//默认选中的按钮索引
    
    
    /*
     下面的代码实同正常状态和按下状态的属性控制,比如字体的大小和颜色等
     */
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:12],NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName,  nil];
    
    
    [segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor redColor] forKey:NSForegroundColorAttributeName];
    
    [segmentedControl setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    
    
    
    //设置分段控件点击相应事件
    [segmentedControl addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged];
    
    
    
    [self.navigationController.navigationBar addSubview:segmentedControl];
    
}

- (void)doSomethingInSegment:(UISegmentedControl *)Seg
{
    //    [self.childViewControllers firstObject];
    //YCTableViewController *vc = (YCTableViewController *)self.topViewController;
   NSInteger Index = Seg.selectedSegmentIndex;
   // vc.index = self.index;
    //   // NSLog(@"%ld",(long)self.index);
    //    YCTableViewController *Vc=[YCTableViewController TableViewController]; ==self
    //    self.index=self.index;
    //    [Vc indexChange];
    switch (Index)
    {
        case 0:
            [self MessageTableView];
            
           
            break;
        case 1:
           
            [self FriendsTableView];
            
            
           
            break;
        case 2:
            [self AttentionsTableView];
            break;
        case 3:
            [self FansTableView];
           
            break;
        default:
            break;
    }

    
    
}


+ (instancetype)TableViewController
{
   return [[self alloc]init];

}
- (void) MessageTableView
{
    
   [self.groups removeAllObjects];
    //设置tableview的背景
    self.tableView.backgroundColor= [UIColor whiteColor];
    //设置tableview的头部高度
    self.tableView.sectionHeaderHeight=0;
    self.tableView.contentInset=UIEdgeInsetsMake(64, 0, 0, 0);
    //设置隐藏系统的分割线
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;

//    // 创建第二个组模型
    YCMessageItem *itme21=[YCMessageItemArrow itmesWithTitel:@"有宠资讯" icon:@"fy_find_expert" subTitle:@"报告那只仓鼠又在吃吃吃" desVc: [YCNoticeController class]];
    ;
    YCMessageItem *itme22=[YCMessageItemArrow itmesWithTitel:@"通知"  icon:@"fy_find_neighbourhoodPet"subTitle:@"花好月圆，萌宠闹中秋!" desVc: [YCNoticeController class]];
    YCMessageItem *itme23=[YCMessageItemArrow itmesWithTitel:@"有宠小助手" icon:@"fy_find_news" subTitle:@"欢迎加入有宠家庭"];
    YCMessageItem *itme24=[YCMessageItemArrow itmesWithTitel:@"赞" icon:@"fy_find_raise_book" subTitle:@"您没有新的赞哦"];
    YCMessageItem *itme25=[YCMessageItemArrow itmesWithTitel:@"评论" icon:@"fy_find_rank" subTitle:@"您没有新的评论哦"];
    YCMessageGroup *group=[YCMessageGroup groupWithItmes:@[itme21,itme22,itme23,itme24,itme25]];
    
    [self.groups addObject:group];
    [self.tableView reloadData];


}
- (void) FriendsTableView
{
    [self.groups removeAllObjects];
    NSLog(@"%@",self.groups);
       self.groups=nil;
   // [self.tableView removeFromSuperview];
    //设置tableview的背景
     self.tableView.backgroundColor= [UIColor whiteColor];
    //设置tableview的头部高度
    self.tableView.sectionHeaderHeight=0;
     self.tableView.contentInset=UIEdgeInsetsMake(64, 0, 0, 0);
    //设置隐藏系统的分割线
     self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    
     //创建第二个组模型
    YCMessageItem *itme21=[YCMessageItemArrow itmesWithTitel:@"添加好友" icon:@"fy_find_expert" subTitle:@""];
    ;
    YCMessageGroup *group1=[YCMessageGroup groupWithItmes:@[itme21]];
    NSLog(@"2--%@",self.groups);
   [self.groups addObject:group1];
    [self.tableView reloadData];
    
}
- (void) AttentionsTableView
{
    [self.groups removeAllObjects];
    //设置tableview的背景
    self.tableView.backgroundColor= [UIColor whiteColor];
    //设置tableview的头部高度
    self.tableView.sectionHeaderHeight=0;
    self.tableView.contentInset=UIEdgeInsetsMake(64, 0, 0, 0);
    //设置隐藏系统的分割线
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
   YCMessageItem *itme21=[YCMessageItemArrow itmesWithTitel:@"添加好友" icon:@"fy_find_expert" subTitle:@""];    ;
    YCMessageGroup *group1=[YCMessageGroup groupWithItmes:@[itme21]];
    [self.groups addObject:group1];
    [self.tableView reloadData];
    
    
}
- (void) FansTableView
{
    [self.groups removeAllObjects];
    //设置tableview的背景
    self.tableView.backgroundColor= [UIColor whiteColor];
    //设置tableview的头部高度
    self.tableView.sectionHeaderHeight=0;
    self.tableView.contentInset=UIEdgeInsetsMake(64, 0, 0, 0);
    //设置隐藏系统的分割线
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
   YCMessageItem *itme21=[YCMessageItemArrow itmesWithTitel:@"添加好友" icon:@"fy_find_expert" subTitle:@""];  
    YCMessageGroup *group1=[YCMessageGroup groupWithItmes:@[itme21]];
    [self.groups addObject:group1];
    [self.tableView reloadData];
    
    
}

- (void)dealloc {
    NSLog(@"dealloc");
}

@end
