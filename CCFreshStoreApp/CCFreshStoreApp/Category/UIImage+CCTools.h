//
//  UIImage+CCTools.h
//      CCFreshStoreApp
//      Chen Chen @ March 29th, 2017
//

#import <UIKit/UIKit.h>

@interface UIImage (CCTools)

/**
 *  图片染色方法
 */
- (UIImage *)tintImageWithColor:(UIColor *)color alpha:(CGFloat)alpha;
/**
 *  重叠图片方法
 */
- (UIImage *)overlapImageWithColor:(UIColor *)color;

@end
