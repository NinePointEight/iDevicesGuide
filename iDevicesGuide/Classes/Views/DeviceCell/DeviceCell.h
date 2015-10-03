//
//  DeviceCell.h
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/1.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *deviceThumbnail;
@property (weak, nonatomic) IBOutlet UILabel *deviceName;

- (void)setDeviceThumbnailPath:(NSString * _Nonnull)aDeviceThumbnailPath andDeviceName:(NSString * _Nonnull)aDeviceName;

@end
