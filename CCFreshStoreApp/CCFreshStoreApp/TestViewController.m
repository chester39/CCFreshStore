//
//  TestViewController.m
//      CCFreshStoreApp
//      Chen Chen @ March 19th, 2017
//

#import "TestViewController.h"

// Tool
#import "Const.h"

// Controller
#import "WebViewController.h"
#import "LoginViewController.h"

@interface TestViewController ()

@property (nonatomic, strong) UIButton *webTestButton;
@property (nonatomic, strong) UIButton *loginTestButton;

@end

@implementation TestViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if (!self.webTestButton) {
        self.webTestButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.webTestButton.frame = CGRectMake(20, 150, 150, 150);
        [self.webTestButton setTitle:@"网页测试" forState:UIControlStateNormal];
        [self.webTestButton setTitleColor:kMainColor forState:UIControlStateNormal];
        [self.webTestButton setBackgroundColor:kAuxiliaryColor];
        [self.webTestButton addTarget:self action:@selector(webButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.webTestButton];
    }
    
    if (!self.loginTestButton) {
        self.loginTestButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.loginTestButton.frame = CGRectMake(20, 350, 150, 150);
        [self.loginTestButton setTitle:@"登录测试" forState:UIControlStateNormal];
        [self.loginTestButton setTitleColor:kMainColor forState:UIControlStateNormal];
        [self.loginTestButton setBackgroundColor:kAuxiliaryColor];
        [self.loginTestButton addTarget:self action:@selector(loginButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.loginTestButton];
    }
}

- (void)webButtonDidClick {
    
    WebViewController *webVC = [[WebViewController alloc] init];
    NSString *urlString = @"https://chesterhupu.kuaizhan.com/";
    [webVC loadWithURLString:urlString];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)loginButtonDidClick {
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
}

@end
