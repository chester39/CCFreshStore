//
//  UIView+CCTUtility.h
//      CCFreshStoreApp
//      Chen Chen @ March 29th, 2017
//

#import <UIKit/UIKit.h>

@interface UIView (CCTUtility)

/// 顶部坐标
@property (nonatomic, assign) CGFloat top;
/// 左部坐标
@property (nonatomic, assign) CGFloat left;
/// 底部坐标
@property (nonatomic, assign) CGFloat bottom;
/// 右部坐标
@property (nonatomic, assign) CGFloat right;
/// 宽度值
@property (nonatomic, assign) CGFloat width;
/// 高度值
@property (nonatomic, assign) CGFloat height;

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
 *  判断是否视图显示在屏幕上方法
 */
- (BOOL)isDisplayInScreen;
/**
 *  找到1单位宽图片视图方法
 */
- (UIImageView *)findOneWidthBottomLineWithView:(UIView *)view;
/**
 *  添加渐变色背景方法
 */
- (void)gradientWithCGColors:(NSArray *)colorArray start:(CGPoint)start end:(CGPoint)end;
/**
 *  添加弹性动画方法
 */
- (void)springAnimationWithStart:(NSNumber *)start end:(NSNumber *)end;

@end
