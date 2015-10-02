//
//  iPhoneViewController.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/2.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "iPhoneViewController.h"

@interface iPhoneViewController ()

@end

@implementation iPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -init methods

- (void)initImageArray {
    self.imageArray = [[NSMutableArray alloc] initWithObjects:  [UIImage imageNamed:@"iPhone-1"],
                       [UIImage imageNamed:@"iPhone-2"],
                       [UIImage imageNamed:@"iPhone-3"], nil];
    
}

- (void)initDeviceArray {
    Device *iPhone5s = [Device deviceWithName:@"iPhone 5s" imagePath:@"iPhone-3" thumbnailPath:@"iPhone-3"];
    Device *iPhone6 = [Device deviceWithName:@"iPhone 6" imagePath:@"iPhone-2" thumbnailPath:@"iPhone-2"];
    Device *iPhone6p = [Device deviceWithName:@"iPhone 6 plus" imagePath:@"iPhone-2" thumbnailPath:@"iPhone-2"];
    Device *iPhone6s = [Device deviceWithName:@"iPhone 6s" imagePath:@"iPhone-2" thumbnailPath:@"iPhone-2"];
    Device *iPhone6sp = [Device deviceWithName:@"iPhone 6s plus" imagePath:@"iPhone-2" thumbnailPath:@"iPhone-2"];
    self.deviceArray = @[iPhone5s, iPhone6, iPhone6p, iPhone6s, iPhone6sp];
}

@end
