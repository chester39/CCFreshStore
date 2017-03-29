//
//  UIColor+CCTools.h
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import <UIKit/UIKit.h>

@interface UIColor (CCTools)

/**
 *  十六进制颜色便利初始化方法
 */
- (instancetype)initWithHex:(int)hex;
/**
 *  十六进制透明度颜色便利初始化方法
 */
- (instancetype)initWithHex:(int)hex alpha:(CGFloat)alpha;

@end
