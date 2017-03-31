//
//  UIWindow+CCTools.m
//      CCFreshStoreApp
//      Chen Chen @ March 30th, 2017
//

#import "UIWindow+CCTools.h"

@implementation UIWindow (CCTools)

/**
 *  判断是否浅色方法
 */
+ (BOOL)isLightColor:(NSString *)string {
    
    NSString *redString = [string substringWithRange:NSMakeRange(1, 2)];
    NSString *greenString = [string substringWithRange:NSMakeRange(3, 2)];
    NSString *blueString = [string substringWithRange:NSMakeRange(5, 2)];
    
    NSScanner *scanner = [NSScanner scannerWithString:redString];
    UInt32 red = 0;
    UInt32 green = 0;
    UInt32 blue = 0;
    
    [scanner scanHexInt:&red];
    scanner = [NSScanner scannerWithString:greenString];
    [scanner scanHexInt:&green];
    scanner = [NSScanner scannerWithString:blueString];
    [scanner scanHexInt:&blue];
    
    if ((red + blue + green) < 382) {
        return false;
        
    } else {
        return true;
    }
}

@end
