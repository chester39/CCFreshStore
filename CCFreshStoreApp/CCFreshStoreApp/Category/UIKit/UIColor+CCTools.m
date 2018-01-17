//
//  UIColor+CCTools.m
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import "UIColor+CCTools.h"

@implementation UIColor (CCTools)

/**
 *  十六进制字符串颜色初始化方法
 */
+ (UIColor *)colorWithHexString:(NSString *)hex {
    
    return [UIColor colorWithHexString:hex alpha:1.0];
}

/**
 *  十六进制字符串透明度和颜色初始化方法
 */
+ (UIColor *)colorWithHexString:(NSString *)hex alpha:(CGFloat)alpha {
    
    NSString *colorString = [hex stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]].uppercaseString;
    
    if (colorString.length < 6) {
        return [UIColor clearColor];
    }
    
    if ([colorString hasPrefix:@"#"]) {
        colorString = [colorString substringFromIndex:1];
        
    } else if ([colorString hasPrefix:@"0x"]) {
        colorString = [colorString substringFromIndex:2];
    }
    
    if (colorString.length != 6) {
        return [UIColor clearColor];
    }
    
    NSRange range = NSMakeRange(0, 2);
    NSString *redString = [colorString substringWithRange:range];
    range.location = 2;
    NSString *greenString = [colorString substringWithRange:range];
    range.location = 4;
    NSString *blueString = [colorString substringWithRange:range];
    
    NSScanner *scanner = [NSScanner scannerWithString:redString];
    UInt32 red = 0;
    UInt32 green = 0;
    UInt32 blue = 0;
    
    [scanner scanHexInt:&red];
    scanner = [NSScanner scannerWithString:greenString];
    [scanner scanHexInt:&green];
    scanner = [NSScanner scannerWithString:blueString];
    [scanner scanHexInt:&blue];
    
    UIColor *color = [UIColor colorWithRed:(CGFloat)(red) / 255.0 green:(CGFloat)(green) / 255.0 blue:(CGFloat)(blue) / 255.0 alpha:alpha];
    return color;
}

/**
 *  十六进制颜色初始化方法
 */
+ (UIColor *)colorWithHexInt:(UInt32)hex {
    
    return [UIColor colorWithHexInt:hex alpha:1.0];
}

/**
 *  十六进制透明度和颜色初始化方法
 */
+ (UIColor *)colorWithHexInt:(UInt32)hex alpha:(CGFloat)alpha {
    
    int red = (hex >> 16) & 0xFF;
    int green = (hex >> 8) & 0xFF;
    int blue = (hex) & 0xFF;
    
    UIColor *color = [UIColor colorWithRed:(CGFloat)(red) / 255.0 green:(CGFloat)(green) / 255.0 blue:(CGFloat)(blue) / 255.0 alpha:alpha];
    return color;
}

@end
