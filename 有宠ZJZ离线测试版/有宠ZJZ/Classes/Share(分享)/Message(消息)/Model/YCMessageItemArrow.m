//
//  YCMessageItemArrow.m
//  有宠ZJZ
//


#import "YCMessageItemArrow.h"

@implementation YCMessageItemArrow
+ (instancetype) itmesWithTitel:(NSString *)title icon:(NSString *)icon desVc: (Class) desVc
{
    YCMessageItemArrow *itme=[YCMessageItemArrow itmesWithTitel:title icon:icon];
    itme.desVc=desVc;
    return itme;
    
}
+ (instancetype) itmesWithTitel:(NSString *)title  desVc:(Class)desVc
{
    
    return [YCMessageItemArrow itmesWithTitel:title icon:nil desVc:desVc];
    
}
+(instancetype) itmesWithTitel:(NSString *) title icon: (NSString *) icon subTitle:(NSString *) subTitle desVc: (Class) desVc
{

    
    YCMessageItemArrow *itme=[YCMessageItemArrow itmesWithTitel:title icon:icon subTitle:subTitle];
    itme.desVc=desVc;
    return itme;

}

@end
