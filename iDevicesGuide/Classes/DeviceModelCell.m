//
//  DeviceModelCell.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/2.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "DeviceModelCell.h"

@implementation DeviceModelCell

- (void)cellWithThumbnail:(NSString *)thumbnailPath
               deviceName:(NSString *)name
           deviceCapacity:(NSNumber *)capacity {
    self.deviceThumbnail.image = [UIImage imageNamed:thumbnailPath];
    self.deviceThumbnail.contentMode = UIViewContentModeScaleAspectFit;
    self.deviceName.text = name;
    self.deviceCapacity.text = [NSString stringWithFormat:@"%@GB", capacity] ;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
