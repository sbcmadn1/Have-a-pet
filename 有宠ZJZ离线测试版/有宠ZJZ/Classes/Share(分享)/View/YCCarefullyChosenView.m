//
//  YCCarefullyChosenView.m
//  有宠ZJZ
//


#import "YCCarefullyChosenView.h"
#import "CZStatuse.h"
#import "CZStatuseCell.h"
#import "CZHeaderView.h"
#import "YCCareSectionHeaderView.h"

@interface YCCarefullyChosenView () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *statuses;
@property (nonatomic,weak) CZStatuseCell *cell;
@end

@implementation YCCarefullyChosenView

+ (instancetype)carefullyChosenView
{
    YCCarefullyChosenView *carefullyChosenView=[[YCCarefullyChosenView alloc] init];
    carefullyChosenView.frame=CGRectMake(0, 0, screenW, screenH);
    carefullyChosenView.contentInset=UIEdgeInsetsMake(0, 0, 110, 0);
    carefullyChosenView.tableHeaderView=[CZHeaderView headerView];
    carefullyChosenView.dataSource=carefullyChosenView;
    carefullyChosenView.delegate=carefullyChosenView;
    carefullyChosenView.backgroundColor=YCColor(240, 240, 240);
    return carefullyChosenView;
}

#pragma mark - 懒加载数据源

- (NSArray *)statuses
{
    if (_statuses==nil)
    {
        _statuses=[CZStatuse statuses];
    }
    return _statuses;
}

#pragma mark - tableView数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.statuses.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CZStatuse *statuse=self.statuses[indexPath.section];
    
    CZStatuseCell *cell=[[NSBundle mainBundle]loadNibNamed:@"CZStatuseCell" owner:nil options:nil].lastObject;
    
    cell.statuse=statuse;
    
    self.cell=cell;
    
    return cell;
}

#pragma mark - UITableViewDelegate 代理方法

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
     CZStatuse *statuse=self.statuses[section];
    
    YCCareSectionHeaderView *sectionHeaderView=[YCCareSectionHeaderView sectionHeaderView];
    
    sectionHeaderView.statuse=statuse;
    
    return sectionHeaderView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    CZStatuse *statuse=self.statuses[indexPath.row];
    [self.cell layoutIfNeeded];
    
//    return CGRectGetMaxY(self.cell.textView.frame)+self.cell.pictureHeight+(statuse.picture==nil?10:20);
    return self.cell.pictureHeight+10;
    
}

//预估所有单元格的行高，使程序不用加载不显示的行，需要显示时再根据上面的heightForRowAtIndexPath方法计算出准确的行高进行加载
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
