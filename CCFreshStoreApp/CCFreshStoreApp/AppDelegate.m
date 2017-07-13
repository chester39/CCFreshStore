//
//  AppDelegate.m
//      CCFreshStoreApp
//      Chen Chen @ March 19th, 2017
//

#import "AppDelegate.h"

// Tool
#import "Const.h"

// Controller
#import "TestViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/**
 *  应用启动方法
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:kScreenFrame];
    self.window.backgroundColor = kCommonLightColor;
    
    TestViewController *defaultVC = [[TestViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:defaultVC];
    
    self.window.rootViewController = nc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

/**
 *  应用将要失去焦点方法
 */
- (void)applicationWillResignActive:(UIApplication *)application {
    
    NSLog(@"%s", __func__);
}

/**
 *  应用已经进入后台方法
 */
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    NSLog(@"%s", __func__);
}

/**
 *  应用将要进入前台方法
 */
- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    NSLog(@"%s", __func__);
}

/**
 *  应用已经成为焦点方法
 */
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    NSLog(@"%s", __func__);
}

/**
 *  应用将要终止方法
 */
- (void)applicationWillTerminate:(UIApplication *)application {
    
    NSLog(@"%s", __func__);
}

@end
