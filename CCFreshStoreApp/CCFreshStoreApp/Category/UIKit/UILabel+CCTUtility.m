//
//  UILabel+CCTUtility.m
//      CCFreshStoreApp
//      Chen Chen @ March 29th, 2017
//

#import "UILabel+CCTUtility.h"

@implementation UILabel (CCTUtility)

/**
 *  文字和字号和行数初始化方法
 */
+ (UILabel *_Nonnull)labelWithText:(NSString *_Nonnull)text fontSize:(CGFloat)fontSize lines:(NSInteger)lines {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = lines;
    
    return label;
}

@end
