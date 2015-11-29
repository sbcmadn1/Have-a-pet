//
//  YCSettingItemSwitch.m
//  有宠ZJZ
//


#import "YCSettingItemSwitch.h"

@implementation YCSettingItemSwitch
- (void)setOn:(BOOL)on {
    _on = on;
    [YCSaveDataTool saveBool:on forKey:self.title];
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.on = [YCSaveDataTool boolForKey:title];
}
@end
