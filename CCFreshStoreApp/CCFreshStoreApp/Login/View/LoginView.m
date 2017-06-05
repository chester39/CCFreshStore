//
//  LoginView.m
//      CCFreshStoreApp
//      Chen Chen @ April 9th, 2017
//

#import "LoginView.h"
#import "Const.h"
#import "MessageBoxView.h"

#import "Masonry.h"

#pragma mark - 界面常数

// 标志图片视图相关常数
static const CGFloat kLogoViewWidth = 150;
static const CGFloat kLogoViewHeight = 50;
static const CGFloat kLogoViewTopMargin = 50;

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
static const CGFloat kRegisterButtonBottomMargin = 40;

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
@property (nonatomic, strong) UIButton *loginButton;
/// 忘记密码按钮
@property (nonatomic, strong) UIButton *forgetButton;
/// 注册按钮
@property (nonatomic, strong) UIButton *registerButton;

@end

@implementation LoginView

#pragma mark - 初始化方法

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
    
    [self setupOverallUI];
    [self setupContainerUI];
}

/**
 *  初始化整体界面方法
 */
- (void)setupOverallUI {
    
    if (self.backgroundView == nil) {
        UIImage *image = [UIImage imageNamed:@"login_background"];
        self.backgroundView = [[UIImageView alloc] initWithImage:image];
        self.backgroundView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.backgroundView];
    }
    
    if (self.logoView == nil) {
        UIImage *image = [UIImage imageNamed:@"login_logo"];
        self.logoView = [[UIImageView alloc] initWithImage:image];
        self.logoView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.logoView];
    }
    
    if (self.containerView == nil) {
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
    
    if (self.registerButton == nil) {
        self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.registerButton setTitle:@"还没有账号，点击注册" forState:UIControlStateNormal];
        [self.registerButton setTitleColor:kAuxiliaryColor forState:UIControlStateNormal];
        self.registerButton.titleLabel.font = kMediumFont;
        
        [self.registerButton.layer setBorderWidth:0];
        [self addSubview:self.registerButton];
    }
}

/**
 *  初始化容器界面方法
 */
- (void)setupContainerUI {
    
    if (self.titleButton == nil) {
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
    
    if (self.userView == nil) {
        self.userView = [[MessageBoxView alloc] init];
        [self.userView layoutUIWithType:MessageBoxTypeUserAccount placeholder:@"请输入用户名" isLine:YES];
        [self.containerView addSubview:self.userView];
    }
    
    if (self.passwordView == nil) {
        self.passwordView = [[MessageBoxView alloc] init];
        [self.passwordView layoutUIWithType:MessageBoxTypePassword placeholder:@"请输入密码" isLine:YES];
        [self.containerView addSubview:self.passwordView];
    }
    
    if (self.loginButton == nil) {
        self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [self.loginButton setTitleColor:kCommonLightColor forState:UIControlStateNormal];
        [self.loginButton setBackgroundColor:kMainColor];
        
        [self.loginButton.layer setCornerRadius:kCornerRadius];
        self.loginButton.layer.masksToBounds = YES;
        [self.containerView addSubview:self.loginButton];
    }
    
    if (self.forgetButton == nil) {
        self.forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [self.forgetButton setTitleColor:kAuxiliaryColor forState:UIControlStateNormal];
        self.forgetButton.titleLabel.font = kMediumFont;
        
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
        make.top.equalTo(self.top).with.offset(kLogoViewTopMargin);
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kContainerViewWidth);
        make.height.equalTo(kContainerViewHeight);
        make.centerX.equalTo(self);
        make.top.equalTo(self.logoView.bottom).with.offset(kContainerViewTopMargin);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self);
        make.height.equalTo(kRegisterButtonHeight);
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.bottom).with.offset(-kRegisterButtonBottomMargin);
    }];
}

/**
 *  初始化整体约束方法
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
        make.top.equalTo(self.titleButton.bottom).with.offset(kUserViewTopMargin);
        make.left.equalTo(self.titleButton.left).with.offset(kUserViewLeftMargin);
        make.right.equalTo(self.titleButton.right).with.offset(-kUserViewRightMargin);
    }];
    
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(kPasswordViewHeight);
        make.top.equalTo(self.userView.bottom).with.offset(kPasswordViewTopMargin);
        make.left.equalTo(self.userView.left);
        make.right.equalTo(self.userView.right);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(kLoginButtonHeight);
        make.top.equalTo(self.passwordView.bottom).with.offset(kLoginButtonTopMargin);
        make.left.equalTo(self.containerView.left).with.offset(kLoginButtonLeftMargin);
        make.right.equalTo(self.containerView.right).with.offset(-kLoginButtonRightMargin);
    }];
    
    [self.forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.containerView);
        make.height.equalTo(kForgetButtonHeight);
        make.centerX.equalTo(self.containerView);
        make.top.equalTo(self.loginButton.bottom).with.offset(kForgetButtonTopMargin);
    }];
}

@end
