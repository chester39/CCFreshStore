//
//  UIColor+CCTools.m
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import "UIColor+CCTools.h"

@implementation UIColor (CCTools)

/**
 *  十六进制颜色便利初始化方法
 */
- (instancetype)initWithHex:(int)hex {
    
    self = [[UIColor alloc] initWithHex:hex alpha:1.0];
    
    return self;
}

/**
 *  十六进制透明度颜色便利初始化方法
 */
- (instancetype)initWithHex:(int)hex alpha:(CGFloat)alpha {
    
    self = [[UIColor alloc] initWithRed:(CGFloat)((hex & 0xFF0000) >> 16) / 255.0 green:(CGFloat)((hex & 0x00FF00) >> 8) / 255.0 blue:(CGFloat)((hex & 0x0000FF) >> 0) / 255.0 alpha:alpha];
    
    return self;
}

@end
