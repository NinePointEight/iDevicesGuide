//
//  DeviceModelViewController.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/2.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "DeviceModelViewController.h"

@interface DeviceModelViewController () <UITableViewDelegate,UITableViewDataSource>

typedef enum { iPhone, iPad, iPod, Mac } DeviceType;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *capacitiesArray;

- (void)initDevicesArrayWithDeviceType:(DeviceType)deviceType;

@end

@implementation DeviceModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initWithDevice:(Device *)aDevice {
    if (aDevice != nil) {
        NSString *name = aDevice.name;
        DeviceType deviceType = 0;
        if ([name hasPrefix:@"iPhone"]) deviceType = iPhone;
        else if ([name hasPrefix:@"iPad"]) deviceType = iPad;
        else if ([name hasPrefix:@"iPod"]) deviceType = iPod;
        else if ([name hasPrefix:@"Mac"]) deviceType = Mac;
        
        self.devicesArray = [[NSMutableArray alloc] initWithCapacity:3];
        for (NSUInteger count = 0; count < 3; ++count) {
            Device *device = [Device deviceWithName:aDevice.name
                                          imagePath:aDevice.imagePath
                                      thumbnailPath:aDevice.thumbnailPath];
            [self.devicesArray addObject:device];
        }
        
        [self initDevicesArrayWithDeviceType:deviceType];
    }
}

- (void)initDevicesArrayWithDeviceType:(DeviceType)deviceType {
    switch (deviceType) {
        case Mac: {
            _capacitiesArray = @[@128, @256, @512];
        } break;
        case iPod: {
            _capacitiesArray = @[@16, @32, @64];
        } break;
        default: {
            _capacitiesArray = @[@16, @64, @128];
        } break;
    }
    for (NSUInteger index = 0; index < [self.devicesArray count]; ++index) {
        Device *device = [self.devicesArray objectAtIndex:index];
        device.capacity = [_capacitiesArray objectAtIndex:index];
    }
}

#pragma mark - UITableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.devicesArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellReuseIdentifier = @"CellReuseIdentifier";
    DeviceModelCell *cell = (DeviceModelCell *)[tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    if (cell == nil) {
        NSLog(@"产生新的cell");
        UIStoryboard *stroyboard = [UIStoryboard storyboardWithName:@"deviceView" bundle:[NSBundle mainBundle]];
        UIViewController *vc = [stroyboard instantiateViewControllerWithIdentifier:@"deviceModelPage"];
        cell = (DeviceModelCell *)[vc.view viewWithTag:2];
    }
    
    if ([self.devicesArray count] > indexPath.row) {
        Device *device = [self.devicesArray objectAtIndex:indexPath.row];
        [cell cellWithThumbnail:device.thumbnailPath deviceName:device.name deviceCapacity:device.capacity];
    }
    return cell;
}

@end
