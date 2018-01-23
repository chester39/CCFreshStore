//
//  MBProgressHUD+CCTUtility.h
//      CCFreshStoreApp
//      Chen Chen @ June 9th, 2017
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (CCTUtility)

/**
 *  显示消息和持续时间方法
 */
+ (void)showMessage:(NSString *)text time:(NSTimeInterval)time;

@end
