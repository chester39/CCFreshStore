//
//  LoginViewController.m
//      CCFreshStoreApp
//      Chen Chen @ April 9th, 2017
//

#import "LoginViewController.h"
#import "Const.h"
#import "LoginView.h"
#import "RegisterView.h"

@interface LoginViewController () <LoginViewDelegate, RegisterViewDelegate>

/// 登录视图
@property (nonatomic, strong) LoginView *loginView;
/// 注册视图
@property (nonatomic, strong) RegisterView *registerView;

@end

@implementation LoginViewController

#pragma mark - 初始化方法

/**
 *  反初始化方法
 */
- (void)dealloc {
    
    self.loginView = nil;
    self.registerView = nil;
}

#pragma mark - 系统方法

/**
 *  视图已经加载方法
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupUI];
}

/**
 *  初始化界面方法
 */
- (void)setupUI {
    
    self.navigationController.navigationBar.translucent = YES;
    if (self.loginView == nil) {
        self.loginView = [[LoginView alloc] initWithFrame:kScreenFrame];
        self.loginView.delegate = self;
        [self.view addSubview:self.loginView];
    }
    
    if (self.registerView == nil) {
        self.registerView = [[RegisterView alloc] initWithFrame:kScreenFrame];
        self.registerView.delegate = self;
        self.registerView.hidden = YES;
        [self.view addSubview:self.registerView];
    }
}

#pragma mark - LoginViewDelegate代理方法

/**
 *  LoginView点击登录按钮代理方法
 */
- (void)loginViewDidClickLoginButton:(LoginView *)loginView {
    
    NSLog(@"%s", __func__);
}

/**
 *  LoginView点击忘记密码按钮代理方法
 */
- (void)loginViewDidClickForgetButton:(LoginView *)loginView {
    
    NSLog(@"%s", __func__);
}

/**
 *  LoginView点击注册按钮代理方法
 */
- (void)loginViewDidClickRegisterButton:(LoginView *)loginView {
    
    NSLog(@"%s", __func__);
    self.registerView.hidden = NO;
    self.loginView.hidden = YES;
}

#pragma mark - RegisterViewDelegate代理方法

/**
 *  RegisterView点击注册按钮代理方法
 */
- (void)registerViewDidClickRegisterButton:(RegisterView *)registerView {
    
    NSLog(@"%s", __func__);
    self.registerView.hidden = YES;
    self.loginView.hidden = NO;
}

@end
