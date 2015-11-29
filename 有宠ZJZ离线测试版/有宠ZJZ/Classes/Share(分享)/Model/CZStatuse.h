//
//  CZStatuse.h
//  15-微博案例（屏幕适配）
//


#import <Foundation/Foundation.h>

@interface CZStatuse : NSObject

@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign,getter=isVip) BOOL vip;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *picture;

@property (nonatomic,assign) BOOL isAttention;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)statuseWithDict:(NSDictionary *)dict;

+ (NSArray *)statuses;

@end
