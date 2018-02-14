//
//  UIBarButtonItem+CCTUtility.h
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CCTUtility)

/**
 *  图片和目标和选择器初始化方法
 */
+ (UIBarButtonItem *_Nonnull)barButtonItemWithFrame:(CGRect)frame image:(NSString *_Nonnull)imageName target:(nullable id)target action:(nullable SEL)action;

@end
