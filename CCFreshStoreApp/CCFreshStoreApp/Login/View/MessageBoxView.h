//
//  MessageBoxView.h
//      CCFreshStoreApp
//      Chen Chen @ June 4th, 2017
//

#import <UIKit/UIKit.h>

/// 消息框类型
typedef NS_ENUM(NSUInteger, MessageBoxType) {
    /// 用户账号消息框
    MessageBoxTypeUserAccount = 1 << 0,
    /// 用户密码消息框
    MessageBoxTypePassword = 1 << 1,
    /// 用户手机消息框
    MessageBoxTypePhone = 1 << 2,
};

@interface MessageBoxView : UIView

/**
 *  根据类型布局界面方法
 */
- (void)layoutUIWithType:(MessageBoxType)type placeholder:(NSString *)text isLine:(BOOL)isLine;

@end
