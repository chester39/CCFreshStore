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
+ (UIBarButtonItem *_Nonnull)barButtonItemWithFrame:(CGRect)frame image:(NSString *_Nonnull)imageName target:(nullable id)target action:(nullable SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [button setImage:image forState:UIControlStateNormal];
    
    UIImage *highlightImage = [UIImage imageNamed:[imageName stringByAppendingString:@"_highlighted"]];
    highlightImage = [highlightImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [button setImage:highlightImage forState:UIControlStateHighlighted];

    button.frame = frame;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIView *view = [[UIView alloc] initWithFrame:button.bounds];
    [view addSubview:button];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
    return item;
}

@end
