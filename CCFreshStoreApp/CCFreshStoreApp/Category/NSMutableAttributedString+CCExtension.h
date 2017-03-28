//
//  NSMutableAttributedString+CCExtension.h
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (CCExtension)

/**
 *  改变部分文字颜色方法
 */
+ (NSMutableAttributedString *)changeColorWithString:(UIColor *)color withString:(NSString *)totalString subString:(NSString *)subString;

@end
