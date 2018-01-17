//
//  LoginView.m
//      CCFreshStoreApp
//      Chen Chen @ April 9th, 2017
//

#import "LoginView.h"

// Tool
#import "Const.h"

// View
#import "MessageBoxView.h"
#import "WaveButton.h"

// Third Party
#import "Masonry.h"
#import "MBProgressHUD+CCTools.h"

#pragma mark - 界面常数

// 标志图片视图相关常数
static const CGFloat kLogoViewWidth = 150;
static const CGFloat kLogoViewHeight = 50;
static const CGFloat kLogoViewTopMargin = 80;

// 容器视图相关常数
static const CGFloat kContainerViewWidth = 300;
static const CGFloat kContainerViewHeight = 340;
static const CGFloat kContainerViewTopMargin = 30;

// 标题按钮相关常数
static const CGFloat kTitleButtonHight = 60;

// 用户消息框相关常数
static const CGFloat kUserViewHeight = 40;
static const CGFloat kUserViewTopMargin = 30;
static const CGFloat kUserViewLeftMargin = 20;
static const CGFloat kUserViewRightMargin = 20;

// 密码消息框相关常数
static const CGFloat kPasswordViewHeight = 40;
static const CGFloat kPasswordViewTopMargin = 30;

// 登录按钮相关常数
static const CGFloat kLoginButtonHeight = 40;
static const CGFloat kLoginButtonTopMargin = 40;
static const CGFloat kLoginButtonLeftMargin = 10;
static const CGFloat kLoginButtonRightMargin = 10;

// 忘记密码按钮相关常数
static const CGFloat kForgetButtonHeight = 30;
static const CGFloat kForgetButtonTopMargin = 20;

// 注册按钮相关常数
static const CGFloat kRegisterButtonHeight = 30;
static const CGFloat kRegisterButtonBottomMargin = 20;

/// 圆角半径
static const CGFloat kCornerRadius = 5;

@interface LoginView ()

/// 背景图片视图
@property (nonatomic, strong) UIImageView *backgroundView;
/// 标志图片视图
@property (nonatomic, strong) UIImageView *logoView;
/// 容器视图
@property (nonatomic, strong) UIView *containerView;
/// 标题按钮
@property (nonatomic, strong) UIButton *titleButton;
/// 账号消息框
@property (nonatomic, strong) MessageBoxView *userView;
/// 密码消息框
@property (nonatomic, strong) MessageBoxView *passwordView;
/// 登录按钮
@property (nonatomic, strong) WaveButton *loginButton;
/// 忘记密码按钮
@property (nonatomic, strong) UIButton *forgetButton;
/// 注册按钮
@property (nonatomic, strong) UIButton *registerButton;
/// 数据字典
@property (nonatomic, strong) NSDictionary *dict;

@end

@implementation LoginView

#pragma mark - 初始化方法

/**
 *  尺寸初始化方法
 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self setupConstraints];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(messageBoxViewValueChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    }
    
    return self;
}

/**
 *  释放内存方法
 */
- (void)dealloc {
    
    self.backgroundView = nil;
    self.logoView = nil;
    self.containerView = nil;
    self.titleButton = nil;
    self.userView = nil;
    self.passwordView = nil;
    self.loginButton = nil;
    self.forgetButton =nil;
    self.registerButton = nil;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 界面方法

/**
 *  初始化界面方法
 */
- (void)setupUI {
    
    [self setupOverallUI];
    [self setupContainerUI];
}

/**
 *  初始化整体界面方法
 */
- (void)setupOverallUI {
    
    if (!self.backgroundView) {
        UIImage *image = [UIImage imageNamed:@"login_background"];
        self.backgroundView = [[UIImageView alloc] initWithImage:image];
        self.backgroundView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.backgroundView];
    }
    
    if (!self.logoView) {
        UIImage *image = [UIImage imageNamed:@"login_logo"];
        self.logoView = [[UIImageView alloc] initWithImage:image];
        self.logoView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.logoView];
    }
    
    if (!self.containerView) {
        self.containerView = [[UIView alloc] init];
        self.containerView.alpha = 0.9;
        self.containerView.backgroundColor = kCommonLightColor;
        [self.containerView.layer setBorderWidth:1.0];
        [self.containerView.layer setBorderColor:kCommonLightColor.CGColor];
        [self.containerView.layer setCornerRadius:kCornerRadius];
        [self.containerView.layer setShadowOpacity:0.1];
        [self.containerView.layer setShadowColor:kCommonDarkColor.CGColor];
        [self.containerView.layer setShadowRadius:kCornerRadius];
        [self addSubview:self.containerView];
    }
    
    if (!self.registerButton) {
        self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.registerButton setTitle:@"还没有账号，点击注册" forState:UIControlStateNormal];
        [self.registerButton setTitleColor:kAuxiliaryColor forState:UIControlStateNormal];
        self.registerButton.titleLabel.font = kMediumFont;
        [self.registerButton addTarget:self action:@selector(registerButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        [self.registerButton.layer setBorderWidth:0];
        [self addSubview:self.registerButton];
    }
}

/**
 *  初始化容器界面方法
 */
