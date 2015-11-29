//
//  YCSettingGroup.m
//  有宠ZJZ
//
//  Created by li on 15/9/25.


#import "YCSettingGroup.h"

@implementation YCSettingGroup
+(instancetype)groupWithItems:(NSArray *)items{
    YCSettingGroup *group = [[self alloc] init];
    group.items = items;
    return group;
}
@end
