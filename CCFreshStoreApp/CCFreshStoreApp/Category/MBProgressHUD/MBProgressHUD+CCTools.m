//
//  MBProgressHUD+CCTools.m
//      CCFreshStoreApp
//      Chen Chen @ June 9th, 2017
//

#import "MBProgressHUD+CCTools.h"

@implementation MBProgressHUD (CCTools)

/**
 *  显示消息和持续时间方法
 */
+ (void)showMessageWithText:(NSString *)text time:(NSTimeInterval)time {
    
    UIWindow *mainWindow;
    if ([UIApplication sharedApplication].keyWindow) {
        mainWindow = [UIApplication sharedApplication].keyWindow;
        
    } else if ([UIApplication sharedApplication].windows) {
        mainWindow = [UIApplication sharedApplication].windows.firstObject;
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:mainWindow animated:true];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:time];
}

@end
