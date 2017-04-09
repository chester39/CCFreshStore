//
//  LoginView.m
//      CCFreshStoreApp
//      Chen Chen @ April 9th, 2017
//

#import "LoginView.h"
#import "Const.h"

#import "Masonry.h"

@interface LoginView ()

/// 标志图片视图
@property (strong, nonatomic) UIImageView *logoView;
/// 容器视图
@property (strong, nonatomic) UIView *containerView;
/// 用户图片视图
@property (strong, nonatomic) UIImageView *userView;
/// 密码图片视图
@property (strong, nonatomic) UIImageView *passwordView;
/// 用户文本框
@property (strong, nonatomic) UITextField *userField;
/// 密码文本框
@property (strong, nonatomic) UITextField *passwordField;
/// 登录按钮
@property (strong, nonatomic) UIButton *loginButton;
/// 忘记密码按钮
@property (strong, nonatomic) UIButton *forgetButton;
/// 注册按钮
@property (strong, nonatomic) UIButton *registerButton;

@end

@implementation LoginView

#pragma mark - 初始化方法

/**
 *  标志图片视图惰性初始化方法
 */
- (UIImageView *)logoView {
    
    if (_logoView == nil) {
        UIImage *image = [UIImage imageNamed:@"login_logo"];
        _logoView = [[UIImageView alloc] initWithImage:image];
        _logoView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _logoView;
}

/**
 *  容器视图惰性初始化方法
 */
- (UIView *)containerView {
    
    if (_containerView == nil) {
        _containerView = [[UIView alloc] init];
        _containerView.alpha = 0.6;
        [_containerView.layer setBorderWidth:1.0];
        [_containerView.layer setBorderColor:kCommonLightColor.CGColor];
        [_containerView.layer setShadowOpacity:0.6];
        [_containerView.layer setShadowColor:kCommonDarkColor.CGColor];
        [_containerView.layer setCornerRadius:5.0];
    }
    
    return _containerView;
}

/**
 *  用户图片视图惰性初始化方法
 */
- (UIImageView *)userView {
    
    if (_userView == nil) {
        UIImage *image = [UIImage imageNamed:@"login_user"];
        _userView = [[UIImageView alloc] initWithImage:image];
        _userView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _userView;
}

/**
 *  密码图片视图惰性初始化方法
 */
- (UIImageView *)passwordView {
    
    if (_passwordView == nil) {
        UIImage *image = [UIImage imageNamed:@"login_password"];
        _passwordView = [[UIImageView alloc] initWithImage:image];
        _passwordView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _passwordView;
}

/**
 *  用户文本框惰性初始化方法
 */
- (UITextField *)userField {
    
    if (_userField == nil) {
        _userField = [[UITextField alloc] init];
        _userField.textColor = kTextGrayColor;
        _userField.borderStyle = UITextBorderStyleNone;
        _userField.placeholder = @"请输入手机号";
        _userField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _userField.keyboardType = UIKeyboardTypeNumberPad;
    }
    
    return _userField;
}

/**
 *  密码文本框惰性初始化方法
 */
- (UITextField *)passwordField {
    
    if (_passwordField == nil) {
        _passwordField = [[UITextField alloc] init];
        _passwordField.textColor = kTextGrayColor;
        _passwordField.borderStyle = UITextBorderStyleNone;
        _passwordField.placeholder = @"请输入密码";
        _passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordField.keyboardType = UIKeyboardTypeDefault;
    }
    
    return _passwordField;
}

/**
 *  登录按钮惰性初始化方法
 */
- (UIButton *)loginButton {
    
    if (_loginButton == nil) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:kCommonLightColor forState:UIControlStateNormal];
        [_loginButton setBackgroundColor:kMainColor];
        [_loginButton.layer setCornerRadius:4.0];
        _loginButton.layer.masksToBounds = true;
    }
    
    return _loginButton;
}

/**
 *  忘记密码按钮惰性初始化方法
 */
- (UIButton *)forgetButton {
    
    if (_forgetButton == nil) {
        _forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetButton setTitleColor:kAuxiliaryColor forState:UIControlStateNormal];
        [_forgetButton.layer setBorderWidth:0];
    }
    
    return _forgetButton;
}

/**
 *  注册按钮惰性初始化方法
 */
- (UIButton *)registerButton {
    
    if (_registerButton == nil) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerButton setTitle:@"还没有账号，点击注册" forState:UIControlStateNormal];
        [_registerButton setTitleColor:kAuxiliaryColor forState:UIControlStateNormal];
        [_registerButton.layer setBorderWidth:0];
    }
    
    return _registerButton;
}

/**
 *  尺寸初始化方法
 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self != nil) {
        [self setupUI];
        [self setupConstraints];
    }
    
    return self;
}

#pragma mark - 界面方法

/**
 *  初始化界面方法
 */
- (void)setupUI {
    
    UIColor *backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_background"]];
    self.backgroundColor = backgroundColor;
    [self addSubview:self.logoView];
    [self addSubview:self.containerView];
    [self addSubview:self.userView];
    [self addSubview:self.passwordView];
    [self addSubview:self.userField];
    [self addSubview:self.passwordField];
    [self addSubview:self.loginButton];
    [self addSubview:self.forgetButton];
    [self addSubview:self.registerButton];
}

/**
 *  初始化约束方法
 */
- (void)setupConstraints {
 
    [self.logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@150);
        make.height.equalTo(@50);
        make.centerX.equalTo(self);
        make.top.equalTo(self).with.offset(200);
    }];
}

@end
