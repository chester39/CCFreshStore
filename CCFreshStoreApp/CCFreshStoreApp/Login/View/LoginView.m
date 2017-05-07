//
//  LoginView.m
//      CCFreshStoreApp
//      Chen Chen @ April 9th, 2017
//

#import "LoginView.h"
#import "Const.h"

#import "Masonry.h"

#pragma mark - 界面常数

/// 标志图片视图宽
static const CGFloat kLogoViewWidth = 150;
/// 标志图片视图高
static const CGFloat kLogoViewHeight = 50;
/// 标志图片视图上
static const CGFloat kLogoViewTop = 50;
/// 容器视图宽
static const CGFloat kContainerViewWidth = 300;
/// 容器视图高
static const CGFloat kContainerViewHeight = 330;
/// 容器视图上
static const CGFloat kContainerViewTop = 30;
/// 标题按钮高
static const CGFloat kTitleButtonHight = 60;
/// 用户图片视图和密码图片视图宽
static const CGFloat kUserViewAndPasswordViewWidth = 30;
/// 用户图片视图和密码图片视图高
static const CGFloat kUserViewAndPasswordViewHeight = 30;
/// 用户图片视图上
static const CGFloat kUserViewTop = 30;
/// 用户图片视图左
static const CGFloat kUserViewLeft = 20;
/// 密码图片视图高
static const CGFloat kPasswordTop = 30;
/// 用户文本框和密码文本框宽
static const CGFloat kUserFieldAndPasswordFieldWidth = 200;
/// 用户文本框和密码文本框高
static const CGFloat kUserFieldAndPasswordFieldHeight = 40;
/// 用户文本框左
static const CGFloat kUserFieldLeft = 20;
/// 用户分割线和密码分割线高
static const CGFloat kUserLineAndPasswordLineHeight = 1;
/// 用户分割线和密码分割线上和左和右
static const CGFloat kUserLineAndPasswordLineTopAndLeftAndRight = 5;
/// 登录按钮高
static const CGFloat kLoginButtonHeight = 40;
/// 登录按钮上
static const CGFloat kLoginButtonTop = 40;
/// 登录按钮左和右
static const CGFloat kLoginButtonLeftAndRight = 10;
/// 忘记密码按钮和注册按钮高
static const CGFloat kForgetButtonAndRegisterButtonHeight = 30;
/// 忘记密码按钮上
static const CGFloat kForgetButtonTop = 20;
/// 注册按钮下
static const CGFloat kRegisterButtonBottom = 40;
/// 圆角半径
static const CGFloat kCornerRadius = 5;

@interface LoginView ()

/// 背景图片视图
@property (strong, nonatomic) UIImageView *backgroundView;
/// 标志图片视图
@property (strong, nonatomic) UIImageView *logoView;
/// 容器视图
@property (strong, nonatomic) UIView *containerView;
/// 标题按钮
@property (strong, nonatomic) UIButton *titleButton;
/// 用户图片视图
@property (strong, nonatomic) UIImageView *userView;
/// 密码图片视图
@property (strong, nonatomic) UIImageView *passwordView;
/// 用户文本框
@property (strong, nonatomic) UITextField *userField;
/// 密码文本框
@property (strong, nonatomic) UITextField *passwordField;
/// 用户分割线
@property (strong, nonatomic) UIView *userLine;
/// 密码分割线
@property (strong, nonatomic) UIView *passwordLine;
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
 *  背景图片视图惰性初始化方法
 */
- (UIImageView *)backgroundView {
    
    if (_backgroundView == nil) {
        UIImage *image = [UIImage imageNamed:@"login_background"];
        _backgroundView = [[UIImageView alloc] initWithImage:image];
        _backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    }
    
    return _backgroundView;
}

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
        _containerView.alpha = 0.9;
        _containerView.backgroundColor = kCommonLightColor;
        [_containerView.layer setBorderWidth:1.0];
        [_containerView.layer setBorderColor:kCommonLightColor.CGColor];
        [_containerView.layer setCornerRadius:kCornerRadius];
        [_containerView.layer setShadowOpacity:0.1];
        [_containerView.layer setShadowColor:kCommonDarkColor.CGColor];
        [_containerView.layer setShadowRadius:kCornerRadius];
    }
    
    return _containerView;
}

/**
 *  标题按钮惰性初始化方法
 */
- (UIButton *)titleButton {
    
    if (_titleButton == nil) {
        _titleButton = [[UIButton alloc] init];
        _titleButton.backgroundColor = kLineGrayColor;
        [_titleButton setTitle:@"账号登录" forState:UIControlStateNormal];
        [_titleButton setTitleColor:kTextBlackColor forState:UIControlStateNormal];
        _titleButton.titleLabel.font = kHeadFont;
        [_titleButton.layer setShadowColor:kCommonDarkColor.CGColor];
        [_titleButton.layer setCornerRadius:kCornerRadius];
        _titleButton.userInteractionEnabled = NO;
    }
    
    return _titleButton;
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
        _userField.font = kNormalFont;
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
        _passwordField.font = kNormalFont;
        _passwordField.textColor = kTextGrayColor;
        _passwordField.borderStyle = UITextBorderStyleNone;
        _passwordField.secureTextEntry = YES;
        _passwordField.placeholder = @"请输入密码";
        _passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordField.keyboardType = UIKeyboardTypeDefault;
    }
    
    return _passwordField;
}

