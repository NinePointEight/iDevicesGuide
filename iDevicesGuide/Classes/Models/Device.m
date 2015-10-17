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

@end

@implementation Device

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

#pragma -mark 获取时间信息

- (NSNumber *)releaseCycle {
    if ([self.name hasPrefix:@"Mac"]) {
        if ([self.name hasSuffix:@"Pro"]) return [self MacBookProReleaseCycle];
        else if ([self.name hasSuffix:@"Air"]) return [self MacBookAirReleaseCycle];
        else return [self MacBookReleaseCycle];
    } else return @365;
}

- (NSNumber *)sinceLastRelease {
    NSDate *releaseDate = [self releaseDate];
    NSTimeInterval secondsPerday = -24 * 60 * 60;
    NSTimeInterval releaseInterval = [releaseDate timeIntervalSinceNow] / secondsPerday;
    NSNumber *sinceLastRelease = [NSNumber numberWithInteger:releaseInterval];
    return sinceLastRelease;
}
- (NSNumber *)timeToNextRelease {
    NSNumber *releaseCycle = [self releaseCycle];
    NSNumber *sinceLastRelease = [self sinceLastRelease];
    NSNumber *restTime = [NSNumber numberWithInteger:releaseCycle.integerValue - sinceLastRelease.integerValue];
    return restTime;
}

#pragma -mark 各类设备生成自己的时间信息

- (NSNumber *)MacBookReleaseCycle {
    return @365;
}
- (NSNumber *)MacBookAirReleaseCycle {
    return @350;
}
- (NSNumber *)MacBookProReleaseCycle {
    return @214;
}

- (NSDate *)dateWithString:(NSString *)string {
    NSDateFormatter *dateFormat = [[NSDateFormatter  alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [dateFormat dateFromString:string];
    return date;
}

- (NSDate *)releaseDate {
    if ([self.name hasPrefix:@"Mac"]) {
        if ([self.name hasSuffix:@"Pro"]) return [self releaseDateOf_MacBookPro];
        else if ([self.name hasSuffix:@"Air"]) return [self releaseDateOf_MacBookAir];
        else return [self releaseDateOf_MacBook];
    } else return [self dateWithString:@"2015-01-01"];
}

- (NSDate *)releaseDateOf_MacBook {
    return [self dateWithString:@"2015-04-10"];
}
- (NSDate *)releaseDateOf_MacBookAir {
    return [self dateWithString:@"2015-03-09"];
}
- (NSDate *)releaseDateOf_MacBookPro {
    return [self dateWithString:@"2015-05-19"];
}

#pragma -mark 初始化MacBook的价格字典
- (NSDictionary *)priceDictonary {
    if ([self.name isEqualToString:@"Mac Book"]) return [self priceOf_MacBook];
    if ([self.name isEqualToString:@"Mac Book Pro"]) return [self priceOf_MacBookPro];
    if ([self.name isEqualToString:@"Mac Book Air"]) return [self priceOf_MacBookAir];
    return nil;
}

- (NSDictionary *)priceOf_MacBook {
    NSArray *keys = @[@"cnPrice", @"eduPrice", @"usPrice", @"jpPrice", @"hkPrice"];
    NSArray *mb_valuesOf_256gb = @[@9288, @8928, @1299, @148800, @9988];
    NSArray *mb_valuesOf_512gb = @[@11288, @10938, @1599, @184800, @11988];
    
    NSDictionary *macbookPrice;
    switch (self.capacity.integerValue) {
        case 256: {
            macbookPrice = [NSDictionary dictionaryWithObjects:mb_valuesOf_256gb forKeys:keys];
            break;
        }
        case 512: {
            macbookPrice = [NSDictionary dictionaryWithObjects:mb_valuesOf_512gb forKeys:keys];
            break;
        }
        default:
            macbookPrice = nil;
    }
    return macbookPrice;
}
- (NSDictionary *)priceOf_MacBookAir {
    NSArray *keys = @[@"cnPrice", @"eduPrice", @"usPrice", @"jpPrice", @"hkPrice"];
    NSArray *mba_valuesOf_128gb = @[@6988, @6628, @999, @112800, @7488];
    NSArray *mba_valuesOf_256gb = @[@8488, @8128, @1199, @136800, @8988];
    
    NSDictionary *macbookAirPrice;
    switch (self.capacity.integerValue) {
        case 128: {
            macbookAirPrice = [NSDictionary dictionaryWithObjects:mba_valuesOf_128gb forKeys:keys];
            break;
        }
        case 256: {
            macbookAirPrice = [NSDictionary dictionaryWithObjects:mba_valuesOf_256gb forKeys:keys];
            break;
        }
        default:
            macbookAirPrice = nil;
    }
    return macbookAirPrice;
}
- (NSDictionary *)priceOf_MacBookPro {
    NSArray *keys = @[@"cnPrice", @"eduPrice", @"usPrice", @"jpPrice", @"hkPrice"];
    NSArray *mbp_valuesOf_128gb = @[@9288, @8588, @1299, @148800, @9988];
    NSArray *mbp_valuesOf_256gb = @[@10788, @10088, @1499, @172800, @11488];
    NSArray *mbp_valuesOf_512gb = @[@12898, @12188, @1799, @208800, @13888];
    
    NSDictionary *macbookProPrice;
    switch (self.capacity.integerValue) {
        case 128: {
            macbookProPrice = [NSDictionary dictionaryWithObjects:mbp_valuesOf_128gb forKeys:keys];
            break;
        }
        case 256: {
            macbookProPrice = [NSDictionary dictionaryWithObjects:mbp_valuesOf_256gb forKeys:keys];
            break;
        }
        case 512: {
            macbookProPrice = [NSDictionary dictionaryWithObjects:mbp_valuesOf_512gb forKeys:keys];
            break;
        }
        default:
            macbookProPrice = nil;
    }
    return macbookProPrice;
}

@end

/*  暂时用不到的方法  */

//- (NSNumber *)iPhoneReleaseCycle {
//    return @379;
//}
//
//- (NSNumber *)iPadAirReleaseCycle {
//    return @331;
//}
//- (NSNumber *)iPadminiReleaseCycle {
//    return @350;
//}
//- (NSNumber *)iPadProReleaseCycle {
//    return @365;
//}
//
//- (NSNumber *)iPodTouchReleaseCycle {
//    return @296;
//}
//- (NSNumber *)iPodNanoReleaseCycle {
//    return @417;
//}
