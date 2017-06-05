//
//  WebViewController.m
//      CCFreshStoreApp
//      Chen Chen @ March 27th, 2017
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

#import "Const.h"

NSString *const estimatedProgress = @"estimatedProgress";

@interface WebViewController () <WKNavigationDelegate>

/// 网页视图
@property (nonatomic, strong) WKWebView *webView;
/// 进度条
@property (nonatomic, strong) UIProgressView *webProgressView;
/// 后退按钮
@property (nonatomic, strong) UIBarButtonItem *backItem;
/// 关闭按钮
@property (nonatomic, strong) UIBarButtonItem *closeItem;
/// 网页URL
@property (nonatomic, copy) NSString *url;

@end

@implementation WebViewController 

#pragma mark - 初始化方法

/**
 *  反初始化方法
 */
- (void)dealloc {
    
    [self.webView removeObserver:self forKeyPath:estimatedProgress];
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
 *  KVO观察者方法
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.webView && [keyPath isEqualToString:estimatedProgress]) {
        CGFloat new = [change[NSKeyValueChangeNewKey] floatValue];
        if (new == 1.0) {
            [self.webProgressView setProgress:1.0 animated:NO];
            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC));
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                self.webProgressView.hidden = YES;
                [self.webProgressView setProgress:0.0 animated:NO];
            });
            
        } else {
            self.webProgressView.hidden = NO;
            [self.webProgressView setProgress:new animated:YES];
        }
    }
}

#pragma mark - 界面方法

/**
 *  初始化界面方法
 */
- (void)setupUI {
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:20], NSForegroundColorAttributeName: kMainColor};
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.navigationBar.tintColor = kMainColor;
    self.navigationItem.title = @"";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(refreshItemDidClick)];
    self.navigationItem.rightBarButtonItem.tintColor = kMainColor;
    self.view.backgroundColor = kCommonLightColor;
    
    if (self.webView == nil) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        configuration.allowsAirPlayForMediaPlayback = YES;
        configuration.allowsInlineMediaPlayback = YES;
        configuration.suppressesIncrementalRendering = YES;
        
        self.webView = [[WKWebView alloc] initWithFrame:kScreenFrame configuration:configuration];
        self.webView.opaque = NO;
        self.webView.allowsBackForwardNavigationGestures = YES;
        self.webView.scrollView.showsVerticalScrollIndicator = YES;
        self.webView.navigationDelegate = self;
        [self.webView sizeToFit];
        [self.webView addObserver:self forKeyPath:estimatedProgress options:NSKeyValueObservingOptionNew context:nil];
        [self.view addSubview:self.webView];
    }
    
    if (self.webProgressView == nil) {
        self.webProgressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        self.webProgressView.frame = CGRectMake(0, 0, kScreenWidth, 2);
        self.webProgressView.trackTintColor = kClearColor;
        self.webProgressView.progressTintColor = kMainColor;
        [self.view addSubview:self.webProgressView];
    }
    
    if (self.backItem == nil) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        UIImage *image = [UIImage imageNamed:@"main_back"];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [button setImage:image forState:UIControlStateNormal];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:kMainColor forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:17];
        
        [button addTarget:self action:@selector(backItemDidClick) forControlEvents:UIControlEventTouchUpInside];
        [button sizeToFit];
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 0);
        button.frame = CGRectMake(0, 0, 50, 40);
        
        self.backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = self.backItem;
    }
    
    if (self.closeItem == nil) {
        self.closeItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(closeItemDidClick)];
    }
}

/**
 *  读取URL方法
 */
- (void)loadWithURLString:(NSString *)urlString {
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

#pragma mark - 按钮方法

/**
 *  后退按钮点击方法
 */
- (void)backItemDidClick {
    
    if (self.webView.canGoBack) {
        [self.webView goBack];
        [self.closeItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} forState:UIControlStateNormal];
        self.navigationItem.leftBarButtonItems = @[self.backItem, self.closeItem];

    } else {
        [self closeItemDidClick];
    }
}

/**
 *  关闭按钮点击方法
 */
- (void)closeItemDidClick {

    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  刷新按钮点击方法
 */
- (void)refreshItemDidClick {
    
    [self.webView reload];
}

#pragma mark - WKNavigationDelegate代理方法

/**
 *  网页开始加载方法
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
    self.webProgressView.hidden = NO;
}

/**
 *  网页结束加载方法
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    self.navigationItem.title = self.webView.title;
}

/**
 *  收到响应后跳转方法
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSLog(@"%@", navigationAction.request);
    decisionHandler(WKNavigationActionPolicyAllow);
}

@end
