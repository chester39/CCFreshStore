//
//  UIBarButtonItem+CCTools.m
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import "UIBarButtonItem+CCTools.h"

@implementation UIBarButtonItem (CCTools)

/**
 *  指定图片和目标便利初始化方法
 */
- (instancetype)initWithImage:(NSString *)imageName target:(nullable id)target action:(nullable SEL)action {
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[imageName stringByAppendingString:@"_highlighted"]] forState:UIControlStateHighlighted];
    
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}

@end
