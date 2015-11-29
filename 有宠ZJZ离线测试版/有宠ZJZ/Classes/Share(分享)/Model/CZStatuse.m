//
//  CZStatuse.m
//  15-微博案例（屏幕适配）
//


#import "CZStatuse.h"

@implementation CZStatuse

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)statuseWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

+ (NSArray *)statuses
{
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil];
    NSArray *dicts=[NSArray arrayWithContentsOfFile:filePath];
    NSMutableArray *models=[NSMutableArray array];
    for (NSDictionary *dict in dicts)
    {
        CZStatuse *statuse=[CZStatuse statuseWithDict:dict];
        [models addObject:statuse];
    }
    return models;
}

@end
