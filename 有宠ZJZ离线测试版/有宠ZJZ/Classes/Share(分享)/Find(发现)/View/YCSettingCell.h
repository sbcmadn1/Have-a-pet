//
//  YCSettingCell.h
//  有宠ZJZ
//


#import <UIKit/UIKit.h>
@class YCSettingItem;
@interface YCSettingCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;
/**
 *  用来接受外界传人的模型数据
 */
@property(nonatomic,strong) YCSettingItem *item;
/**
 *  是否显示分割线 YES:显示 NO:不显示
 */
@property(nonatomic,assign) BOOL showLineView;
@end
