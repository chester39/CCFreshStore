//
//  UIButton+CCTUtility.h
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import <UIKit/UIKit.h>

@interface UIButton (CCTUtility)

/**
 *  图片和背景图片初始化方法
 */
+ (UIButton *_Nonnull)buttonWithImage:(NSString *_Nonnull)imageName backgroundImage:(NSString *_Nonnull)backgroundImageName;

@end