/**
 *  用户分割线惰性初始化方法
 */
- (UIView *)userLine {
    
    if (_userLine == nil) {
        _userLine = [[UIView alloc] init];
        _userLine.backgroundColor = kAuxiliaryColor;
    }
    
    return _userLine;
}

/**
 *  密码分割线惰性初始化方法
 */
- (UIView *)passwordLine {
    
    if (_passwordLine == nil) {
        _passwordLine = [[UIView alloc] init];
        _passwordLine.backgroundColor = kAuxiliaryColor;
    }
    
    return _passwordLine;
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
        [_loginButton.layer setCornerRadius:kCornerRadius];
        _loginButton.layer.masksToBounds = YES;
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
        _forgetButton.titleLabel.font = kMediumFont;
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
        _registerButton.titleLabel.font = kMediumFont;
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
    
    [self addSubview:self.backgroundView];
    [self addSubview:self.logoView];
    [self addSubview:self.containerView];
    [self.containerView addSubview:self.titleButton];
    [self.containerView addSubview:self.userView];
    [self.containerView addSubview:self.passwordView];
    [self.containerView addSubview:self.userField];
    [self.containerView addSubview:self.passwordField];
    [self.containerView addSubview:self.userLine];
    [self.containerView addSubview:self.passwordLine];
    [self.containerView addSubview:self.loginButton];
    [self.containerView addSubview:self.forgetButton];
    [self addSubview:self.registerButton];
}

/**
 *  初始化约束方法
 */
- (void)setupConstraints {
 
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kLogoViewWidth);
        make.height.equalTo(kLogoViewHeight);
        make.centerX.equalTo(self);
        make.top.equalTo(self.top).with.offset(kLogoViewTop);
    }];

    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kContainerViewWidth);
        make.height.equalTo(kContainerViewHeight);
        make.centerX.equalTo(self);
        make.top.equalTo(self.logoView.bottom).with.offset(kContainerViewTop);
    }];
    
    [self.titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.containerView);
        make.height.equalTo(kTitleButtonHight);
        make.left.equalTo(self.containerView);
        make.top.equalTo(self.containerView);
    }];
    
    [self.userView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kUserViewAndPasswordViewWidth);
        make.height.equalTo(kUserViewAndPasswordViewHeight);
        make.top.equalTo(self.titleButton.bottom).with.offset(kUserViewTop);
        make.left.equalTo(self.titleButton.left).with.offset(kUserViewLeft);
    }];
    
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kUserViewAndPasswordViewWidth);
        make.height.equalTo(kUserViewAndPasswordViewHeight);
        make.top.equalTo(self.userView.bottom).with.offset(kPasswordTop);
        make.left.equalTo(self.userView.left);
    }];
    
    [self.userField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kUserFieldAndPasswordFieldWidth);
        make.height.equalTo(kUserFieldAndPasswordFieldHeight);
        make.centerY.equalTo(self.userView);
        make.left.equalTo(self.userView.right).with.offset(kUserFieldLeft);
    }];
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kUserFieldAndPasswordFieldWidth);
        make.height.equalTo(kUserFieldAndPasswordFieldHeight);
        make.centerY.equalTo(self.passwordView);
        make.left.equalTo(self.userField.left);
    }];
    
    [self.userLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(kUserLineAndPasswordLineHeight);
        make.top.equalTo(self.userView.bottom).with.offset(kUserLineAndPasswordLineTopAndLeftAndRight);
        make.left.equalTo(self.containerView.left).with.offset(kUserLineAndPasswordLineTopAndLeftAndRight);
        make.right.equalTo(self.containerView.right).with.offset(-kUserLineAndPasswordLineTopAndLeftAndRight);
    }];
    
    [self.passwordLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(kUserLineAndPasswordLineHeight);
        make.top.equalTo(self.passwordView.bottom).with.offset(kUserLineAndPasswordLineTopAndLeftAndRight);
        make.left.equalTo(self.containerView.left).with.offset(kUserLineAndPasswordLineTopAndLeftAndRight);
        make.right.equalTo(self.containerView.right).with.offset(-kUserLineAndPasswordLineTopAndLeftAndRight);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(kLoginButtonHeight);
        make.top.equalTo(self.passwordLine.bottom).with.offset(kLoginButtonTop);
        make.left.equalTo(self.containerView.left).with.offset(kLoginButtonLeftAndRight);
        make.right.equalTo(self.containerView.right).with.offset(-kLoginButtonLeftAndRight);
    }];
    
    [self.forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.containerView);
        make.height.equalTo(kForgetButtonAndRegisterButtonHeight);
        make.centerX.equalTo(self.containerView);
        make.top.equalTo(self.loginButton.bottom).with.offset(kForgetButtonTop);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self);
        make.height.equalTo(kForgetButtonAndRegisterButtonHeight);
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.bottom).with.offset(-kRegisterButtonBottom);
    }];
}

@end
