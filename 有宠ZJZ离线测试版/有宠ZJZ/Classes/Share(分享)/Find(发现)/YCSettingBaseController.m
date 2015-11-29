//
//  YCSettingBaseController.m
//  有宠ZJZ
//
//  Created by li on 15/9/25.


#import "YCSettingBaseController.h"

@interface YCSettingBaseController ()

@end

@implementation YCSettingBaseController
- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置tableView的背景
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.contentInset = UIEdgeInsetsMake(-15, 0, 0, 0);
    // 隐藏分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


//设置Grouped分组   (instancetype)initWithStyle:(UITableViewStyle)style {
//                 return [super initWithStyle:UITableViewStyleGrouped];
//}

- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}
//设置Grouped分组
- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - tableView 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 根据组号获得对应的组模型
    YCSettingGroup *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获得cell
    YCSettingCell *cell = [YCSettingCell cellWithTableView:tableView];
    // 根据组号获得对应的组模型
    YCSettingGroup *group = self.groups[indexPath.section];
    // 根据行号获得对应的item模型
    YCSettingItem *item = group.items[indexPath.row];
    // 传递数据
    cell.item = item;
    // 判断cell是否要显示分割线
    cell.showLineView = !(indexPath.row == group.items.count - 1);
    return cell;
}

#pragma mark - tableView 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取消cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 根据组号获得对应的组模型
    YCSettingGroup *group = self.groups[indexPath.section];
    // 根据行号获得对应的item模型
    YCSettingItem *item = group.items[indexPath.row];
    
    // 执行代码
    if (item.operationBlock) {
        item.operationBlock();
        return;
    }
    if ([item isKindOfClass:[YCSettingItemArrow class]]) {
        YCSettingItemArrow *itemArrow = (YCSettingItemArrow *)item;
        // 获得目标控制器
        Class destVcClass = itemArrow.destVc;
        // 创建目标控制器
        UIViewController *destVc = [[destVcClass alloc] init];
        // 设置目标控制器的标题
        destVc.title = item.title;
        
        [self.navigationController pushViewController:destVc animated:YES];
        //        NSLog(@"destVc = %@",destVc);
    }
}
//调用尾部描述
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    // 根据组号获得对应的组模型
    YCSettingGroup *group = self.groups[section];
    return group.footer;
}
//调用头部描述
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // 根据组号获得对应的组模型
    YCSettingGroup *group = self.groups[section];
    return group.header;
}
@end
