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
    UINavigationController *iPadNav = deviceSB.instantiateInitialViewController;
    UINavigationController *iPodNav = deviceSB.instantiateInitialViewController;
    UINavigationController *MacNav = deviceSB.instantiateInitialViewController;
    
    self.viewControllers = @[iPhoneNav, iPadNav, iPodNav, MacNav];
    
    DeviceViewController *iPhoneVC = [iPhoneNav.viewControllers firstObject];
    DeviceViewController *iPadVC = [iPadNav.viewControllers firstObject];
    DeviceViewController *iPodVC = [iPodNav.viewControllers firstObject];
    DeviceViewController *MacVC = [MacNav.viewControllers firstObject];
    
    iPhoneVC.Devices = [self.library.iPhoneLibrary copy];
    iPadVC.Devices = [self.library.iPadLibrary copy];
    iPodVC.Devices = [self.library.iPodLibrary copy];
    MacVC.Devices = [self.library.MacLibrary copy];
    
    iPhoneVC.navigationItem.title = @"iPhone";
    iPadVC.navigationItem.title = @"iPad";
    iPodVC.navigationItem.title = @"iPod";
    MacVC.navigationItem.title = @"Mac";
    
    iPhoneNav.tabBarItem.title = @"iPhone";
    iPhoneNav.tabBarItem.image = [UIImage imageNamed:@"iPhone icon"];
    
    iPadNav.tabBarItem.title = @"iPad";
    iPadNav.tabBarItem.image = [UIImage imageNamed:@"iPad icon"];
    
    iPodNav.tabBarItem.title = @"iPod";
    iPodNav.tabBarItem.image = [UIImage imageNamed:@"iPod icon"];
    
    MacNav.tabBarItem.title = @"Mac";
    MacNav.tabBarItem.image = [UIImage imageNamed:@"MacBook icon"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
