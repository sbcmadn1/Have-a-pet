//
//  MessageController.m
//  有宠ZJZ
//
//  Created by apple on 15/9/24.


#import "MessageController.h"
#import "YCTableViewController.h"
@interface MessageController ()


@end

@implementation MessageController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self initSegmentedControl];
   

}

+ (instancetype)messageController
{
    return [[self alloc]init];
}

- (void)initSegmentedControl
{
    NSArray *segmentedData = [[NSArray alloc]initWithObjects:@"消息",@"好友",@"关注",@"粉丝",nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedData];
    segmentedControl.frame = CGRectMake((screenW-260.0)/2.0, 25.0,260.0, 30.0);
    
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
    
    
    
    [self.view addSubview:segmentedControl];
}


@end
