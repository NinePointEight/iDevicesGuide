//
//  AppDelegate.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/9/29.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "AppDelegate.h"

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
    
    _mainTabVC = tbSB.instantiateInitialViewController;
    self.window.rootViewController = _mainTabVC;
    
    [self.window addSubview:_launchVC.view];
    [UIView animateWithDuration:2
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
