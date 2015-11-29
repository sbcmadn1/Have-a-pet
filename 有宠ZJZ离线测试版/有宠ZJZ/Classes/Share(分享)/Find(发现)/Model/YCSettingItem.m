//
//  YCSettingItem.m
//  有宠ZJZ
//
//  Created by li on 15/9/25.


#import "YCSettingItem.h"

@implementation YCSettingItem
+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon{
    YCSettingItem *item = [[self alloc] init];
    item.title = title;
    item.icon = icon;
    return item;
}

+(instancetype)itemWithTitle:(NSString *)title{
    return [self itemWithTitle:title icon:nil];
}

+(instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle{
    YCSettingItem *item = [self itemWithTitle:title];
    item.subTitle = subTitle;
    return item;
}
+(instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle icon:(NSString *)icon destVc:(Class)destVc{
    
    YCSettingItem *item = [self itemWithTitle:title];
    item.subTitle = subTitle;
    item.icon = icon;
    item.destVc=destVc;
    return item;
}
+(instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle icon:(NSString *)icon{

    YCSettingItem *item = [self itemWithTitle:title];
    item.subTitle = subTitle;
    item.icon = icon;
    return item;

}

@end
