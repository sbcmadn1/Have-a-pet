//
//  YCSettingBaseController.h
//  有宠ZJZ
//
//  Created by li on 15/9/25.

#import <UIKit/UIKit.h>
#import "YCSettingGroup.h"
#import "YCSettingItem.h"
#import "YCSettingItemArrow.h"
#import "YCSettingItemSwitch.h"
#import "YCSettingItemLabel.h"
#import "YCSettingCell.h"

@interface YCSettingBaseController : UITableViewController
/**
 *  装所有的组模型数组
 */
@property(nonatomic,strong) NSMutableArray *groups;
@end
