//
//  WebViewController.m
//      CCFreshStoreApp
//      Chen Chen @ March 27th, 2017
//

#import "WebViewController.h"

// Framework
#import <WebKit/WebKit.h>

// Tool
#import "CCTConst.h"

// 进度条相关常数
static const CGFloat kProgressViewHeight = 2;
static NSString *const kEstimatedProgress = @"estimatedProgress";
// 后退导航按钮相关常数
static const CGFloat kBackItemWidth = 30;
static const CGFloat kBackItemHeight = 30;
// 关闭导航按钮相关常数
static const CGFloat kCloseItemWidth = 25;
static const CGFloat kCloseItemHeight = 25;

@interface WebViewController () <WKNavigationDelegate>

/// 网页视图
@property (nonatomic, strong) WKWebView *webView;
/// 进度条
@property (nonatomic, strong) UIProgressView *progressView;
/// 后退导航按钮
@property (nonatomic, strong) UIBarButtonItem *backItem;
/// 关闭导航按钮
@property (nonatomic, strong) UIBarButtonItem *closeItem;
/// 网页URL
@property (nonatomic, copy) NSString *urlString;

@end

@implementation WebViewController 

#pragma mark - 初始化方法

/**
 *  释放内存方法
 */
- (void)dealloc {
    
    [self.webView removeObserver:self forKeyPath:kEstimatedProgress];
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
    if (object == self.webView && [keyPath isEqualToString:kEstimatedProgress]) {
        CGFloat new = [change[NSKeyValueChangeNewKey] floatValue];
        if (new == 1.0) {
            [self.progressView setProgress:1.0 animated:NO];
            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC));
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                self.progressView.hidden = YES;
                [self.progressView setProgress:0.0 animated:NO];
            });
            
        } else {
            self.progressView.hidden = NO;
            [self.progressView setProgress:new animated:YES];
        }
    }
}

#pragma mark - 界面方法

/**
 *  初始化界面方法
 */
- (void)setupUI {
    
    [self setupOverallUI];
    [self setupComponentUI];
}

/**
 *  初始化整体界面方法
 */
- (void)setupOverallUI {
    
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:20], NSForegroundColorAttributeName: kMainColor};
    self.navigationController.navigationBar.tintColor = kMainColor;
    self.navigationItem.title = @"";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(refreshItemDidClick)];
    self.navigationItem.rightBarButtonItem.tintColor = kMainColor;
    self.view.backgroundColor = kCommonLightColor;
}

/**
 *  初始化组件界面方法
 */
- (void)setupComponentUI {
    
    if (!self.webView) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        configuration.allowsAirPlayForMediaPlayback = YES;
        configuration.allowsInlineMediaPlayback = YES;
        configuration.suppressesIncrementalRendering = YES;
        configuration.selectionGranularity = YES;
        
        self.webView = [[WKWebView alloc] initWithFrame:kScreenFrame configuration:configuration];
        self.webView.opaque = NO;
        self.webView.allowsBackForwardNavigationGestures = YES;
        self.webView.scrollView.showsVerticalScrollIndicator = YES;
        self.webView.navigationDelegate = self;
        [self.webView sizeToFit];
        [self.webView addObserver:self forKeyPath:kEstimatedProgress options:NSKeyValueObservingOptionNew context:nil];
        
        NSURL *url = [NSURL URLWithString:self.urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
        [self.view addSubview:self.webView];
    }
    
    if (!self.progressView) {
        self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        self.progressView.frame = CGRectMake(0, kTopHeight, kScreenWidth, kProgressViewHeight);
        self.progressView.trackTintColor = kClearColor;
        self.progressView.progressTintColor = kMainColor;
        [self.view addSubview:self.progressView];
    }
    
    if (!self.backItem) {
        CGRect rect = CGRectMake(0, 0, kBackItemWidth, kBackItemHeight);
        self.backItem = [UIBarButtonItem barButtonItemWithFrame:rect image:@"main_back" target:self action:@selector(backItemDidClick)];
        self.navigationItem.leftBarButtonItem = self.backItem;
    }
    
    if (!self.closeItem) {
        CGRect rect = CGRectMake(0, 0, kCloseItemWidth, kCloseItemHeight);
        self.closeItem = [UIBarButtonItem barButtonItemWithFrame:rect image:@"main_close" target:self action:@selector(closeItemDidClick)];
    }
}

/**
 *  读取URL方法
 */
- (void)loadWithURLString:(NSString *)urlString {
    
    self.urlString = urlString;
}

#pragma mark - 按钮方法

/**
 *  后退按钮点击方法
 */
- (void)backItemDidClick {
    
    if (self.webView.canGoBack) {
        [self.webView goBack];
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
    
    self.progressView.hidden = NO;
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
