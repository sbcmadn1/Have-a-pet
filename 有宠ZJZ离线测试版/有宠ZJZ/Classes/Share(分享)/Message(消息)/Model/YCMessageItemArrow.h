//
//  YCMessageItemArrow.h
//  有宠ZJZ
//


#import "YCMessageItem.h"

@interface YCMessageItemArrow : YCMessageItem
/**
 *  需要跳转的控制器
 *
 */
@property (nonatomic ,strong) Class desVc;
+ (instancetype) itmesWithTitel:(NSString *)title icon:(NSString *)icon desVc: (Class) desVc;

+ (instancetype) itmesWithTitel:(NSString *)title  desVc:(Class)desVc;

+(instancetype) itmesWithTitel:(NSString *) title icon: (NSString *) icon subTitle:(NSString *) subTitle desVc: (Class) desVc;

@end
