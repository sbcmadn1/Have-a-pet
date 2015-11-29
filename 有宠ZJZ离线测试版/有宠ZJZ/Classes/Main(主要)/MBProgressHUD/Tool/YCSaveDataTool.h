//
//  YCSaveDataTool.h
//  有宠ZJZ
//
//  Created by li on 15/9/25.

//

#import <Foundation/Foundation.h>

@interface YCSaveDataTool : NSObject

+(void)saveBool:(BOOL)b forKey:(NSString *)key;
+(BOOL)boolForKey:(NSString *)key;

+(void)saveValue:(NSString *)value forKey:(NSString *)key;
+(NSString *)valueForKey:(NSString *)key;
@end
