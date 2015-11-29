//
//  YCSettingItemLabel.m
//  有宠ZJZ
//
//  Created by li on 15/9/25.


#import "YCSettingItemLabel.h"

@implementation YCSettingItemLabel
+(instancetype)itemWithTitle:(NSString *)title defaultValue:(NSString *)defaultValue{
    YCSettingItemLabel *labelItem = [self itemWithTitle:title];
    if (labelItem.text.length == 0) { // 没有值，则使用默认值
        labelItem.text = defaultValue;
    }
    return labelItem;
}

+(instancetype)itemWithTitle:(NSString *)title text:(NSString *)text{
    YCSettingItemLabel *labelItem = [self itemWithTitle:title];
    labelItem.text = text;
    return labelItem;
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.text = [YCSaveDataTool valueForKey:title];
}

- (void)setText:(NSString *)text {
    _text = text;
    [YCSaveDataTool saveValue:text forKey:self.title];
}
@end
