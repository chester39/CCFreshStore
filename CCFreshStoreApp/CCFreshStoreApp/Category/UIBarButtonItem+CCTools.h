//
//  UIBarButtonItem+CCTools.h
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CCTools)

/**
 *  指定图片和目标便利初始化方法
 */
- (instancetype)initWithImage:(NSString *)imageName target:(nullable id)target action:(nullable SEL)action;

@end
