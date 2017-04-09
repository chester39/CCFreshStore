//
//  TestViewController.m
//      CCFreshStoreApp
//      Chen Chen @ March 19th, 2017
//

#import "TestViewController.h"
#import "Const.h"
#import "WebViewController.h"
#import "LoginViewController.h"


@interface TestViewController ()

@property (strong, nonatomic) UIButton *webTestButton;
@property (strong, nonatomic) UIButton *loginTestButton;

@end

@implementation TestViewController

- (UIButton *)webTestButton {
    
    if (_webTestButton == nil) {
        _webTestButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _webTestButton.frame = CGRectMake(kViewStandard, kViewStandard, kViewStandard, kViewStandard);
        [_webTestButton setTitle:@"网页测试" forState:UIControlStateNormal];
        [_webTestButton setTitleColor:kMainColor forState:UIControlStateNormal];
        [_webTestButton setBackgroundColor:kAuxiliaryColor];
        [_webTestButton addTarget:self action:@selector(webButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _webTestButton;
}

- (UIButton *)loginTestButton {
    
    if (_loginTestButton == nil) {
        _loginTestButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginTestButton.frame = CGRectMake(kViewStandard * 2, kViewStandard * 2, kViewStandard, kViewStandard);
        [_loginTestButton setTitle:@"登录测试" forState:UIControlStateNormal];
        [_loginTestButton setTitleColor:kMainColor forState:UIControlStateNormal];
        [_loginTestButton setBackgroundColor:kAuxiliaryColor];
        [_loginTestButton addTarget:self action:@selector(loginButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _loginTestButton;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view addSubview:self.webTestButton];
    [self.view addSubview:self.loginTestButton];
}

- (void)webButtonDidClick {
    
    WebViewController *webVC = [[WebViewController alloc] init];
    NSString *urlString = @"https://chesterhupu.kuaizhan.com/";
    [webVC loadWithURLString:urlString];
    [self.navigationController pushViewController:webVC animated:true];
}

- (void)loginButtonDidClick {
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:true];
}

@end
