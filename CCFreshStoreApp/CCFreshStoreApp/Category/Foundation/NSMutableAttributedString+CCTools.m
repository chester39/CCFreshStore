//
//  NSMutableAttributedString+CCTools.m
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import "NSMutableAttributedString+CCTools.h"

@implementation NSMutableAttributedString (CCTools)

/**
 *  改变部分文字颜色方法
 */
- (NSMutableAttributedString *)changeColor:(UIColor *)color totalString:(NSString *)totalString subString:(NSString *)subString {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:totalString];
    NSRange range = [totalString rangeOfString:subString options:NSBackwardsSearch];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    return attributedString;
}

/**
 *  改变部分文字行间距方法
 */
- (NSMutableAttributedString *)changeLineSpacing:(CGFloat)spacing totalString:(NSString *)totalString subString:(NSString *)subString {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:totalString];
    NSRange range = [totalString rangeOfString:subString options:NSBackwardsSearch];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = spacing;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    
    return attributedString;
}

@end
