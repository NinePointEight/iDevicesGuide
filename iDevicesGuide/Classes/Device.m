//
//  Device.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/1.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "Device.h"

@implementation Device

+ (instancetype)deviceWithName:(NSString *)aName imagePath:(NSString *)aImagePath thumbnailPath:(NSString *)aThumbnailPath {
    Device *device = [[Device alloc] init];
    device.name = aName;
    device.imagePath = aImagePath;
    device.thumbnailPath = aThumbnailPath;
    return device;
}

@end
