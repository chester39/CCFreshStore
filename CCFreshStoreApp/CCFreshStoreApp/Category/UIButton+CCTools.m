//
//  UIButton+CCTools.m
//      CCFreshStoreApp
//      Chen Chen @ March 28th, 2017
//

#import "UIButton+CCTools.h"

@implementation UIButton (CCTools)

/**
 *  图片和背景图片便利初始化方法
 */
- (instancetype)initWithImage:(NSString *)imageName backgroundImage:(NSString *)backgroundImageName {
    
    self = [super init];
    
    if (self != nil) {
        if (imageName != nil) {
            [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            [self setImage:[UIImage imageNamed:[imageName stringByAppendingString:@"_highlighted"]] forState:UIControlStateHighlighted];
        }
        
        if (backgroundImageName != nil) {
            [self setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
            [self setBackgroundImage:[UIImage imageNamed:[backgroundImageName stringByAppendingString:@"_highlighted"]] forState:UIControlStateHighlighted];
        }
        
        [self sizeToFit];
    }
    
    return self;
}

@end
