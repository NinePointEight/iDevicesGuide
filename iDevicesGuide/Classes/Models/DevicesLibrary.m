//
//  DevicesLibrary.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/6.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "DevicesLibrary.h"

@interface DevicesLibrary ()

@end

@implementation DevicesLibrary

- (instancetype)initLibrary {
    if (self) {
        [self initiPhoneLibrary];
        [self initiPadLibrary];
        [self initiPodLibrary];
        [self initMacLibrary];
    }
    return self;
}

#pragma -mark iPhone library init method

const NSUInteger capacityTypeOfiPhone = 3;

- (void)initiPhoneLibrary {
    NSArray *capacitiesOf_iPhone_5s = @[@16, @32, @64];
    NSArray *capacitiesOf_iPhone_6 = @[@16, @64, @128];
    NSArray *capacitiesOf_iPhone_6s = @[@16, @64, @128];
    
    NSMutableArray *iPhone_5s_Array = [[NSMutableArray alloc] init];
    NSMutableArray *iPhone_6_Array = [[NSMutableArray alloc] init];
    NSMutableArray *iPhone_6p_Array = [[NSMutableArray alloc] init];
    NSMutableArray *iPhone_6s_Array = [[NSMutableArray alloc] init];
    NSMutableArray *iPhone_6sp_Array = [[NSMutableArray alloc] init];
    
    for (NSUInteger index = 0; index < capacityTypeOfiPhone; ++index) {
        Device *iPhone_5s = [[Device alloc] initWithName:@"iPhone 5s"
                                        imagePath:@"iPhone_5s"
                                    thumbnailPath:@"iPhone_5s_button"
                                         capacity:[capacitiesOf_iPhone_5s objectAtIndex:index]];
        
        [iPhone_5s_Array addObject:iPhone_5s];
        }
    
    for (NSUInteger index = 0; index < capacityTypeOfiPhone; ++index) {
        Device *iPhone_6 = [[Device alloc] initWithName:@"iPhone 6"
                                       imagePath:@"iPhone_6"
                                   thumbnailPath:@"iPhone_6_button"
                                        capacity:[capacitiesOf_iPhone_6 objectAtIndex:index]];
        [iPhone_6_Array addObject:iPhone_6];
    }
    
    for (NSUInteger index = 0; index < capacityTypeOfiPhone; ++index) {
        Device *iPhone_6_plus = [[Device alloc] initWithName:@"iPhone 6 plus"
                                       imagePath:@"iPhone_6_plus"
                                   thumbnailPath:@"iPhone_6_plus_button"
                                        capacity:[capacitiesOf_iPhone_6 objectAtIndex:index]];
        [iPhone_6p_Array addObject:iPhone_6_plus];
    }
    
    
    for (NSUInteger index = 0; index < capacityTypeOfiPhone; ++index) {
        Device *iPhone_6s = [[Device alloc] initWithName:@"iPhone 6s"
                                               imagePath:@"iPhone_6s"
                                           thumbnailPath:@"iPhone_6s_button"
                                         capacity:[capacitiesOf_iPhone_6s objectAtIndex:index]];
        [iPhone_6s_Array addObject:iPhone_6s];
    }
    
    for (NSUInteger index = 0; index < capacityTypeOfiPhone; ++index) {
        Device *iPhone_6s_plus = [[Device alloc] initWithName:@"iPhone 6s plus"
                                                    imagePath:@"iPhone_6s_plus"
                                                thumbnailPath:@"iPhone_6s_plus_button"
                                         capacity:[capacitiesOf_iPhone_6s objectAtIndex:index]];
        [iPhone_6sp_Array addObject:iPhone_6s_plus];
    }
    self.iPhoneLibrary = @[iPhone_5s_Array,
                           iPhone_6_Array,
                           iPhone_6p_Array,
                           iPhone_6s_Array,
                           iPhone_6sp_Array];
}

#pragma -mark iPad library init method

