//
//  YCMessageGroup.m
//  有宠ZJZ
//


#import "YCMessageGroup.h"

@implementation YCMessageGroup
+ (instancetype) groupWithItmes:(NSArray *) itmes
{
    YCMessageGroup *group=[[self alloc]init];
    group.itmes=itmes;
    return group;
    
}

@end
