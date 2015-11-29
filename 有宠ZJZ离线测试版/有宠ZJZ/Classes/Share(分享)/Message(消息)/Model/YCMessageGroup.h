//
//  YCMessageGroup.h
//  有宠ZJZ
//

#import <Foundation/Foundation.h>

@interface YCMessageGroup : NSObject
/**
 *  数组中装的是JYSettingItem
 */
@property(nonatomic,strong) NSArray *itmes;
/**
 *  头部描述
 */
@property(nonatomic,copy) NSString *header;
/**
 *  尾部描述
 */
@property (nonatomic,copy) NSString *footer;
/**
 *  声明一个类方法给外界调用
 *
 *  @param itmes <#itmes description#>
 *
 *  @return <#return value description#>
 */
+ (instancetype) groupWithItmes:(NSArray *) itmes;

@end
