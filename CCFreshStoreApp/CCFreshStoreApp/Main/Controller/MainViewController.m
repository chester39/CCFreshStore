//
//  MainViewController.m
//      CCFreshStoreApp
//      Chen Chen @ July 11th, 2017
//

#import "MainViewController.h"

// Tool
#import "CCTConst.h"

// Model
#import "TabBarModel.h"

// Controller
#import "WebViewController.h"

// Third Party
#import "YYModel.h"

#pragma mark - 界面常数

// 增加按钮相关常数
static const CGFloat kAddButtonTopMargin = 5;
// 网页控制器相关常数
static NSString *const kWebControllerHomeURL = @"https://chesterhupu.kuaizhan.com/";

@interface MainViewController ()

/// 增加按钮
@property (nonatomic, strong) UIButton *addButton;
/// 标签数组
@property (nonatomic, strong) NSArray *tabBarArray;

@end

@implementation MainViewController

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
    
    [self loadModel];
    [self setupChildController];
    [self setupUI];
}

#pragma mark - 数据方法

/**
 *  读取模型方法
 */
- (void)loadModel {
    
    if (!self.tabBarArray) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TabBarSetting" ofType:@"json"];
        if (!CCTNSStringCheck(filePath)) {
            return;
        }

        NSData *data = [NSData dataWithContentsOfFile:filePath];
        if (!data) {
            return;
        }
        
        self.tabBarArray = [NSArray yy_modelArrayWithClass:[TabBarModel class] json:data];
    }
}

/**
 *  初始化子控制器方法
 */
- (void)setupChildController {
    
    for (TabBarModel *model in self.tabBarArray) {
        if (!model) {
            return;
        }
        
        Class childClass = NSClassFromString(model.controllerName);
        if (![childClass isSubclassOfClass:[UIViewController class]]) {
            return;
        }
        
        UIViewController *vc = [[childClass alloc] init];
        if (!vc) {
            return;
        }
        
        vc.title = model.title;
        vc.tabBarItem.image = [UIImage imageNamed:model.imageName];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:[model.imageName stringByAppendingString:@"_highlighted"]];
        if (!CCTNSStringCheck(model.title)) {
            vc.tabBarItem.enabled = NO;
        }
        
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nc];
    }
}

#pragma mark - 界面方法

/**
 *  初始化界面方法
 */
- (void)setupUI {
    
    self.tabBar.tintColor = kMainColor;

    if (!self.addButton) {
        self.addButton = [UIButton buttonWithImage:@"tabbar_compose_icon_add" backgroundImage:@"tabbar_compose_button"];
        [self.addButton addTarget:self action:@selector(addButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        CGRect rect = self.addButton.frame;
        CGFloat tabY = self.tabBar.frame.origin.y - kBottomHeight - kAddButtonTopMargin;
        CGFloat tabWidth = self.tabBar.frame.size.width / (CGFloat)self.childViewControllers.count;
        CGRect addButtonFrame = CGRectMake(tabWidth * 2, tabY, tabWidth, rect.size.height);
        self.addButton.frame = addButtonFrame;
        [self.view addSubview:self.addButton];
    }
}

#pragma mark - 点击方法

/**
 *  增加按钮点击方法
 */
- (void)addButtonDidClick {
    
    WebViewController *webVC = [[WebViewController alloc] init];
    NSString *urlString = kWebControllerHomeURL;
    [webVC loadWithURLString:urlString];
    [self.navigationController pushViewController:webVC animated:YES];
}

@end
