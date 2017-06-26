//
//  NSMutableAttributedString+CCTools.h
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (CCTools)

/**
 *  改变部分文字颜色方法
 */
- (NSMutableAttributedString *)changeColor:(UIColor *)color totalString:(NSString *)totalString subString:(NSString *)subString;
/**
 *  改变部分文字行间距方法
 */
- (NSMutableAttributedString *)changeLineSpacing:(CGFloat)spacing totalString:(NSString *)totalString subString:(NSString *)subString;

@end
