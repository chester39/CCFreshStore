//
//  UIView+CCTUtility.m
//      CCFreshStoreApp
//      Chen Chen @ March 29th, 2017
//

#import "UIView+CCTUtility.h"

@implementation UIView (CCTUtility)

/**
 *  获取顶部坐标方法
 */
- (CGFloat)top {
    
    return self.frame.origin.y;
}

/**
 *  设置顶部坐标方法
 */
- (void)setTop:(CGFloat)top {
    
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

/**
 *  获取左部坐标方法
 */
- (CGFloat)left {
    
    return self.frame.origin.x;
}

/**
 *  设置左部坐标方法
 */
- (void)setLeft:(CGFloat)left {
    
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

/**
 *  获取底部坐标方法
 */
- (CGFloat)bottom {
    
    return self.frame.origin.y + self.frame.size.height;
}

/**
 *  设置底部坐标方法
 */
- (void)setBottom:(CGFloat)bottom {
    
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

/**
 *  获取右部坐标方法
 */
- (CGFloat)right {
    
    return self.frame.origin.x + self.frame.size.width;
}

/**
 *  设置右部坐标方法
 */
- (void)setRight:(CGFloat)right {
    
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

/**
 *  获取宽度值方法
 */
- (CGFloat)width {
    
    return self.frame.size.width;
}

/**
 *  设置宽度值方法
 */
- (void)setWidth:(CGFloat)width {
    
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

/**
 *  获取高度值方法
 */
- (CGFloat)height {
    
    return self.frame.size.height;
}

/**
 *  设置高度值方法
 */
- (void)setHeight:(CGFloat)height {
    
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

/**
 *  获取缓存大小方法
 */
- (CGFloat)cachesSize {
    
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSArray *fileAttributes = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    CGFloat size = 0;
    
    for (NSString *fileName in fileAttributes) {
        NSString *path = [cachePath stringByAppendingPathComponent:fileName];
        NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
        size += [attributes fileSize];
    }
    
    CGFloat cacheSize = size / 1024 / 1024;
    return cacheSize;
}

/**
 *  清除缓存方法
 */
- (void)clearCaches {
    
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSArray *fileAttributes = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    for (NSString *fileName in fileAttributes) {
        NSString *path = [cachePath stringByAppendingPathComponent:fileName];
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        }
    }
}

/**
 *  绘制图片视图方法
 */
- (UIImageView *)snapshotWithView {
    
    CGSize size = CGSizeMake(self.frame.size.width, self.frame.size.height - 1);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIImageView *newImageView = [[UIImageView alloc] initWithImage:image];
    newImageView.layer.masksToBounds = NO;
    newImageView.layer.cornerRadius = 0;
    newImageView.layer.shadowOffset = CGSizeMake(0, 0);
    newImageView.layer.shadowRadius = 5.0;
    newImageView.layer.shadowOpacity = 0.4;
    
    return newImageView;
}

/**
 *  判断是否视图显示在屏幕上方法
 */
- (BOOL)isDisplayInScreen {
    
    if (self.hidden || self.alpha == 0) {
        return NO;
    }
    
    if (!self.superview) {
        return NO;
    }
    
    CGRect rect = [self convertRect:self.bounds toView:[[[UIApplication sharedApplication] delegate] window]];
    if (CGRectIsEmpty(rect) || CGRectIsNull(rect)) {
        return NO;
    }
    
    if (CGSizeEqualToSize(rect.size, CGSizeZero)) {
        return NO;
    }
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    CGRect intersectionRect = CGRectIntersection(rect, screenRect);
    if (CGRectIsEmpty(intersectionRect) || CGRectIsNull(intersectionRect)) {
        return NO;
    }
    
    return YES;
}

/**
 *  添加渐变色背景方法
 */
- (void)gradientWithCGColors:(NSArray *)colorArray start:(CGPoint)start end:(CGPoint)end {
    
    CAGradientLayer *layer = [[CAGradientLayer alloc] init];
    layer.colors = colorArray;
    layer.startPoint = start;
    layer.endPoint = end;
    layer.frame = self.bounds;
    
    [self.layer addSublayer:layer];
}

/**
 *  添加弹性动画方法
 */
- (void)springAnimationWithStart:(NSNumber *)start end:(NSNumber *)end {
    
    CASpringAnimation *spring = [CASpringAnimation animationWithKeyPath:@"position.x"];
    spring.stiffness = 100;
    spring.damping = 10;
    spring.mass = 1;
    spring.initialVelocity = 0;
    spring.fromValue = start;
    spring.toValue = end;
    spring.duration = spring.settlingDuration;
    
    [self.layer addAnimation:spring forKey:spring.keyPath];
}

@end
