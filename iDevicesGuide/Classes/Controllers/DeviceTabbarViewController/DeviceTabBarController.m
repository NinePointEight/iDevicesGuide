//
//  DeviceTabBarController.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/6.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "DeviceTabBarController.h"
#import "DeviceViewController.h"

@interface DeviceTabBarController ()

@end

@implementation DeviceTabBarController
- (void)viewDidLoad {
    NSLog(@"Tab viewDidLoad被执行");
    [super viewDidLoad];
    self.library = [[DevicesLibrary alloc] initLibrary];
    UIStoryboard *deviceSB = [UIStoryboard storyboardWithName:@"deviceView"
                                                       bundle:[NSBundle mainBundle]];
    
    UINavigationController *iPhoneNav = deviceSB.instantiateInitialViewController;
    iPhoneNav.tabBarItem.title = @"iPhone";
    iPhoneNav.tabBarItem.image = [UIImage imageNamed:@"iPhone icon"];
    DeviceViewController *iPhoneVC = [iPhoneNav.viewControllers firstObject];
    iPhoneVC.navigationItem.title = @"iPhone";
    iPhoneVC.Devices = [self.library.iPhoneLibrary copy];
    
    
    UINavigationController *iPadNav = deviceSB.instantiateInitialViewController;
    iPadNav.tabBarItem.title = @"iPad";
    iPadNav.tabBarItem.image = [UIImage imageNamed:@"iPad icon"];
    DeviceViewController *iPadVC = [iPadNav.viewControllers firstObject];
    iPadVC.navigationItem.title = @"iPad";
    iPadVC.Devices = [self.library.iPadLibrary copy];
    
    
    UINavigationController *iPodNav = deviceSB.instantiateInitialViewController;
    iPodNav.tabBarItem.title = @"iPod";
    iPodNav.tabBarItem.image = [UIImage imageNamed:@"iPod icon"];
    DeviceViewController *iPodVC = [iPodNav.viewControllers firstObject];
    iPodVC.navigationItem.title = @"iPod";
    iPodVC.Devices = [self.library.iPodLibrary copy];
    
    UINavigationController *MacNav = deviceSB.instantiateInitialViewController;
    MacNav.tabBarItem.title = @"Mac";
    MacNav.tabBarItem.image = [UIImage imageNamed:@"MacBook icon"];
    DeviceViewController *MacVC = [MacNav.viewControllers firstObject];
    MacVC.Devices = [self.library.MacLibrary copy];
    MacVC.navigationItem.title = @"Mac";
    
    self.viewControllers = @[iPhoneNav, iPadNav, iPodNav, MacNav];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
