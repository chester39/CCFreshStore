//
//  MBProgressHUD+CCTools.h
//      CCFreshStoreApp
//      Chen Chen @ June 9th, 2017
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (CCTools)

/**
 *  显示消息和持续时间方法
 */
+ (void)showMessageWithText:(NSString *)text time:(NSTimeInterval)time;

@end
