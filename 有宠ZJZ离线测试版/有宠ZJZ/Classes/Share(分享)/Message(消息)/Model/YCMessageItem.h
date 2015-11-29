//
//  YCMessageItem.h
//  有宠ZJZ
//


#import <Foundation/Foundation.h>
typedef void (^optionBlock)();
@interface YCMessageItem : NSObject
/**
 *  标题
 */
@property (nonatomic,copy) NSString *title;

/**
 *  图标
 */
@property (nonatomic,copy) NSString *icon;
/**
 * 声明一个副标题
 */

@property (nonatomic,copy) NSString *subTitle;
/**
 *  声明一个block属性
 *
 
 */
@property (nonatomic,copy) optionBlock  optionBlock;
/**
 *  声明一个类方法让外界调用
 */

+(instancetype) itmesWithTitel:(NSString *) title icon: (NSString *) icon;
+ (instancetype) itmesWithTitel:(NSString *)title;
+ (instancetype) itmesWithTitel:(NSString *)title subTitle:(NSString *) subTitle;
+(instancetype) itmesWithTitel:(NSString *) title icon: (NSString *) icon subTitle:(NSString *) subTitle;
@end
