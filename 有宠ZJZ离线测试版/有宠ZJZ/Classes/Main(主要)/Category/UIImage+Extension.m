//
//  UIImage+Extension.m
//  04-图片裁剪
//
//  Created by apple on 15/3/20.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+(instancetype)circleImageWithName:(NSString *)imageName{
    // 0.加载图片
    UIImage *image = [UIImage imageNamed:imageName];
    // 1.创建图片上下文
    UIGraphicsBeginImageContext(image.size);
    // 绘制圆
    // 下面代码获得的上下文就是上一行代码开启的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, image.size.width, image.size.height));
    CGContextClip(ctx);
    
    // 2.绘制图片
    [image drawAtPoint:CGPointZero];
    // 3.获得图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 6.关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}


+(instancetype)circleImageWithName:(NSString *)imageName borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor{
    // 1.加载图片
    UIImage *image = [UIImage imageNamed:imageName];
    
    // 2.开启图形上下文
    CGFloat marginX = borderWidth;
    CGFloat marginY = marginX;
    CGFloat contextW = image.size.width + marginX;
    CGFloat contextH = image.size.height + marginY;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(contextW, contextH), NO, 0.0);
    
    // 3.绘制大圆
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, contextW, contextH));
    [borderColor set];
    CGContextFillPath(ctx);
    
    // 3.1 绘制小圆
    CGContextAddEllipseInRect(ctx, CGRectMake(marginX * 0.5, marginY * 0.5, image.size.width, image.size.height));
    CGContextClip(ctx);
    
    // 3.2 绘制图片
    [image drawAtPoint:CGPointMake(marginX * 0.5, marginY * 0.5)];
    
    // 从当前上下文获得图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    // 6.关闭上下文
    UIGraphicsEndImageContext();
    
    return  newImage;
    
}
@end
