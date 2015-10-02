//
//  iPadViewController.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/2.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "iPadViewController.h"

@interface iPadViewController ()

@end

@implementation iPadViewController

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
    self.imageArray = [[NSArray alloc] initWithObjects:
                       [UIImage imageNamed:@"iPad-1"],
                       [UIImage imageNamed:@"iPad-2"],
                       [UIImage imageNamed:@"iPad-3"],nil];
}

- (void)initDeviceArray {
    Device *iPadmini2 = [Device deviceWithName:@"iPad mini 2" imagePath:@"iPad-3" thumbnailPath:@"iPad-Button"];
    Device *iPadmini4 = [Device deviceWithName:@"iPad mini 4" imagePath:@"iPad-2" thumbnailPath:@"iPad-Button"];
    Device *iPadAir = [Device deviceWithName:@"iPad Air" imagePath:@"iPad-1" thumbnailPath:@"iPad-Button"];
    Device *iPadAir2 = [Device deviceWithName:@"iPad Air 2" imagePath:@"iPad-1" thumbnailPath:@"iPad-Button"];
    self.deviceArray = @[iPadmini2, iPadmini4, iPadAir, iPadAir2];
}

@end
