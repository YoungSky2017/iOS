//
//  AppDelegate.m
//  SampleApp
//
//  Created by 杨奇 on 2019/5/17.
//  Copyright © 2019 杨奇. All rights reserved.
//

#import "AppDelegate.h"
#import "GTNewsViewController.h"
#import "GTVideoViewController.h"
#import "GTRecommendViewController.h"
#import "GTMineViewController.h"
#import "GTSplashView.h"
#include <execinfo.h>
#import "GTLocation.h"
#import "GTNotification.h"

#import "GTStatic.h"
#import <GTFramework/GTFramework.h>


@interface AppDelegate() <UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    
    
    GTNewsViewController *newsViewController = [[GTNewsViewController alloc] init];
    GTVideoViewController *videoController = [[GTVideoViewController alloc] init];
    GTRecommendViewController *recommendController = [[GTRecommendViewController alloc] init];
    GTMineViewController *mineViewController = [[GTMineViewController alloc] init];
    
    [tabbarController setViewControllers:@[newsViewController,videoController,recommendController,mineViewController]];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    
    tabbarController.delegate = self;
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    /**  将闪屏视图添加到启动图之后，添加到当前window上，达到延长视图的目的 */
    [self.window addSubview:({
        GTSplashView *splashView = [[GTSplashView alloc] initWithFrame:self.window.bounds];
        splashView;
    })];
    
    //static库的集成
    //[[GTStaicTest alloc] init];
    
    //framework的集成
    //[[GTFrameworkTest alloc] init];
    
    //测试crash收集
    //[self _caughtException];
    //[@[].mutableCopy addObject:nil];
    
    //定位和push
//    [[GTLocation locationManager] checkLocationAuthorization];
//    [[GTNotification notificationManager] checkNotificationAuthorization];
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"selected page");
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return YES;
}

#pragma mark - CRASH

- (void)_caughtException{
    //NSexception
    NSSetUncaughtExceptionHandler(HandleNSException);
    
    //signal
    signal(SIGABRT, SignalExceptionHandler);
    signal(SIGILL, SignalExceptionHandler);
    signal(SIGSEGV, SignalExceptionHandler);
    signal(SIGFPE, SignalExceptionHandler);
    signal(SIGBUS, SignalExceptionHandler);
    signal(SIGPIPE, SignalExceptionHandler);
}

void SignalExceptionHandler(int signal){
    void* callstack[128];
    int frames = backtrace(callstack, 128);
    char **strs = backtrace_symbols(callstack, frames);
    NSMutableArray *backtrace = [NSMutableArray arrayWithCapacity:frames];
    for (int i = 0; i < frames; i++) {
        [backtrace addObject:[NSString stringWithUTF8String:strs[i]]];
    }
    free(strs);
    //存储crash信息。
}

void HandleNSException(NSException *exception){
    __unused NSString *reason = [exception reason];
    __unused NSString *name = [exception name];
    //存储crash信息。
}

@end
