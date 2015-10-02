//
//  Device.h
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/1.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Device : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *thumbnailPath;
@property (nonatomic, assign) NSNumber *capacity;

+ (instancetype)deviceWithName:(NSString *)aName
                     imagePath:(NSString *)aImagePath
                 thumbnailPath:(NSString *)aThumbnailPath;

@end
