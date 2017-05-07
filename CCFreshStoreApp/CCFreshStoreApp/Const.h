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

/// 屏幕尺寸: iPhone4/4s: 320-480 iPhone5/5s: 320-568 iPhone6/6s: 375-667 iPhone6/6s Plus: 414-736
#define kScreenFrame [[UIScreen mainScreen] bounds]
/// 屏幕宽度: 320/375/414
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
/// 屏幕高度: 480/568/667/736
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
/// 状态栏高度: 20
#define kStatusBarHeight 20
/// 导航栏高度: 44
#define kNavigationBarHeight 44;
/// 顶端高度: 64
#define kTopHeight 64
/// 可用高度: 屏幕高度-顶端高度
#define kAvailableHeight (kScreenHeight - kTopHeight)
/// 键盘高度: 238
#define kKeyboardHeight 238

#pragma mark - 颜色常数

/// App主颜色：92C623
#define kMainColor [UIColor colorWithHexString:@"#92C623"]
/// 通用浅颜色: White
#define kCommonLightColor [UIColor whiteColor]
/// 通用深颜色: Black
#define kCommonDarkColor [UIColor whiteColor]
/// 透明背景颜色: Clear
#define kClearColor [UIColor clearColor]
/// App辅助颜色: A5A5A5
#define kAuxiliaryColor [UIColor colorWithHexString:@"#A5A5A5"]
/// 字体灰色: 333333
#define kTextBlackColor [UIColor colorWithHexString:@"#333333"]
/// 字体灰色: 707070
#define kTextGrayColor [UIColor colorWithHexString:@"#707070"]
/// 线条灰色: E6E6E6
#define kLineGrayColor [UIColor colorWithHexString:@"#E6E6E6"]

#pragma mark - 字体常数

/// 标题字体：20
#define kHeadFont [UIFont systemFontOfSize:20]
/// 大号字体：18
#define kLargeFont [UIFont systemFontOfSize:18]
/// 正常字体：16
#define kNormalFont [UIFont systemFontOfSize:16]
/// 中号字体：14
#define kMediumFont [UIFont systemFontOfSize:14]
/// 小号字体：12
#define kSmallFont [UIFont systemFontOfSize:12]

#pragma mark - Masonry常数

/// 省略mas_前缀
#define MAS_SHORTHAND
/// 基础数据类型自动装箱
#define MAS_SHORTHAND_GLOBALS

#endif /* Const_h */
