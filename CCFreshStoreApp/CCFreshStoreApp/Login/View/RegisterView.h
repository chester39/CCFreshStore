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
 *  点击注册按钮方法
 */
- (void)registerViewDidClickRegisterButton:(RegisterView *)registerView context:(NSDictionary *)dict;

@end

@interface RegisterView : UIView

/**
 *  RegisterViewDelegate代理
 */
@property (nonatomic, weak) id<RegisterViewDelegate> delegate;

@end
