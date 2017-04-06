//
//  Const.h
//      CCFreshStoreApp
//      Chen Chen @ March 27th, 2017
//

#import <UIKit/UIKit.h>
#import "UIColor+CCTools.h"

#ifndef Const_h
#define Const_h

#pragma mark - 界面常数

/// 视图窄边缘: 5
static const CGFloat kViewEdge = 5;
/// 视图内边距: 10
static const CGFloat kViewPadding = 10;
/// 视图宽边缘: 20
static const CGFloat kViewBorder = 20;
/// 视图外间距: 30
static const CGFloat kViewMargin = 30;
/// 视图适应距离: 60
static const CGFloat kViewAdapter = 60;
/// 视图标准距离: 100
static const CGFloat kViewStandard = 100;
/// 视图移动距离: 160
static const CGFloat kViewDistance = 160;
/// 屏幕尺寸: iPhone4/4s: 320-480 iPhone5/5s: 320-568 iPhone6/6s: 375-667 iPhone6/6s Plus: 414-736
#define kScreenFrame [[UIScreen mainScreen] bounds]
/// 屏幕宽度: 320/375/414
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
/// 屏幕高度: 480/568/667/736
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
/// 状态栏高度: 20
static const CGFloat kStatusBarHeight = 20;
/// 导航栏高度: 44
static const CGFloat kNavigationBarHeight = 44;
/// 顶端高度: 64
static const CGFloat kTopHeight = 64;
/// 可用高度: 64
#define kAvailableHeight = (kScreenHeight - kTopHeight)
/// 键盘高度: 238
static const CGFloat kKeyboardHeight = 238;

#pragma mark - 颜色常数

/// App主颜色：0000FF
#define kMainColor [UIColor colorWithHexString:@"#157EFB"]
/// 通用浅颜色: White
#define kCommonLightColor [UIColor whiteColor]
/// 通用深颜色: Black
#define kCommonDarkColor [UIColor whiteColor]
/// 透明背景颜色: Clear
#define kClearColor [UIColor clearColor]

#endif /* Const_h */
