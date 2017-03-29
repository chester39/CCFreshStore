//
//  UILabel+CCTools.h
//      CCFreshStoreApp
//      Chen Chen @ March 29th, 2017
//


#import <UIKit/UIKit.h>

@interface UILabel (CCTools)

/**
 *  文字和字号和行数便利初始化方法
 */
- (instancetype)initWithText:(NSString *)text fontSize:(CGFloat)fontSize lines:(NSInteger)lines;

@end
