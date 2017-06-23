//
//  ColorUtil.h
//
//  Created by chenq on 11-12-21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorUtil : NSObject

+ (UIColor *)getColor:(NSString *)hexColor alpha:(CGFloat)alpha;
+ (UIColor *)getColor:(NSString *)hexColor;
+ (void)setNavigationColor:(UIColor *)color;
+ (UIColor *)getNavigationColor;

+ (void)setBackgroundColor:(UIColor *)color;
+ (UIColor *)getBackgroundColor;
+ (NSInteger)getColorRow;
+ (void)setColorRow:(NSInteger)cRow;

@end
