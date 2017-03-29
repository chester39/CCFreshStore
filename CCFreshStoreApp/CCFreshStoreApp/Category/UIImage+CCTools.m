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

@end
