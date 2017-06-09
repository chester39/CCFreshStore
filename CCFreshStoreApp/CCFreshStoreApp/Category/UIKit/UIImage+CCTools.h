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
/**
 *  比例切割图片方法
 */
- (UIImage *)resizableImage:(NSString *)name scale:(CGFloat)scale;
/**
 *  图片水印添加方法
 */
- (UIImage *)watermarkWithImage:(NSString *)name watermark:(NSString *)watermark scale:(CGFloat)scale;
/**
 *  圆形裁剪图片方法
 */
- (UIImage *)clipCircleWithImage:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
/**
 *  全屏截图方法
 */
- (UIImage *)captureWithView:(UIView *)view;
/**
 *  设置条纹背景方法
 */
- (UIImage *)stripeBackgroundWithView:(UIView *)view rowHeight:(CGFloat)rowHeight rowColor:(UIColor *)rowColor lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor;

@end
