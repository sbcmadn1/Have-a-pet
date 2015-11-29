//
//  YCSettingItemSwitch.h
//  有宠ZJZ
//
//  Created by li on 15/9/25.


#import "YCSettingItem.h"

typedef void (^YCSettingItemSwitchBlock)(BOOL on);

@interface YCSettingItemSwitch : YCSettingItem
/**
 *  记录开关的状态
 */
@property(nonatomic,assign) BOOL on;

@property(nonatomic,copy) YCSettingItemSwitchBlock stBlock;
@end
