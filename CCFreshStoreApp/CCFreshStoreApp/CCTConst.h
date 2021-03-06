//
//  CCTConst.h
//      CCFreshStoreApp
//      Chen Chen @ March 27th, 2017
//

#import <UIKit/UIKit.h>

// Foundation Category
#import "NSDate+CCTUtility.h"
#import "NSString+CCTUtility.h"

// UIKit Category
#import "UIBarButtonItem+CCTUtility.h"
#import "UIButton+CCTUtility.h"
#import "UIColor+CCTUtility.h"
#import "UIDevice+CCTUtility.h"
#import "UIImage+CCTUtility.h"
#import "UILabel+CCTUtility.h"
#import "UIView+CCTUtility.h"
#import "UIWindow+CCTUtility.h"

#ifndef CCTConst_h
#define CCTConst_h

#pragma mark - 界面常数

// 屏幕尺寸: iPhone4/4s: 320-480 iPhone5/5s: 320-568 iPhone6/6s/7/8: 375-667 iPhone6/6s/7/8 Plus: 414-736 iPhone X: 375-812
#define kScreenFrame [UIScreen mainScreen].bounds
// 屏幕宽度: 320/375/414
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
// 屏幕高度: 480/568/667/736/812
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
// 状态栏高度: 20/44
#define kStatusBarHeight (kScreenHeight == 812.0 ? 44 : 20)
// 导航栏高度: 44
#define kNavigationBarHeight 44
// 顶端高度: 64/88
#define kTopHeight (kStatusBarHeight + kNavigationBarHeight)
// 底部栏高度: 49/83
#define kTabBarHeight (kScreenHeight == 812.0 ? 83 : 49)
// 底部高度: 0/34
#define kBottomHeight (kScreenHeight == 812.0 ? 34 : 0)
// 可用高度: 屏幕高度-顶端高度-底部高度
#define kAvailableHeight (kScreenHeight - kTopHeight - kBottomHeight)
// 键盘高度
#define kKeyboardHeight 216

#pragma mark - 颜色常数

// App主颜色：92C623
#define kMainColor [UIColor colorWithHexString:@"#92C623"]
// 通用浅颜色: White
#define kCommonLightColor [UIColor whiteColor]
// 通用深颜色: Black
#define kCommonDarkColor [UIColor blackColor]
// 透明背景颜色: Clear
#define kClearColor [UIColor clearColor]
// App辅助颜色: A5A5A5
#define kAuxiliaryColor [UIColor colorWithHexString:@"#A5A5A5"]
// 字体灰色: 333333
#define kTextBlackColor [UIColor colorWithHexString:@"#333333"]
// 字体灰色: 707070
#define kTextGrayColor [UIColor colorWithHexString:@"#707070"]
// 线条灰色: E6E6E6
#define kLineGrayColor [UIColor colorWithHexString:@"#E6E6E6"]

#pragma mark - 字体常数

// 标题字体：20
#define kHeadFont [UIFont systemFontOfSize:20]
// 大号字体：18
#define kLargeFont [UIFont systemFontOfSize:18]
// 正常字体：16
#define kNormalFont [UIFont systemFontOfSize:16]
// 中号字体：14
#define kMediumFont [UIFont systemFontOfSize:14]
// 小号字体：12
#define kSmallFont [UIFont systemFontOfSize:12]

#pragma mark - 服务器常数

#define kUserAccount @"user_account"
#define kUserPassword @"user_password"
#define kUserPhone @"user_phone"

#pragma mark - 方法常数

// 类型判断
#define CCTClassCheck(var, className) ((var) && [var isKindOfClass:[className class]])
// 有效字符串判断
#define CCTNSStringCheck(var) (CCTClassCheck(var, NSString) && (((NSString *)var).length > 0))
// 有效数组判断
#define CCTNSArrayCheck(var) (CCTClassCheck(var, NSArray) && (((NSArray *)var).count > 0))
// 有效字典判断
#define CCTNSDictionaryCheck(var) (CCTClassCheck(var, NSDictionary) && (((NSDictionary *)var).count > 0))
// 有效代理方法判断
#define CCTDelegateCheckToSelector(delegate, selector) ((delegate) && ([delegate respondsToSelector:selector]))
// 去除UIScrollView自动缩进
#define CCTAdjustsScrollViewInsets(controller, view) \
if (@available(iOS 11.0, *)) { \
view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever; \
} else if ([controller isKindOfClass:[UIViewController class]]) { \
controller.automaticallyAdjustsScrollViewInsets = false; \
}
// 单例模式定义
#define CCTSingleton(className) \
+ (className *)sharedInstance { \
static dispatch_once_t once; \
static className *singleton; \
dispatch_once( &once, ^{ singleton = [[className alloc] init]; } ); \
return singleton; \
}
// weak替换
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif
// strong替换
#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

#pragma mark - Masonry常数

/// 省略mas_前缀
#define MAS_SHORTHAND
/// 基础数据类型自动装箱
#define MAS_SHORTHAND_GLOBALS

#endif /* Const_h */
