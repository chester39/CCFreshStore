//
//  UIColor+CCTUtility.h
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import <UIKit/UIKit.h>

@interface UIColor (CCTUtility)

/**
 *  十六进制字符串颜色初始化方法
 */
+ (UIColor *)colorWithHexString:(NSString *)hex;
/**
 *  十六进制字符串透明度和颜色初始化方法
 */
+ (UIColor *)colorWithHexString:(NSString *)hex alpha:(CGFloat)alpha;
/**
 *  十六进制颜色初始化方法
 */
+ (UIColor *)colorWithHexInt:(UInt32)hex;
/**
 *  十六进制透明度和颜色初始化方法
 */
+ (UIColor *)colorWithHexInt:(UInt32)hex alpha:(CGFloat)alpha;

@end
