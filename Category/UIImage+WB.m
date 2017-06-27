//
//  UIImage+WB.m
//  8期微博
//
//  Created by apple on 14-8-31.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "UIImage+WB.h"

@implementation UIImage (WB)


+ (instancetype)resizableImageWithName:(NSString *)imageName
{
    /*
    // 1.创建图片
    UIImage *image = [UIImage imageWithName:imageName];
    // 2.处理图片
    image =  [image stretchableImageWithLeftCapWidth:0.5 topCapHeight:0.5];
    // 3.返回图片
    return image;
     */
    
    return [self resizableImageWithName:imageName leftRatio:0.5 topRatio:0.5];
    
    
}

+ (instancetype)resizableImageWithName:(NSString *)imageName leftRatio:(CGFloat)leftRatio topRatio:(CGFloat)topRatio
{
    // 1.创建图片
    UIImage *image = [UIImage imageNamed:imageName];
    // 2.处理图片
    CGFloat left = image.size.width * leftRatio;
    CGFloat top = image.size.height * topRatio;
    
    image =  [image stretchableImageWithLeftCapWidth:left topCapHeight:top];
//    [image stretchableImageWithLeftCapWidth:<#(NSInteger)#> topCapHeight:<#(NSInteger)#>]
//    [image resizableImageWithCapInsets:<#(UIEdgeInsets)#>]
//    [image resizableImageWithCapInsets:<#(UIEdgeInsets)#> resizingMode:<#(UIImageResizingMode)#>]
    // 3.返回图片
    return image;
}
//颜色转图片方法
+(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
