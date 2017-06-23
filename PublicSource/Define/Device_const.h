

#ifndef Device_const
#define Device_const

/**
 iPad Air {{0, 0}, {768, 1024}}
 iphone4s {{0, 0}, {320, 480}}     960*640
 iphone5 5s {{0, 0}, {320, 568}}      1136*640
 iphone6 6s {{0, 0}, {375, 667}}     1334*750
 iphone6Plus 6sPlus {{0, 0}, {414, 736}}  1920*1080
 Apple Watch 1.65英寸 320*640
 */

//NavBar高度
#define NavigationBar_HEIGHT 44
#define IPHONE_FOUNT_SCALE SCREEN_WIDTH/400
#define IPHONE_WIDTH_SCALE SCREEN_WIDTH/375
#define IPHONE_HEIGHT_SCALE SCREEN_HEIGHT/667



//获取屏幕 宽度、高度
#define IPHONE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define IPHONE_HEIGHT ([UIScreen mainScreen].bounds.size.height)


/** 系统控件的默认高度 */
#define IPHONE_STATUS_H   (20.f)
#define IPHONE_NAV_H      (44.f)

#define IPHONE_KEY_BOARD_H  (216.f)
#define IPHONE_KEY_BOARD_H  (252.f)


#define YC_IS_IOS6 (SYSTEM_VERSION >= 6.0 && SYSTEM_VERSION < 7)
#define YC_IS_IOS7 (SYSTEM_VERSION >= 7.0 && SYSTEM_VERSION < 8.0)
#define YC_IS_IOS8 (SYSTEM_VERSION >= 8.0 && SYSTEM_VERSION < 9.0)
#define YC_IS_IOS9 (SYSTEM_VERSION >= 9.0 && SYSTEM_VERSION < 10.0)



//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//判断是否 Retina屏、设备是否%fhone 5、是否是iPad
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


//判断是真机还是模拟器
#if TARGET_OS_IPHONE
#endif
#if TARGET_IPHONE_SIMULATOR
#endif
