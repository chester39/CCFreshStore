//
//  UILabel+CCTools.m
//      CCFreshStoreApp
//      Chen Chen @ March 29th, 2017
//


#import "UILabel+CCTools.h"

@implementation UILabel (CCTools)

/**
 *  文字和字号和行数便利初始化方法
 */
- (instancetype)initWithText:(NSString *)text fontSize:(CGFloat)fontSize lines:(NSInteger)lines {
    
    self = [[UILabel alloc] init];
    
    self.text = text;
    self.font = [UIFont systemFontOfSize:fontSize];
    self.numberOfLines = lines;
    
    return self;
}

@end
