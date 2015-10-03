//
//  DeviceModelCell.h
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/2.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceModelCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *deviceThumbnail;
@property (weak, nonatomic) IBOutlet UILabel *deviceName;
@property (weak, nonatomic) IBOutlet UILabel *deviceCapacity;

- (void)cellWithThumbnail:(NSString *)thumbnailPath
               deviceName:(NSString *)name
           deviceCapacity:(NSNumber *)capacity;

@end
