//
//  DevicesLibrary.h
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/6.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Device.h"

@interface DevicesLibrary : NSObject

@property (nonatomic, copy)NSArray *iPhoneLibrary;
@property (nonatomic, copy)NSArray *iPadLibrary;
@property (nonatomic, copy)NSArray *iPodLibrary;
@property (nonatomic, copy)NSArray *MacLibrary;

- (instancetype)initLibrary;

@end
