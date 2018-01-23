//
//  MBProgressHUD+CCTUtility.m
//      CCFreshStoreApp
//      Chen Chen @ June 9th, 2017
//

#import "MBProgressHUD+CCTUtility.h"

@implementation MBProgressHUD (CCTUtility)

/**
 *  显示消息和持续时间方法
 */
+ (void)showMessage:(NSString *)text time:(NSTimeInterval)time {
    
    UIWindow *mainWindow;
    if ([UIApplication sharedApplication].keyWindow) {
        mainWindow = [UIApplication sharedApplication].keyWindow;
        
    } else if ([UIApplication sharedApplication].windows) {
        mainWindow = [UIApplication sharedApplication].windows.lastObject;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:mainWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:time];
}

@end
