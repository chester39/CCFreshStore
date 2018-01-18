//
//  UIBarButtonItem+CCTUtility.m
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import "UIBarButtonItem+CCTUtility.h"

@implementation UIBarButtonItem (CCTUtility)

/**
 *  图片和目标和选择器初始化方法
 */
+ (UIBarButtonItem *_Nonnull)barButtonItemWithImage:(NSString *_Nonnull)imageName target:(nullable id)target action:(nullable SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[imageName stringByAppendingString:@"_highlighted"]] forState:UIControlStateHighlighted];

    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

@end
