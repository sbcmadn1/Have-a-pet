//utf-8;134217984Extension.h
//  04-图片裁剪
//
//  Created by apple on 15/3/20.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
+(instancetype)circleImageWithName:(NSString *)imageName;

/**
 *  根据imageName裁剪图片
 *
 *  @param imageName   图片名
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 */
+(instancetype)circleImageWithName:(NSString *)imageName borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
@end
