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

- (instancetype)initWithName:(NSString *)name
                     imagePath:(NSString *)imagePath
                 thumbnailPath:(NSString *)thumbnailPath
                      capacity:(NSNumber *)capacity;

- (NSNumber *)releaseCycle;
- (NSDate *)releaseDate;
- (NSNumber *)sinceLastRelease;
- (NSNumber *)timeToNextRelease;

- (NSDictionary *)priceOf_MacBook;
- (NSDictionary *)priceOf_MacBookPro;
- (NSDictionary *)priceOf_MacBookAir;

@end

/*  暂时用不到的方法   */

//- (NSNumber *)iPhoneReleaseCycle;
//
//- (NSNumber *)iPadAirReleaseCycle;
//- (NSNumber *)iPadminiReleaseCycle;
//- (NSNumber *)iPadProReleaseCycle;
//
//- (NSNumber *)iPodTouchReleaseCycle;
//- (NSNumber *)iPodNanoReleaseCycle;

//- (NSDictionary *)priceOf_iPhone_5s;
//- (NSDictionary *)priceOf_iPhone_6;
//- (NSDictionary *)priceOf_iPhone_6plus;
//- (NSDictionary *)priceOf_iPhone_6s;
//- (NSDictionary *)priceOf_iPhone_6splus;
//
//- (NSDictionary *)priceOf_iPad_mini2;
//- (NSDictionary *)priceOf_iPad_mini4;
//- (NSDictionary *)priceOf_iPad_Air2;
//- (NSDictionary *)priceOf_iPad_Pro;
//
//- (NSDictionary *)priceOf_iPod_Touch;
//- (NSDictionary *)priceOf_iPod_Nano;
