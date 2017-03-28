//
//  NSMutableAttributedString+CCExtension.m
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import "NSMutableAttributedString+CCExtension.h"

@implementation NSMutableAttributedString (CCExtension)

/**
 *  改变部分文字颜色方法
 */
+ (NSMutableAttributedString *)changeColorWithString:(UIColor *)color withString:(NSString *)totalString subString:(NSString *)subString {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:totalString];
    NSRange range = [totalString rangeOfString:subString options:NSBackwardsSearch];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    return attributedString;
}

@end
