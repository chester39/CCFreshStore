//
//  MineViewController.h
//      CCFreshStoreApp
//      Chen Chen @ January 28th, 2018
//

#import "MineViewController.h"

// Tool
#import "CCTConst.h"

@interface MineViewController ()

@end

@implementation MineViewController

#pragma mark - 初始化方法

/**
 *  释放内存方法
 */
- (void)dealloc {
    
}

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
    
    self.view.backgroundColor = [UIColor redColor];
}

@end
