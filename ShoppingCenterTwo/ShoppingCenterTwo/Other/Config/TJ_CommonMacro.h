//
//  TJ_CommonMacro.h
//  ShoppingCenterTwo
//
//  Created by 周鑫 on 2018/11/12.
//  Copyright © 2018年 TJ. All rights reserved.
//

#ifndef TJ_CommonMacro_h
#define TJ_CommonMacro_h

#pragma mark -------------------------- Device ----------------------------------------

#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#pragma mark -------------------------- Size ----------------------------------------

// 屏幕宽、高
#define DEVICE_SCREEN_FRAME     ([UIScreen mainScreen].bounds)
#define DEVICE_SCREEN_WIDTH     ([UIScreen mainScreen].bounds.size.width)
#define DEVICE_SCREEN_HEIGHT    ([UIScreen mainScreen].bounds.size.height)

// 导航栏宽、高
#define NAVIGATIONBAR_WIDTH     DEVICE_SCREEN_WIDTH
#define NAVIGATIONBAR_HEIGHT    (iPhoneX ? 88.f : 64.f)
// 标签栏宽、高
#define TABBAR_WIDTH            DEVICE_SCREEN_WIDTH
#define TABBAR_HEIGHT          (iPhoneX ? 83.f : 49.f)
// 状态栏高度
#define STATUSBAR_HEIGHT       (iPhoneX ? 44.f : 20.f)

#define SPACE_1 15.00
#define SPACE_2 20.00
#define SPACE_3 25.00
#define SPACE_4 30.00

#pragma mark -------------------------- Colour ----------------------------------------

/** 透明度为 1 的 RGB */
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
/** RGBA */
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
/** 使用十六进制的颜色*/
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
/** 随机色 */
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

/** 常用颜色*/
#define WhiteColor [UIColor whiteColor]
#define BlackColor [UIColor blackColor] //黑色
#define ClearColor [UIColor clearColor] //无色
#define GlobalBg  RGBCOLOR(243,243,243)


//---便捷颜色---color for test---用来 Debug 的颜色
#define PurpleColor    [UIColor purpleColor]   //紫色
#define RedColor       [UIColor redColor]
#define GrayColor      [UIColor grayColor]
#define YellowColor    [UIColor yellowColor]
#define GreenColor     [UIColor greenColor]
#define MagentaColor   [UIColor magentaColor] //品红,洋红 /mə'dʒentə/
#define BlueColor      [UIColor blueColor]
#define BrownColor     [UIColor brownColor]
#define AppColor       [UIColor colorWithRed:(113)/255.0f green:(205)/255.0f blue:(207)/255.0f alpha:1]

#ifdef DEBUG
#define TJLog(xx, ...)          NSLog((@"%s [Line %d] " xx), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define TJLog(...)
#endif


#pragma mark - 获取角度、弧度
// 由角度获取弧度、有弧度获取角度
#define kDegreesToRadian(x)         (M_PI * (x) / 180.0)
#define kRadianToDegrees(radian)    (((radian) * 180.0) / (M_PI))

#define WS(weakSelf)    __weak __typeof(&*self)weakSelf = self
#define TJString(string)   NSLocalizedString(string,nil)





#endif /* TJ_CommonMacro_h */
