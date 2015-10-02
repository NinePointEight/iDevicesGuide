//
//  deviceViewController.h
//  iDevicesGuide
//
//  Created by 成鑫 on 15/9/29.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DeviceModelViewController.h"
#import "DeviceHeaderView.h"
#import "deviceCell.h"
#import "Device.h"

@interface DeviceViewController : UIViewController

@property (strong, nonatomic) NSArray *imageArray;
@property (strong, nonatomic) NSArray *deviceArray;

- (void)prepareForShowWithDeviceType:(NSString *) aDeviceType;

@end
