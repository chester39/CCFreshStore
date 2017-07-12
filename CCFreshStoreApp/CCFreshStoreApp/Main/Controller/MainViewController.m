//
//  MainViewController.m
//      CCFreshStoreApp
//      Chen Chen @ July 11th, 2017
//

#import "MainViewController.h"

// Tool
#import "Const.h"

// Model
#import "TabBarModel.h"

// Third Party
#import "YYModel.h"

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
    
    self.addButton = nil;
    self.tabBarArray = nil;
}

#pragma mark - 系统方法

/**
 *  视图已经加载方法
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupModel];
    [self setupChildController];
    [self setupUI];
}

#pragma mark - 数据方法

/**
 *  初始化模型方法
 */
- (void)setupModel {
    
    if (!self.tabBarArray) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TabBarSetting" ofType:@"json"];
        if (!filePath.checkString) {
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
        if (!model.title.checkString) {
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
        [self.tabBar addSubview:self.addButton];
        
        CGRect rect = self.addButton.frame;
        CGFloat tabWidth = self.tabBar.bounds.size.width / (CGFloat)self.childViewControllers.count;
        CGRect addButtonFrame = CGRectMake(tabWidth * 2, 0, tabWidth, rect.size.height);
        self.addButton.frame = addButtonFrame;
    }
}

#pragma mark - 点击方法

/**
 *  增加按钮点击方法
 */
- (void)addButtonDidClick {
    
}

@end
