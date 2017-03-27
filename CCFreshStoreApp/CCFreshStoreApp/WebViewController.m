//
//  WebViewController.m
//      CCFreshStoreApp
//      Chen Chen @ March 27th, 2017
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()

/// 网页视图
@property (weak, nonatomic) WKWebView *webView;
/// 进度条
@property (weak, nonatomic) UIProgressView *webProgressView;
/// 后退按钮
@property (weak, nonatomic) UIBarButtonItem *backItem;
/// 关闭按钮
@property (weak, nonatomic) UIBarButtonItem *closeItem;

@end

@implementation WebViewController

#pragma mark - 初始化方法

- (instancetype)init {
    
    self = [super initWithNibName:nil bundle:nil];
    
    return self;
}


- (void)dealloc {
    
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}


#pragma mark - 系统方法

/**
 *  视图已经加载方法
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
}

@end
