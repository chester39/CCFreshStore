//
//  WebViewController.m
//      CCFreshStoreApp
//      Chen Chen @ March 27th, 2017
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

NSString *const estimatedProgress = @"estimatedProgress";

@interface WebViewController () <WKNavigationDelegate>

/// 网页视图
@property (strong, nonatomic) WKWebView *webView;
/// 进度条
@property (strong, nonatomic) UIProgressView *webProgressView;
/// 后退按钮
@property (strong, nonatomic) UIBarButtonItem *backItem;
/// 关闭按钮
@property (strong, nonatomic) UIBarButtonItem *closeItem;

@end

@implementation WebViewController

#pragma mark - 初始化方法

/**
 *  网页视图惰性初始化方法
 */
- (WKWebView *)webView {
    
    if (_webView == nil) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        configuration.allowsAirPlayForMediaPlayback = true;
        configuration.allowsInlineMediaPlayback = true;
        configuration.suppressesIncrementalRendering = true;
        
        _webView = [[WKWebView alloc] initWithFrame:kScreenFrame configuration:configuration];
        _webView.opaque = false;
        _webView.allowsBackForwardNavigationGestures = true;
        _webView.scrollView.showsVerticalScrollIndicator = false;
        _webView.navigationDelegate = self;
        [_webView sizeToFit];
        [_webView addObserver:self forKeyPath:estimatedProgress options:NSKeyValueObservingOptionNew context:nil];
        [self.view addSubview:_webView];
    }
    
    return _webView;
}

/**
 *  进度条惰性初始化方法
 */
- (UIProgressView *)webProgressView {
    
    if (_webProgressView == nil) {
        _webProgressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        _webProgressView.frame = CGRectMake(0, 0, kScreenWidth, 2);
        _webProgressView.trackTintColor = kClearColor;
        _webProgressView.progressTintColor = kMainColor;
        [self.view addSubview:_webProgressView];
    }
    
    return _webProgressView;
}

/**
 *  后退按钮惰性初始化方法
 */
- (UIBarButtonItem *)backItem {
    
    if (_backItem == nil) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [button setImage:[UIImage imageNamed:@"backIcon"] forState:UIControlStateNormal];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:kMainColor forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:17];
        
        [button addTarget:self action:@selector(backItemDidClick) forControlEvents:UIControlEventTouchUpInside];
        [button sizeToFit];
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 0);
        button.frame = CGRectMake(0, 0, 50, 40);
        
        _backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    
    return _backItem;
}

/**
 *  关闭按钮惰性初始化方法
 */
- (UIBarButtonItem *)closeItem {
    
    if (_closeItem == nil) {
        _closeItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(closeItemDidClick)];
    }
    
    return _closeItem;
}

/**
 *  空初始化方法
 */
- (instancetype)init {
    
    if (self == nil) {
        self = [super initWithNibName:nil bundle:nil];
    }
    
    return self;
}

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
}

/**
 *  KVO观察者方法
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
        float new = [change[NSKeyValueChangeNewKey] floatValue];
        if (new == 1.0) {
            [self.webProgressView setProgress:1.0 animated:false];
            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC));
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                self.webProgressView.hidden = true;
                [self.webProgressView setProgress:0.0 animated:false];
            });
            
        } else {
            self.webProgressView.hidden = false;
            [self.webProgressView setProgress:new animated:true];
        }
    }
}

#pragma mark - 界面方法

/**
 *  初始化界面方法
 */
- (void)setupUI {
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:20], NSForegroundColorAttributeName: kMainColor};
    self.navigationItem.title = @"";
    self.navigationItem.leftBarButtonItem = self.backItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(refreshItemDidClick)];
    
    self.view.backgroundColor = kCommonLightColor;
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
        self.navigationItem .leftBarButtonItems = @[self.backItem, self.closeItem];

    } else {
        [self closeItemDidClick];
    }
}

/**
 *  关闭按钮点击方法
 */
- (void)closeItemDidClick {

    [self.navigationController popViewControllerAnimated:true];
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
    
    self.webProgressView.hidden = false;
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
