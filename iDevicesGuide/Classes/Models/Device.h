//
//  Device.h
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/1.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Device : NSObject

@property (nonatomic, copy, readonly) NSString      *name;
@property (nonatomic, copy, readonly) NSString      *imagePath;
@property (nonatomic, copy, readonly) NSString      *thumbnailPath;

@property (nonatomic, assign, readonly) NSNumber    *capacity;
@property (nonatomic, assign, readonly) NSNumber    *releaseCycle;

@property (nonatomic, copy, readonly) NSDictionary  *price;

@property (nonatomic, weak, readonly) NSDate        *releaseDate;

- (instancetype)initWithName:(NSString *)name
                   imagePath:(NSString *)imagePath
               thumbnailPath:(NSString *)thumbnailPath
                    capacity:(NSNumber *)capacity
                releaseCycle:(NSNumber *)releaseCycle
                 releaseDate:(NSDate *)releaseDate
                       price:(NSDictionary *)price;

- (instancetype)initWithName:(NSString *)name
                     imagePath:(NSString *)imagePath
                 thumbnailPath:(NSString *)thumbnailPath
                      capacity:(NSNumber *)capacity;

@end
