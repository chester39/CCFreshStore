//
//  ViewController.m
//      CCFreshStoreApp
//      Chen Chen @ March 19th, 2017
//

#import "ViewController.h"
#import "Const.h"
#import "WebViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    printf("%lf\n", kViewEdge);
    WebViewController *webVC = [[WebViewController alloc] init];
    NSString *urlString = @"https://www.baidu.com/";
    [webVC loadWithURLString:urlString];
    [self.navigationController pushViewController:webVC animated:true];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


@end
