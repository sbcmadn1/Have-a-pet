//
//  YCSettingItemArrow.h
//  有宠ZJZ
//
//  Created by li on 15/9/25.


#import "YCSettingItem.h"

@interface YCSettingItemArrow : YCSettingItem
/**
 *  要跳转的目标控制器
 */
//@property(nonatomic,copy) NSString *destVc;
@property(nonatomic,assign) Class destVc;

+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon destVc:(Class)destVc;
+(instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle icon:(NSString *)icon destVc:(Class)destVc;
+(instancetype)itemWithTitle:(NSString *)title destVc:(Class)destVc;
@end
