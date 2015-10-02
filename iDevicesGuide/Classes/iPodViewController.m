//
//  iPodViewController.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/2.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "iPodViewController.h"

@interface iPodViewController ()

@end

@implementation iPodViewController

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
    self.imageArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"iPod-1"],
                       [UIImage imageNamed:@"iPod-1"], [UIImage imageNamed:@"iPod-1"], nil];
}

- (void)initDeviceArray {
    Device *iPodTouch = [Device deviceWithName:@"iPod Touch" imagePath:@"iPod-Touch-Button" thumbnailPath:@"iPod-Touch-Button"];
    Device *iPodNano = [Device deviceWithName:@"iPod Nano" imagePath:@"iPod-Nano-Button" thumbnailPath:@"iPod-Nano-Button"];
    Device *iPodShuffle = [Device deviceWithName:@"iPod Shuffle" imagePath:@"iPod-3" thumbnailPath:@"iPod-3"];
    self.deviceArray = @[iPodTouch, iPodNano, iPodShuffle];
}

@end
