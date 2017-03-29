//
//  UIView+CCTools.m
//      CCFreshStoreApp
//      Chen Chen @ March 29th, 2017
//

#import "UIView+CCTools.h"

@implementation UIView (CCTools)

/**
 *  获取缓存大小方法
 */
- (CGFloat)acquireCachesSize {
    
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, true) lastObject];
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
    
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, true) lastObject];
    NSArray *fileAttributes = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    for (NSString *fileName in fileAttributes) {
        NSString *path = [cachePath stringByAppendingPathComponent:fileName];
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        }
    }
}

/**
 *  当前视图绘制图片视图方法
 */
- (UIImageView *)snapshotWithView {
    
    CGSize size = CGSizeMake(self.frame.size.width, self.frame.size.height - 1);
    UIGraphicsBeginImageContextWithOptions(size, false, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIImageView *newImageView = [[UIImageView alloc] initWithImage:image];
    newImageView.layer.masksToBounds = false;
    newImageView.layer.cornerRadius = 0;
    newImageView.layer.shadowOffset = CGSizeMake(0, 0);
    newImageView.layer.shadowRadius = 5.0;
    newImageView.layer.shadowOpacity = 0.4;
    
    return newImageView;
}

@end
