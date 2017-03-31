//
//  UIBarButtonItem+CCTools.h
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CCTools)

/**
 *  图片和目标和选择器初始化方法
 */
+ (UIBarButtonItem *_Nonnull)barButtonItemWithImage:(NSString *_Nonnull)imageName target:(nullable id)target action:(nullable SEL)action;

@end
