//
//  LoginViewController.m
//      CCFreshStoreApp
//      Chen Chen @ April 9th, 2017
//

#import "LoginViewController.h"

// Tool
#import "CCTConst.h"

// Model
#import "UserModel.h"

// View
#import "LoginView.h"
#import "RegisterView.h"

@interface LoginViewController () <LoginViewDelegate, RegisterViewDelegate>

/// 登录视图
@property (nonatomic, strong) LoginView *loginView;
/// 注册视图
@property (nonatomic, strong) RegisterView *registerView;
/// 注册用户模型
@property (nonatomic, strong) UserModel *userModel;

@end

@implementation LoginViewController

#pragma mark - 系统方法

/**
 *  视图已经加载方法
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - 界面方法

/**
 *  初始化界面方法
 */
- (void)setupUI {
    
    self.navigationController.navigationBar.translucent = YES;
    if (!self.loginView) {
        self.loginView = [[LoginView alloc] initWithFrame:kScreenFrame];
        self.loginView.delegate = self;
        [self.view addSubview:self.loginView];
    }
    
    if (!self.registerView) {
        self.registerView = [[RegisterView alloc] initWithFrame:kScreenFrame];
        self.registerView.delegate = self;
        self.registerView.hidden = YES;
        [self.view addSubview:self.registerView];
    }
}

#pragma mark - LoginViewDelegate代理方法

/**
 *  点击登录按钮方法
 */
- (void)loginViewDidClickLoginButton:(LoginView *)loginView context:(NSDictionary *)dict {
    
    NSLog(@"%s", __func__);
}

/**
 *  点击忘记密码按钮方法
 */
- (void)loginViewDidClickForgetButton:(LoginView *)loginView {
    
    NSLog(@"%s", __func__);
}

/**
 *  点击注册按钮方法
 */
- (void)loginViewDidClickRegisterButton:(LoginView *)loginView {
    
    self.registerView.hidden = NO;
    self.loginView.hidden = YES;
}

#pragma mark - RegisterViewDelegate代理方法

/**
 *  点击注册按钮方法
 */
- (void)registerViewDidClickRegisterButton:(RegisterView *)registerView context:(NSDictionary *)dict {
    
    self.userModel = [UserModel userWithDict:dict];
    NSString *uuid = [[NSString alloc] uuidString];
    NSString *date = [[NSString alloc] nowDateString];
    NSString *test = [NSString stringWithFormat:@"%@%@", uuid, date];
    
    self.userModel.userID = [test md5String];
    
    self.registerView.hidden = YES;
    self.loginView.hidden = NO;
}

@end
