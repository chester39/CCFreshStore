//
//  LoginView.h
//      CCFreshStoreApp
//      Chen Chen @ April 9th, 2017
//

#import <UIKit/UIKit.h>

@class LoginView;

/**
 *  自定义LoginViewDelegate代理协议
 */
@protocol LoginViewDelegate <NSObject>
@optional

/**
 *  点击登录按钮方法
 */
- (void)loginViewDidClickLoginButton:(LoginView *)loginView context:(NSDictionary *)dict;
/**
 *  点击忘记密码按钮方法
 */
- (void)loginViewDidClickForgetButton:(LoginView *)loginView;
/**
 *  点击注册按钮方法
 */
- (void)loginViewDidClickRegisterButton:(LoginView *)loginView;

@end

@interface LoginView : UIView

/**
 *  LoginViewDelegate代理
 */
@property (nonatomic, weak) id<LoginViewDelegate> delegate;

@end
