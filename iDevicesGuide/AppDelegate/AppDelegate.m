//
//  AppDelegate.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/9/29.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "AppDelegate.h"
#import "DeviceViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self loadLaunchView];
    [self loadMainView];
    return YES;
}

- (void)loadLaunchView {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Launch" bundle:[NSBundle mainBundle]];
    _launchVC = storyboard.instantiateInitialViewController;
}

- (void)loadMainView {
    UIStoryboard *tbSB = [UIStoryboard storyboardWithName:@"mainView" bundle:[NSBundle mainBundle]];
    UIStoryboard *deviceSB = [UIStoryboard storyboardWithName:@"deviceView" bundle:[NSBundle mainBundle]];
    
    _mainTabVC = tbSB.instantiateInitialViewController;
    UINavigationController *iPhoneNav = deviceSB.instantiateInitialViewController;
    UINavigationController *iPadNav = deviceSB.instantiateInitialViewController;
    UINavigationController *iPodNav = deviceSB.instantiateInitialViewController;
    UINavigationController *MacNav = deviceSB.instantiateInitialViewController;
    
    DeviceViewController *iPhoneVC = [iPhoneNav.viewControllers firstObject];
    DeviceViewController *iPadVC = [iPadNav.viewControllers firstObject];
    DeviceViewController *iPodVC = [iPodNav.viewControllers firstObject];
    DeviceViewController *MacVC = [MacNav.viewControllers firstObject];
    
    [iPhoneVC prepareForShowWithDeviceType:@"iPhone"];
    [iPadVC prepareForShowWithDeviceType:@"iPad"];
    [iPodVC prepareForShowWithDeviceType:@"iPod"];
    [MacVC prepareForShowWithDeviceType:@"Mac"];
    
    iPhoneVC.navigationItem.title = @"iPhone";
    iPadVC.navigationItem.title = @"iPad";
    iPodVC.navigationItem.title = @"iPod";
    MacVC.navigationItem.title = @"Mac";
    
    iPhoneNav.tabBarItem.title = @"iPhone";
    iPhoneNav.tabBarItem.image = [UIImage imageNamed:@"iPhone"];
    
    iPadNav.tabBarItem.title = @"iPad";
    iPadNav.tabBarItem.image = [UIImage imageNamed:@"iPad"];
    
    iPodNav.tabBarItem.title = @"iPod";
    iPodNav.tabBarItem.image = [UIImage imageNamed:@"iPod-Nano"];
    
    MacNav.tabBarItem.title = @"Mac";
    MacNav.tabBarItem.image = [UIImage imageNamed:@"MacBook"];
    
    _mainTabVC.viewControllers = @[iPhoneNav, iPadNav, iPodNav, MacNav];
    self.window.rootViewController = _mainTabVC;
    [self.window addSubview:_launchVC.view];
    [UIView animateWithDuration:5
                     animations:^{
                         self.launchVC.view.alpha = 0;
                         self.launchVC.view.transform = CGAffineTransformMakeScale(0.01, 0.01);
                     }
                     completion:^(BOOL finished){
                         self.launchVC = nil;
                     }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
 
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
