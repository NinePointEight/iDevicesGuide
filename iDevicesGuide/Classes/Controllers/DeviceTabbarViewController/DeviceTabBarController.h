//
//  DeviceTabBarController.h
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/6.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DevicesLibrary.h"

@interface DeviceTabBarController : UITabBarController

@property (nonatomic, strong)DevicesLibrary *library;

@end
