//
//  UILabel+CCTUtility.h
//      CCFreshStoreApp
//      Chen Chen @ March 29th, 2017
//

#import <UIKit/UIKit.h>

@interface UILabel (CCTUtility)

/**
 *  文字和字号和行数初始化方法
 */
+ (UILabel *_Nonnull)labelWithText:(NSString *_Nonnull)text fontSize:(CGFloat)fontSize lines:(NSInteger)lines;

@end
