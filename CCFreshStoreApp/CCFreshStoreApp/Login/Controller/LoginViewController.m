//
//  LoginViewController.m
//      CCFreshStoreApp
//      Chen Chen @ April 9th, 2017
//

#import "LoginViewController.h"
#import "Const.h"
#import "LoginView.h"

@interface LoginViewController ()

/// 登录视图
@property (nonatomic, strong) LoginView *loginView;

@end

@implementation LoginViewController

#pragma mark - 初始化方法

/**
 *  登录视图惰性初始化方法
 */
- (LoginView *)loginView {
    
    if (_loginView == nil) {
        _loginView = [[LoginView alloc] initWithFrame:CGRectMake(0, kTopHeight, kScreenWidth, kAvailableHeight)];
    }
    
    return _loginView;
}

/**
 *  空初始化方法
 */
- (instancetype)init {
    
    self = [super initWithNibName:nil bundle:nil];
    if (self != nil) {
        
        [self setupUI];
    }
    
    return self;
}

#pragma mark - 系统方法

/**
 *  视图已经加载方法
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
}

/**
 *  初始化界面方法
 */
- (void)setupUI {
    
    self.navigationController.navigationBar.translucent = NO;
    [self.view addSubview:self.loginView];
}

@end
