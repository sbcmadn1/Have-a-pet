//
//  YCMesBaseTableViewController.m
//  有宠ZJZ
//


#import "YCMesBaseTableViewController.h"
#import "YCMessageGroup.h"
#import "YCMessageItem.h"
#import "YCMessageItemArrow.h"
#import "YCMesBaseCell.h"
@interface YCMesBaseTableViewController ()

@end

@implementation YCMesBaseTableViewController

/**
 *  创建加载方法，在创建加载的时候设置tableview的类型
 */
- (instancetype) init
{
    
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    
    return [super  initWithStyle:UITableViewStyleGrouped];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
//    //设置tablevie的背景色
//    self.tableView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
//    self.tableView.sectionFooterHeight=15;
//    self.tableView.sectionHeaderHeight=0;
//    self.tableView.contentInset=UIEdgeInsetsMake(-25, 0, 0, 0);
//    
//    //设置分割线样式
//    self.tableView.separatorStyle=UITableViewCellSelectionStyleNone;
    
}

- (NSMutableArray *) groups
{
    if (_groups==nil)
    {
        _groups=[NSMutableArray array];
    }
    
    return _groups;
}

#pragma mark -数据源方法


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    YCMessageGroup *group=self.groups[section];
   
    //获得itme的数据
    YCMessageItem *item=group.itmes[0];
    NSLog(@"%@",item.title);
    return group.itmes.count;
    
}
//创建cell
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"?");
    //创建cell
    YCMesBaseCell *cell=[YCMesBaseCell cellWithTableView:tableView];
    //获得数组模型
    YCMessageGroup *group=self.groups[indexPath.section];
    //获得itme的数据
    YCMessageItem *item=group.itmes[indexPath.row];
    //传递数据
    cell.item=item;
    //设置分割线的是否隐藏
    
    cell.showLineView=!(indexPath.row==group.itmes.count-1);
    return cell;
    
}
#pragma  mark ----设置代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获得模型数据
    YCMessageGroup *group=self.groups[indexPath.section];
    YCMessageItem *item=group.itmes[indexPath.row];
    //创建控器
    if (item.optionBlock)
    {
        item.optionBlock();
        return;
    }
    
    
    
    if ([item  isKindOfClass:[YCMessageItemArrow class]])
    {
        YCMessageItemArrow *itemArrow=(YCMessageItemArrow *)item;
        UIViewController *desVc=[[itemArrow.desVc alloc]init];
        //设置标题
        desVc.title=itemArrow.title;
        [self.navigationController pushViewController:desVc animated:YES];
        
    }
   // [self.tableView reloadData];
    
}
/**
 *  尾部控件
 */
- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    //根据组号获得相应的模型
    YCMessageGroup *group=self.groups[section];
    return group.footer;
    
    
    
    
}
/**
 *  头部控件
 */
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    YCMessageGroup *group=self.groups[section];
    return group.header;
    
    
}

@end