- (void)setupContainerUI {
    
    if (!self.titleButton) {
        self.titleButton = [[UIButton alloc] init];
        self.titleButton.backgroundColor = kLineGrayColor;
        self.titleButton.userInteractionEnabled = NO;
        [self.titleButton setTitle:@"账号登录" forState:UIControlStateNormal];
        [self.titleButton setTitleColor:kTextBlackColor forState:UIControlStateNormal];
        self.titleButton.titleLabel.font = kHeadFont;
        [self.titleButton.layer setShadowColor:kCommonDarkColor.CGColor];
        [self.titleButton.layer setCornerRadius:kCornerRadius];
        [self.containerView addSubview:self.titleButton];
    }
    
    if (!self.userView) {
        self.userView = [[MessageBoxView alloc] init];
        [self.userView layoutUIWithType:MessageBoxTypeAccount placeholder:@"请输入用户名" isLine:YES];
        [self.containerView addSubview:self.userView];
    }
    
    if (!self.passwordView) {
        self.passwordView = [[MessageBoxView alloc] init];
        [self.passwordView layoutUIWithType:MessageBoxTypePassword placeholder:@"请输入密码" isLine:YES];
        [self.containerView addSubview:self.passwordView];
    }
    
    if (!self.loginButton) {
        self.loginButton = [[WaveButton alloc] init];
        self.loginButton.waveColor = [UIColor colorWithHexString:@"#FFFFFF" alpha:0.5];
        [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [self.loginButton setTitleColor:kCommonLightColor forState:UIControlStateNormal];
        [self.loginButton setBackgroundColor:kMainColor];
        [self.loginButton addTarget:self action:@selector(loginButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        self.loginButton.enabled = NO;
        [self.loginButton.layer setCornerRadius:kCornerRadius];
        self.loginButton.layer.masksToBounds = YES;
        [self.containerView addSubview:self.loginButton];
    }
    
    if (!self.forgetButton) {
        self.forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [self.forgetButton setTitleColor:kAuxiliaryColor forState:UIControlStateNormal];
        self.forgetButton.titleLabel.font = kMediumFont;
        [self.forgetButton addTarget:self action:@selector(forgetButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        [self.forgetButton.layer setBorderWidth:0];
        [self.containerView addSubview:self.forgetButton];
    }
}

#pragma mark - 约束方法

/**
 *  初始化约束方法
 */
- (void)setupConstraints {
    
    [self setupOverallConstraints];
    [self setupContainerConstraints];
}

/**
 *  初始化整体约束方法
 */
- (void)setupOverallConstraints {
    
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kLogoViewWidth);
        make.height.equalTo(kLogoViewHeight);
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(kLogoViewTopMargin);
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kContainerViewWidth);
        make.height.equalTo(kContainerViewHeight);
        make.centerX.equalTo(self);
        make.top.equalTo(self.logoView.bottom).offset(kContainerViewTopMargin);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self);
        make.height.equalTo(kRegisterButtonHeight);
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).offset(-kRegisterButtonBottomMargin);
    }];
}

/**
 *  初始化容器约束方法
 */
- (void)setupContainerConstraints {
    
    [self.titleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.containerView);
        make.height.equalTo(kTitleButtonHight);
        make.top.equalTo(self.containerView);
        make.left.equalTo(self.containerView);
    }];
    
    [self.userView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(kUserViewHeight);
        make.top.equalTo(self.titleButton.bottom).offset(kUserViewTopMargin);
        make.left.equalTo(self.titleButton).offset(kUserViewLeftMargin);
        make.right.equalTo(self.titleButton).offset(-kUserViewRightMargin);
    }];
    
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(kPasswordViewHeight);
        make.top.equalTo(self.userView.bottom).offset(kPasswordViewTopMargin);
        make.left.equalTo(self.userView);
        make.right.equalTo(self.userView);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(kLoginButtonHeight);
        make.top.equalTo(self.passwordView.bottom).offset(kLoginButtonTopMargin);
        make.left.equalTo(self.containerView).offset(kLoginButtonLeftMargin);
        make.right.equalTo(self.containerView).offset(-kLoginButtonRightMargin);
    }];
    
    [self.forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.containerView);
        make.height.equalTo(kForgetButtonHeight);
        make.centerX.equalTo(self.containerView);
        make.top.equalTo(self.loginButton.bottom).offset(kForgetButtonTopMargin);
    }];
}

#pragma mark - 控件状态方法

/**
 *  检查按钮状态方法
 */
- (void)checkButtonState {
    
    if (self.userView.text.length > 0 && self.passwordView.text.length > 0) {
        self.loginButton.enabled = YES;
        
    } else {
        self.loginButton.enabled = NO;
    }
}

#pragma mark - 点击方法

/**
 *  登录按钮点击方法
 */
- (void)loginButtonDidClick
{
    [self endEditing:YES];
    NSString *account = [self.userView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (!CCTNSStringCheck(account) || !CCTNSStringCheck(password)) {
        return;
    }
    
    self.dict = @{kUserAccount:account, kUserPassword:password};
    if (CCTDelegateCheckToSelector(self.delegate, @selector(loginViewDidClickLoginButton:context:))) {
        [self.delegate loginViewDidClickLoginButton:self context:self.dict];
    }
    [MBProgressHUD showMessageWithText:@"登录成功" time:1];
}

/**
 *  忘记密码按钮点击方法
 */
- (void)forgetButtonDidClick {
    
    [self endEditing:YES];
    if (CCTDelegateCheckToSelector(self.delegate, @selector(loginViewDidClickForgetButton:))) {
        [self.delegate loginViewDidClickForgetButton:self];
    }
}

/**
 *  注册按钮点击方法
 */
- (void)registerButtonDidClick {
    
    [self endEditing:YES];
    if (CCTDelegateCheckToSelector(self.delegate, @selector(loginViewDidClickRegisterButton:))) {
        [self.delegate loginViewDidClickRegisterButton:self];
    }
}

#pragma mark - 通知方法

/**
 *  消息框值改变方法
 */
- (void)messageBoxViewValueChanged:(NSNotification *)notification {
    
    if ([notification.object isKindOfClass:[UITextField class]] == NO) {
        return;
    }
    
    [self checkButtonState];
}

@end
