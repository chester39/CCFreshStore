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
- (CGFloat)acquireCachesSize;
/**
 *  清除缓存方法
 */
- (void)clearCaches;
/**
 *  当前视图绘制图片视图方法
 */
- (UIImageView *)snapshotWithView;

@end
