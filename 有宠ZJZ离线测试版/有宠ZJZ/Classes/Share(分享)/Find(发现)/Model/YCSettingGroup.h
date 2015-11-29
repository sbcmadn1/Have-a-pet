//
//  YCSettingGroup.h
//  有宠ZJZ
//
//  Created by li on 15/9/25.


#import <Foundation/Foundation.h>

@interface YCSettingGroup : NSObject
/**
 *  数组中装的元素都是HMSettingItem
 */
@property(nonatomic,strong) NSArray *items;
/**
 *  头部描述
 */
@property(nonatomic,copy) NSString *header;
/**
 *  尾部描述
 */
@property(nonatomic,copy) NSString *footer;

+(instancetype)groupWithItems:(NSArray *)items;
@end
