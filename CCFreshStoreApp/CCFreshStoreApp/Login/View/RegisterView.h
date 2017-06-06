//
//  RegisterView.h
//      CCFreshStoreApp
//      Chen Chen @ June 6th, 2017
//

#import <UIKit/UIKit.h>

@class RegisterView;

/**
 *  自定义RegisterViewDelegate代理协议
 */
@protocol RegisterViewDelegate <NSObject>
@optional

/**
 *  RegisterView点击注册按钮代理方法
 */
- (void)registerViewDidClickRegisterButton:(RegisterView *)registerView;

@end

@interface RegisterView : UIView

/**
 *  RegisterViewDelegate代理
 */
@property (weak, nonatomic) id<RegisterViewDelegate> delegate;

@end
