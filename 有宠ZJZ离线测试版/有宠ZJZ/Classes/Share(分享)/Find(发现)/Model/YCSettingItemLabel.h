//
//  YCSettingItemLabel.h
//  有宠ZJZ
//


#import "YCSettingItem.h"

@interface YCSettingItemLabel : YCSettingItem

@property(nonatomic,copy) NSString *text;

+(instancetype)itemWithTitle:(NSString *)title text:(NSString *)text;

+(instancetype)itemWithTitle:(NSString *)title defaultValue:(NSString *)defaultValue;
@end