- (void)initiPadLibrary {
    NSArray *capacitiesOf_iPad_Pro = @[@32, @128];
    NSArray *capacitiesOf_iPad_Air2 = @[@16, @64, @128];
    NSArray *capacitiesOf_iPad_mini2 = @[@16, @32,@64, @128];
    NSArray *capacitiesOf_iPad_mini4 = @[@16, @64, @128];
    
    NSMutableArray *iPad_Pro_Array = [[NSMutableArray alloc] init];
    NSMutableArray *iPad_Air2_Array = [[NSMutableArray alloc] init];
    NSMutableArray *iPad_mini2_Array = [[NSMutableArray alloc] init];
    NSMutableArray *iPad_mini4_Array = [[NSMutableArray alloc] init];
    
    for (NSUInteger index = 0; index < [capacitiesOf_iPad_Pro count]; ++index) {
        Device *iPad_Pro = [[Device alloc] initWithName:@"iPad Pro"
                                        imagePath:@"iPad-3"
                                    thumbnailPath:@"iPad-3"
                                         capacity:[capacitiesOf_iPad_Pro objectAtIndex:index]];
        [iPad_Pro_Array addObject:iPad_Pro];
    }
    
    for (NSUInteger index = 0; index < [capacitiesOf_iPad_Air2 count]; ++index) {
        Device *iPad_Air2 = [[Device alloc] initWithName:@"iPhone Air 2"
                                       imagePath:@"iPad-1"
                                   thumbnailPath:@"iPad-Button"
                                        capacity:[capacitiesOf_iPad_Air2 objectAtIndex:index]];
        [iPad_Air2_Array addObject:iPad_Air2];
    }
    
    for (NSUInteger index = 0; index < [capacitiesOf_iPad_mini2 count]; ++index) {
        Device *iPad_mini2 = [[Device alloc] initWithName:@"iPad mini 2"
                                        imagePath:@"iPad-3"
                                    thumbnailPath:@"iPad-Button"
                                         capacity:[capacitiesOf_iPad_mini2 objectAtIndex:index]];
        [iPad_mini2_Array addObject:iPad_mini2];
    }
    
    
    for (NSUInteger index = 0; index < [capacitiesOf_iPad_mini4 count]; ++index) {
        Device *iPad_mini4 = [[Device alloc] initWithName:@"iPad mini 4"
                                       imagePath:@"iPad-2"
                                   thumbnailPath:@"iPad-Button"
                                         capacity:[capacitiesOf_iPad_mini4 objectAtIndex:index]];
        [iPad_mini4_Array addObject:iPad_mini4];
    }

    self.iPadLibrary = @[iPad_Pro_Array,
                           iPad_Air2_Array,
                           iPad_mini2_Array,
                           iPad_mini4_Array];
}

# pragma -mark init iPod library method

- (void)initiPodLibrary {
    NSArray *capacitiesOf_iPod_Touch = @[@16, @32, @64];
    NSArray *capacitiesOf_iPod_Nano = @[@8, @16];
    
    NSMutableArray *iPod_Touch_Array = [[NSMutableArray alloc] init];
    NSMutableArray *iPod_Nano_Array = [[NSMutableArray alloc] init];

    
    for (NSUInteger index = 0; index < [capacitiesOf_iPod_Touch count]; ++index) {
        Device *iPad_Touch = [[Device alloc] initWithName:@"iPod Touch"
                                         imagePath:@"iPod-Touch-Button"
                                     thumbnailPath:@"iPod-Touch-Button"
                                        capacity:[capacitiesOf_iPod_Touch objectAtIndex:index]];
        [iPod_Touch_Array addObject:iPad_Touch];
    }
    
    for (NSUInteger index = 0; index < [capacitiesOf_iPod_Nano count]; ++index) {
        Device *iPad_Nano = [[Device alloc] initWithName:@"iPod Nano"
                                        imagePath:@"iPod-Nano-Button"
                                    thumbnailPath:@"iPod-Nano-Button"
                                         capacity:[capacitiesOf_iPod_Nano objectAtIndex:index]];
        [iPod_Nano_Array addObject:iPad_Nano];
    }
    
    self.iPodLibrary = @[iPod_Touch_Array,
                           iPod_Nano_Array];
}

#pragma -mark init Mac library method

- (void)initMacLibrary {
    NSArray *capacitiesOf_MacBook = @[@128, @256, @512];
    NSArray *capacitiesOf_MacBook_Air = @[@128, @256, @512];
    NSArray *capacitiesOf_MacBook_Pro = @[@128, @256, @512];
    
    NSMutableArray *MacBook_Array = [[NSMutableArray alloc] init];
    NSMutableArray *MacBook_Air_Array = [[NSMutableArray alloc] init];
    NSMutableArray *MacBook_Pro_Array = [[NSMutableArray alloc] init];
    
    for (NSUInteger index = 0; index < [capacitiesOf_MacBook count]; ++index) {
        Device *MacBook = [[Device alloc] initWithName:@"Mac Book"
                                       imagePath:@"MacBook-1"
                                   thumbnailPath:@"MacBook-Button"
                                        capacity:[capacitiesOf_MacBook objectAtIndex:index]];
        [MacBook_Array addObject:MacBook];
    }
    
    for (NSUInteger index = 0; index < [capacitiesOf_MacBook_Air count]; ++index) {
        Device *MacBook_Air = [[Device alloc] initWithName:@"Mac Book Air"
                                           imagePath:@"MacBook-2"
                                       thumbnailPath:@"MacBook Air-Button"
                                        capacity:[capacitiesOf_MacBook_Air objectAtIndex:index]];
        [MacBook_Air_Array addObject:MacBook_Air];
    }
    
    for (NSUInteger index = 0; index < [capacitiesOf_MacBook_Pro count]; ++index) {
        Device *MacBook_Pro = [[Device alloc] initWithName:@"Mac Book Pro"
                                           imagePath:@"MacBook-3"
                                       thumbnailPath:@"MacBook Pro-Button"
                                            capacity:[capacitiesOf_MacBook_Pro objectAtIndex:index]];
        [MacBook_Pro_Array addObject:MacBook_Pro];
    }
    
    self.MacLibrary = @[MacBook_Array,
                           MacBook_Air_Array,
                           MacBook_Pro_Array];
}

@end
