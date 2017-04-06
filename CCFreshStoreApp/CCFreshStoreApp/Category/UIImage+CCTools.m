//
//  UIImage+CCTools.m
//      CCFreshStoreApp
//      Chen Chen @ March 29th, 2017
//

#import "UIImage+CCTools.h"

@implementation UIImage (CCTools)

/**
 *  图片染色方法
 */
- (UIImage *)tintImageWithColor:(UIColor *)color alpha:(CGFloat)alpha {
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, true, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawInRect:rect];
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetAlpha(context, alpha);
    CGContextSetBlendMode(context, kCGBlendModeSourceAtop);
    CGContextFillRect(context, rect);
    
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage *newImage = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  重叠图片方法
 */
- (UIImage *)overlapImageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    UIGraphicsBeginImageContext(self.size);
    [colorImage drawInRect:rect];
    [self drawInRect:rect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  比例切割图片方法
 */
- (UIImage *)resizableImage:(NSString *)name scale:(CGFloat)scale {
    
    UIImage *image = [UIImage imageNamed:name];
    CGFloat width = image.size.width * scale;
    CGFloat height = image.size.height * scale;
    
    UIImage *newImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(height, width, height, width)];
    return newImage;
}

/**
 *  图片水印添加方法
 */
- (UIImage *)watermarkWithImage:(NSString *)name watermark:(NSString *)watermark scale:(CGFloat)scale {
    
    UIImage *backgroundImage = [UIImage imageNamed:name];
    UIGraphicsBeginImageContextWithOptions(backgroundImage.size, NO, 0);
    [backgroundImage drawInRect:CGRectMake(0, 0, backgroundImage.size.width, backgroundImage.size.height)];
    
    UIImage *watermarkImage = [UIImage imageNamed:watermark];
    CGFloat margin = 5;
    CGFloat watermarkWidth = watermarkImage.size.width * scale;
    CGFloat watermarkHeight = watermarkImage.size.height * scale;
    CGFloat watermarkX = watermarkImage.size.width - watermarkWidth - margin;
    CGFloat watermarkY = watermarkImage.size.height - watermarkHeight - margin;
    [watermarkImage drawInRect:CGRectMake(watermarkX, watermarkY, watermarkWidth, watermarkHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  圆形裁剪图片方法
 */
- (UIImage *)clipCircleWithImage:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    
    UIImage *originImage = [UIImage imageNamed:name];
    CGFloat originWidth = originImage.size.width + borderWidth * 2;
    CGFloat originHeight = originImage.size.height + borderWidth * 2;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(originWidth, originHeight), NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [borderColor set];
    
    CGFloat bigRadius = originWidth * 0.5;
    CGFloat centerX = bigRadius;
    CGFloat centerY = bigRadius;
    CGContextAddArc(context, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(context);
    
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(context, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    CGContextClip(context);
    [originImage drawInRect:CGRectMake(borderWidth, borderWidth, originImage.size.width, originImage.size.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  全屏截图方法
 */
- (UIImage *)captureWithView:(UIView *)view {
    
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  设置条纹背景方法
 */
- (UIImage *)stripeBackgroundWithView:(UIView *)view rowHeight:(CGFloat)rowHeight rowColor:(UIColor *)rowColor lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor {
    
    CGFloat rowWidth = view.frame.size.width;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(rowWidth, rowHeight), NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [rowColor set];
    
    CGContextAddRect(context, CGRectMake(0, 0, rowWidth, rowHeight));
    CGContextFillPath(context);
    [lineColor set];
    CGContextSetLineWidth(context, lineWidth);
    
    CGFloat dividerX = 0;
    CGFloat dividerY = rowHeight - lineWidth;
    CGContextMoveToPoint(context, dividerX, dividerY);
    CGContextAddLineToPoint(context, rowWidth - dividerX, dividerY);
    CGContextStrokePath(context);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
