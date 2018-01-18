//
//  UIButton+CCTUtility.m
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import "UIButton+CCTUtility.h"

@implementation UIButton (CCTUtility)

/**
 *  图片和背景图片初始化方法
 */
+ (UIButton *_Nonnull)buttonWithImage:(NSString *_Nonnull)imageName backgroundImage:(NSString *_Nonnull)backgroundImageName {

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[imageName stringByAppendingString:@"_highlighted"]] forState:UIControlStateHighlighted];
    
    [button setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:[backgroundImageName stringByAppendingString:@"_highlighted"]] forState:UIControlStateHighlighted];
    
    [button sizeToFit];
    return button;
}

@end
