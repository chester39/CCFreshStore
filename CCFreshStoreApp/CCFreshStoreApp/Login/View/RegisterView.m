//
//  RegisterView.m
//      CCFreshStoreApp
//      Chen Chen @ June 6th, 2017
//

#import "RegisterView.h"

// Tool
#import "Const.h"

// View
#import "MessageBoxView.h"

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
static const CGFloat kContainerViewHeight = 380;
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

// 手机消息框相关常数
static const CGFloat kPhoneViewHeight = 40;
static const CGFloat kPhoneViewTopMargin = 30;

// 注册按钮相关常数
static const CGFloat kRegisterButtonHeight = 40;
static const CGFloat kRegisterButtonTopMargin = 40;
static const CGFloat kRegisterButtonLeftMargin = 10;
static const CGFloat kRegisterButtonRightMargin = 10;

/// 圆角半径
static const CGFloat kCornerRadius = 5;

@interface RegisterView ()

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
/// 手机消息框
@property (nonatomic, strong) MessageBoxView *phoneView;
/// 注册按钮
@property (nonatomic, strong) UIButton *registerButton;

/// 数据字典
@property (nonatomic, strong) NSDictionary *dict;

@end

@implementation RegisterView

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
    self.phoneView = nil;
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
}

/**
 *  初始化容器界面方法
 */
- (void)setupContainerUI {
    
    if (!self.titleButton) {
        self.titleButton = [[UIButton alloc] init];
        self.titleButton.backgroundColor = kLineGrayColor;
        self.titleButton.userInteractionEnabled = NO;
        [self.titleButton setTitle:@"账号注册" forState:UIControlStateNormal];
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

    if (!self.phoneView) {
        self.phoneView = [[MessageBoxView alloc] init];
        [self.phoneView layoutUIWithType:MessageBoxTypePhone placeholder:@"请输入手机号" isLine:YES];
        [self.containerView addSubview:self.phoneView];
    }
    
    if (!self.registerButton) {
        self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [self.registerButton setTitleColor:kCommonLightColor forState:UIControlStateNormal];
        [self.registerButton setBackgroundColor:kMainColor];
        [self.registerButton addTarget:self action:@selector(registerButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        self.registerButton.enabled = NO;

        [self.registerButton.layer setCornerRadius:kCornerRadius];
        self.registerButton.layer.masksToBounds = YES;
        [self.containerView addSubview:self.registerButton];
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
        make.top.equalTo(self.top).offset(kLogoViewTopMargin);
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kContainerViewWidth);
        make.height.equalTo(kContainerViewHeight);
        make.centerX.equalTo(self);
        make.top.equalTo(self.logoView.bottom).offset(kContainerViewTopMargin);
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
        make.left.equalTo(self.titleButton.left).offset(kUserViewLeftMargin);
        make.right.equalTo(self.titleButton.right).offset(-kUserViewRightMargin);
    }];
    
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(kPasswordViewHeight);
        make.top.equalTo(self.userView.bottom).offset(kPasswordViewTopMargin);
        make.left.equalTo(self.userView.left);
        make.right.equalTo(self.userView.right);
    }];
    
    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(kPhoneViewHeight);
        make.top.equalTo(self.passwordView.bottom).offset(kPhoneViewTopMargin);
        make.left.equalTo(self.userView.left);
        make.right.equalTo(self.userView.right);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(kRegisterButtonHeight);
        make.top.equalTo(self.phoneView.bottom).offset(kRegisterButtonTopMargin);
        make.left.equalTo(self.containerView.left).offset(kRegisterButtonLeftMargin);
        make.right.equalTo(self.containerView.right).offset(-kRegisterButtonRightMargin);
    }];
}

#pragma mark - 控件状态方法

/**
 *  检查按钮状态方法
 */
- (void)checkButtonState {
    
    if (self.userView.text.length > 0 && self.passwordView.text.length > 0 && self.phoneView.text.length > 0) {
        self.registerButton.enabled = YES;
        
    } else {
        self.registerButton.enabled = NO;
    }
}

#pragma mark - 点击方法

/**
 *  注册按钮点击方法
 */
- (void)registerButtonDidClick {
    
    [self endEditing:YES];
    NSString *account = [self.userView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *phone = [self.phoneView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (account == nil || account.length == 0 || password == nil || password.length == 0 || phone == nil || phone.length == 0) {
        return;
    }
    self.dict = @{kUserAccount:account, kUserPassword:password, kUserPhone:phone};
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(registerViewDidClickRegisterButton:context:)]) {
        [self.delegate registerViewDidClickRegisterButton:self context:self.dict];
    }
    [MBProgressHUD showMessageWithText:@"注册成功" time:1.0];
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
