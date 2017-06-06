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
 *  LoginView点击登录按钮代理方法
 */
- (void)loginViewDidClickLoginButton:(LoginView *)loginView;
/**
 *  LoginView点击忘记密码按钮代理方法
 */
- (void)loginViewDidClickForgetButton:(LoginView *)loginView;
/**
 *  LoginView点击注册按钮代理方法
 */
- (void)loginViewDidClickRegisterButton:(LoginView *)loginView;

@end

@interface LoginView : UIView

/**
 *  LoginViewDelegate代理
 */
@property (weak, nonatomic) id<LoginViewDelegate> delegate;

@end
