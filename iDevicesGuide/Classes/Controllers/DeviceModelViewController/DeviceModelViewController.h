//
//  DeviceModelViewController.h
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/2.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceModelViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *releaseCycleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sinceLastReleaseLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeToNextReleaseLabel;

// 图例中用来标识颜色的圆点
@property (weak, nonatomic) IBOutlet UIImageView *markingImage1;
@property (weak, nonatomic) IBOutlet UIImageView *markingImage2;
@property (weak, nonatomic) IBOutlet UIImageView *markingImage3;

// 从library中取得的设备信息
@property (nonatomic, copy) NSArray *devicesArray;

- (void)initWithDevicesArray:(NSArray *)array;

@end
