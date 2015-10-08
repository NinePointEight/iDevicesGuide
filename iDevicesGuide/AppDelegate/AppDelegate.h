//
//  AppDelegate.h
//  iDevicesGuide
//
//  Created by 成鑫 on 15/9/29.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeviceTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *launchVC;
@property (strong, nonatomic) DeviceTabBarController *mainTabVC;

- (void)loadLaunchView;
- (void)loadMainView;

@end

