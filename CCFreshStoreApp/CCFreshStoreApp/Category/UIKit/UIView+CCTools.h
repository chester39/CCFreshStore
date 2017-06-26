//
//  UIView+CCTools.h
//      CCFreshStoreApp
//      Chen Chen @ March 29th, 2017
//

#import <UIKit/UIKit.h>

@interface UIView (CCTools)

/**
 *  获取缓存大小方法
 */
- (CGFloat)cachesSize;
/**
 *  清除缓存方法
 */
- (void)clearCaches;
/**
 *  绘制图片视图方法
 */
- (UIImageView *)snapshotWithView;
/**
 *  添加渐变色背景方法
 */
- (void)gradientWithCGColors:(NSArray *)colorArray start:(CGPoint)start end:(CGPoint)end;
/**
 *  添加弹性动画方法
 */
- (void)springAnimationWithStart:(NSNumber *)start end:(NSNumber *)end;


@end
