//
//  CurrencyExchange.h
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/17.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrencyExchange : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *rate;

@end
