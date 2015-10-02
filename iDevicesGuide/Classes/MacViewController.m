//
//  MacViewController.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/2.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "MacViewController.h"

@interface MacViewController ()

@end

@implementation MacViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init methods

- (void)initImageArray {
    self.imageArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"MacBook-1"],
                       [UIImage imageNamed:@"MacBook-2"],[UIImage imageNamed:@"MacBook-3"], nil];
}

- (void)initDeviceArray {
    Device *MacBook = [Device deviceWithName:@"Mac Book" imagePath:@"MacBook-1" thumbnailPath:@"MacBook-Button"];
    Device *MacBookAir = [Device deviceWithName:@"Mac Book Air" imagePath:@"MacBook-2" thumbnailPath:@"MacBook Air-Button"];
    Device *MacBookPro = [Device deviceWithName:@"Mac Book Pro" imagePath:@"MacBook-3" thumbnailPath:@"MacBook Pro-Button"];
    self.deviceArray = @[MacBook, MacBookAir, MacBookPro];
}

@end
