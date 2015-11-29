//
//  YCSettingItemArrow.m
//  有宠ZJZ
//
//  Created by li on 15/9/25.


#import "YCSettingItemArrow.h"

@implementation YCSettingItemArrow
+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon destVc:(Class)destVc{
    YCSettingItemArrow *arrowItem = [self itemWithTitle:title icon:icon];
    arrowItem.destVc = destVc;
    return arrowItem;
}


+(instancetype)itemWithTitle:(NSString *)title destVc:(Class)destVc{
    return [self itemWithTitle:title icon:nil destVc:destVc];
}
@end
