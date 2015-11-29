//
//  YCMessageItem.m
//  有宠ZJZ
//


#import "YCMessageItem.h"

@implementation YCMessageItem
+(instancetype) itmesWithTitel:(NSString *) title icon: (NSString *) icon
{
    
    YCMessageItem *itmes=[[self alloc]init];
    itmes.title=title;
    itmes.icon=icon;
    return itmes;
}
+ (instancetype) itmesWithTitel:(NSString *)title
{
    return [self itmesWithTitel:title icon:nil];
    
}
+ (instancetype) itmesWithTitel:(NSString *)title subTitle:(NSString *) subTitle
{
    
    
    YCMessageItem *itmes=[self itmesWithTitel:title];
    itmes.subTitle=subTitle;
    return itmes;
    
}
+(instancetype) itmesWithTitel:(NSString *) title icon: (NSString *) icon subTitle:(NSString *) subTitle
{
    YCMessageItem *itmes=[self itmesWithTitel:title icon:icon];
    itmes.subTitle=subTitle;
    
    return itmes;



}
@end
