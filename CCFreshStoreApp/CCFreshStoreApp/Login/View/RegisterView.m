//
//  RegisterView.m
//      CCFreshStoreApp
//      Chen Chen @ June 6th, 2017
//

#import "RegisterView.h"
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
/// 昵称消息框
@property (nonatomic, strong) MessageBoxView *nicknameView;
/// 注册按钮
@property (nonatomic, strong) UIButton *registerButton;

@end

@implementation RegisterView

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

    if (self.phoneView == nil) {
        self.phoneView = [[MessageBoxView alloc] init];
        [self.phoneView layoutUIWithType:MessageBoxTypePhone placeholder:@"请输入手机号" isLine:YES];
        [self.containerView addSubview:self.phoneView];
    }
    
    if (self.nicknameView == nil) {
        self.nicknameView = [[MessageBoxView alloc] init];
        [self.nicknameView layoutUIWithType:MessageBoxTypeNickname placeholder:@"请输入昵称" isLine:YES];
        [self.containerView addSubview:self.nicknameView];
    }
    
    if (self.registerButton == nil) {
        self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [self.registerButton setTitleColor:kCommonLightColor forState:UIControlStateNormal];
        [self.registerButton setBackgroundColor:kMainColor];
        
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
        make.top.equalTo(self.top).with.offset(kLogoViewTopMargin);
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(kContainerViewWidth);
        make.height.equalTo(kContainerViewHeight);
        make.centerX.equalTo(self);
        make.top.equalTo(self.logoView.bottom).with.offset(kContainerViewTopMargin);
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
}

@end
