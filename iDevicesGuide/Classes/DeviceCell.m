//
//  deviceCell.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/1.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "DeviceCell.h"

@implementation DeviceCell

- (void)setDeviceThumbnailPath:(NSString *)aDeviceThumbnailPath andDeviceName:(NSString *)aDeviceName {
    self.deviceThumbnail.image = [UIImage imageNamed:aDeviceThumbnailPath];
    self.deviceThumbnail.contentMode = UIViewContentModeScaleAspectFit;
    self.deviceName.text = aDeviceName;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
