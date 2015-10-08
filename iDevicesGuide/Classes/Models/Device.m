//
//  Device.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/1.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "Device.h"

@interface Device ()

@property (nonatomic, copy, readwrite) NSString         *name;
@property (nonatomic, copy, readwrite) NSString         *imagePath;
@property (nonatomic, copy, readwrite) NSString         *thumbnailPath;

@property (nonatomic, assign, readwrite) NSNumber       *capacity;
@property (nonatomic, assign, readwrite) NSNumber       *releaseCycle;

@property (nonatomic, copy, readwrite) NSDictionary     *price;

@property (nonatomic, weak, readwrite) NSDate           *releaseDate;

@end

@implementation Device

- (instancetype)initWithName:(NSString *)name
                   imagePath:(NSString *)imagePath
               thumbnailPath:(NSString *)thumbnailPath
                    capacity:(NSNumber *)capacity
                releaseCycle:(NSNumber *)releaseCycle
                 releaseDate:(NSDate *)releaseDate
                       price:(NSDictionary *)price
{
    self = [super init];
    if (self) {
        self.name = name;
        self.imagePath = imagePath;
        self.thumbnailPath = thumbnailPath;
        self.capacity = capacity;
        self.releaseCycle = releaseCycle;
        self.price = price;
        self.releaseDate = releaseDate;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
                     imagePath:(NSString *)imagePath
                 thumbnailPath:(NSString *)thumbnailPath
                      capacity:(NSNumber *)capacity
{
    self = [super init];
    if (self) {
        self.name = name;
        self.imagePath = imagePath;
        self.thumbnailPath = thumbnailPath;
        self.capacity = capacity;
    }
    return self;
}



@end
