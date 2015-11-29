//
//  YCSaveDataTool.m
//  有宠ZJZ
//
//  Created by li on 15/9/25.

//

#import "YCSaveDataTool.h"

@implementation YCSaveDataTool
+(void)saveBool:(BOOL)b forKey:(NSString *)key{
    // 保存数据到偏好设置
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:b forKey:key];
    [defaults synchronize];
}

+(BOOL)boolForKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:key];
}

+(void)saveValue:(NSString *)value forKey:(NSString *)key{
    if (key.length == 0) return;
    // 保存数据到偏好设置
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
    [defaults synchronize];
}


+(NSString *)valueForKey:(NSString *)key{
    if (key.length == 0) return nil;
    // 保存数据到偏好设置
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}
@end
