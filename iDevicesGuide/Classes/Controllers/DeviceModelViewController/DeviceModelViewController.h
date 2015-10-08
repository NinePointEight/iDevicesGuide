//
//  DeviceModelViewController.h
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/2.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Device.h"
#import "DeviceModelCell.h"

@interface DeviceModelViewController : UIViewController

@property (nonatomic, copy) NSArray *devicesArray;

- (void)initWithDevicesArray:(NSArray *)array;

@end
