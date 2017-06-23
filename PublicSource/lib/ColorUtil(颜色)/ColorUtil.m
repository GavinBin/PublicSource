//
//  ColorUtil.m
//  aqgj_dial
//
//  Created by chenq on 11-12-21.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "ColorUtil.h"

@implementation ColorUtil


+ (UIColor *)getColor:(NSString *)hexColor alpha:(CGFloat)alpha
{
	unsigned int red, green, blue;
	NSRange range;
	range.length = 2;
	
	range.location = 0; 
	[[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
	range.location = 2; 
	[[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
	range.location = 4; 
	[[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];	
	
	return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:alpha];
}

+ (UIColor *)getColor:(NSString *)hexColor
{
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:1];
}

UIColor *navigationColor = nil;
+ (void)setNavigationColor:(UIColor *)color
{
    navigationColor = color;
}

+ (UIColor *)getNavigationColor
{
    return navigationColor;
}

UIColor *backgroundColor = nil;
+ (void)setBackgroundColor:(UIColor *)color
{
    backgroundColor = color;
}

+ (UIColor *)getBackgroundColor
{
    return backgroundColor;
}

NSInteger  colorRow = 0;
+ (NSInteger)getColorRow
{
    return colorRow;
}

+ (void)setColorRow:(NSInteger)cRow
{
    NSString   *tempRow = [NSString stringWithFormat:@"%zd",cRow];
    [[NSUserDefaults standardUserDefaults] setObject:tempRow forKey:@"navigationColorRow"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    colorRow = cRow;
}

@end
