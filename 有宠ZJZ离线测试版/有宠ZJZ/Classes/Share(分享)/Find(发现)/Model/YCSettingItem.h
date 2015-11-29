//
//  YCSettingItem.h
//  有宠ZJZ
//
//  Created by li on 15/9/25.


#import <Foundation/Foundation.h>

typedef void (^YCSettingOperationBlock)();

@interface YCSettingItem : NSObject
/**
 *  标题
 */
@property(nonatomic,copy) NSString *title;
/**
 *  子标题
 */
@property(nonatomic,copy) NSString *subTitle;

/**
 *  图标
 */
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,assign) Class destVc;

//@property(nonatomic,assign) HMSettingItemType type;

@property(nonatomic,copy) YCSettingOperationBlock operationBlock;

+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon;
+(instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle;
+(instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle icon:(NSString *)icon destVc:(Class)destVc;
+(instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle icon:(NSString *)icon;
+(instancetype)itemWithTitle:(NSString *)title;
@end
