//
//  mainViewController.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/9/29.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "DeviceViewController.h"

#define Rows_Of_Section 3

@interface DeviceViewController ()<UITableViewDelegate, UITableViewDataSource>

typedef enum { iPhone, iPad, iPod, Mac } DeviceType;

@property (strong, nonatomic) DeviceHeaderView *deviceHeaderView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (void)initImageArrayWithDeviceType:(DeviceType) deviceType;
- (void)initDeviceArrayWithDeviceType:(DeviceType) deviceType;

@end

@implementation DeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = self.view.bounds.size.width;
    self.deviceHeaderView = [[DeviceHeaderView alloc] initWithFrame:CGRectMake(0, 0, width, 237)
                                                             andImageArray:self.imageArray];
    self.tableView.tableHeaderView = self.deviceHeaderView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - UITableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.deviceArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) return 10;
    else return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellReuseIdentifier = @"CellReuseIdentifier";
    DeviceCell *cell = (DeviceCell *)[tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    if (cell == nil) {
        NSLog(@"产生新的cell");
        UIStoryboard *stroyboard = [UIStoryboard storyboardWithName:@"deviceView" bundle:[NSBundle mainBundle]];
        UIViewController *vc = [stroyboard instantiateViewControllerWithIdentifier:@"deviceHomePage"];
        cell = (DeviceCell *)[vc.view viewWithTag:2];
    }
    
    if ([self.deviceArray count] > indexPath.row) {
        Device *device = [self.deviceArray objectAtIndex:indexPath.row];
        [cell setDeviceThumbnailPath:device.thumbnailPath andDeviceName:device.name];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *stroyboard = [UIStoryboard storyboardWithName:@"deviceView"
                                                         bundle:[NSBundle mainBundle]];
    DeviceModelViewController *deviceModelVC =
    [stroyboard instantiateViewControllerWithIdentifier:@"deviceModelPage"];
    
    NSUInteger index = indexPath.row;
    Device *selectedDevice = [self.deviceArray objectAtIndex:index];
    [deviceModelVC initWithDevice:selectedDevice];
    [self.navigationController pushViewController:deviceModelVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - prepare for show

- (void)prepareForShowWithDeviceType:(NSString *) aDeviceType {
    if (aDeviceType != nil) {
        DeviceType deviceType = -1;
        if ([aDeviceType isEqualToString:@"iPhone"])        deviceType = iPhone;
        else if ([aDeviceType isEqualToString:@"iPad"])     deviceType = iPad;
        else if ([aDeviceType isEqualToString:@"iPod"])     deviceType = iPod;
        else if ([aDeviceType isEqualToString:@"Mac"])      deviceType = Mac;
        [self initImageArrayWithDeviceType:deviceType];
        [self initDeviceArrayWithDeviceType:deviceType];
    }
}

#pragma mark - initImages

- (void)initImageArrayWithDeviceType:(DeviceType) deviceType {
    switch (deviceType) {
        case iPhone:
            self.imageArray = [[NSMutableArray alloc] initWithObjects:
                               [UIImage imageNamed:@"iPhone-1"],
                               [UIImage imageNamed:@"iPhone-2"],
                               [UIImage imageNamed:@"iPhone-3"], nil];
            break;
        case iPad:
            self.imageArray = [[NSArray alloc] initWithObjects:
                               [UIImage imageNamed:@"iPad-1"],
                               [UIImage imageNamed:@"iPad-2"],
                               [UIImage imageNamed:@"iPad-3"],nil];
            break;
        case iPod:
            self.imageArray = [[NSArray alloc] initWithObjects:
                               [UIImage imageNamed:@"iPod-1"],
                               [UIImage imageNamed:@"iPod-2"],
                               [UIImage imageNamed:@"iPod-3"], nil];
            break;
        case Mac:
            self.imageArray = [[NSArray alloc] initWithObjects:
                               [UIImage imageNamed:@"MacBook-1"],
                               [UIImage imageNamed:@"MacBook-2"],
                               [UIImage imageNamed:@"MacBook-3"], nil];
            break;
        default:
            NSLog(@"错误的设备类型");
            break;
    }
}

#pragma mark - init Devices' infomations

- (void)initDeviceArrayWithDeviceType:(DeviceType) deviceType {
    switch (deviceType) {
        case iPhone: {
            Device *iPhone5s = [Device deviceWithName:@"iPhone 5s"
                                            imagePath:@"iPhone-3"
                                        thumbnailPath:@"iPhone-3"];
            
            Device *iPhone6 = [Device deviceWithName:@"iPhone 6"
                                           imagePath:@"iPhone-2"
                                       thumbnailPath:@"iPhone-2"];
            
            Device *iPhone6p = [Device deviceWithName:@"iPhone 6 plus"
                                            imagePath:@"iPhone-2"
                                        thumbnailPath:@"iPhone-2"];
            
            Device *iPhone6s = [Device deviceWithName:@"iPhone 6s"
                                            imagePath:@"iPhone-2"
                                        thumbnailPath:@"iPhone-2"];
            
            Device *iPhone6sp = [Device deviceWithName:@"iPhone 6s plus"
                                             imagePath:@"iPhone-2"
                                         thumbnailPath:@"iPhone-2"];
            
            self.deviceArray = @[iPhone5s, iPhone6, iPhone6p, iPhone6s, iPhone6sp];
        } break;
            
        case iPad: {
            Device *iPadmini2 = [Device deviceWithName:@"iPad mini 2"
                                             imagePath:@"iPad-3"
                                         thumbnailPath:@"iPad-Button"];
            
            Device *iPadmini4 = [Device deviceWithName:@"iPad mini 4"
                                             imagePath:@"iPad-2"
                                         thumbnailPath:@"iPad-Button"];
            
            Device *iPadAir = [Device deviceWithName:@"iPad Air"
                                           imagePath:@"iPad-1"
                                       thumbnailPath:@"iPad-Button"];
            
            Device *iPadAir2 = [Device deviceWithName:@"iPad Air 2"
                                            imagePath:@"iPad-1"
                                        thumbnailPath:@"iPad-Button"];
            
            self.deviceArray = @[iPadmini2, iPadmini4, iPadAir, iPadAir2];
        } break;
            
        case iPod: {
            Device *iPodTouch = [Device deviceWithName:@"iPod Touch"
                                             imagePath:@"iPod-Touch-Button"
                                         thumbnailPath:@"iPod-Touch-Button"];
            
            Device *iPodNano = [Device deviceWithName:@"iPod Nano"
                                            imagePath:@"iPod-Nano-Button"
                                        thumbnailPath:@"iPod-Nano-Button"];
            Device *iPodShuffle = [Device deviceWithName:@"iPod Shuffle"
                                               imagePath:@"iPod-3"
                                           thumbnailPath:@"iPod-3"];
            
            self.deviceArray = @[iPodTouch, iPodNano, iPodShuffle];
        } break;
            
        case Mac: {
            Device *MacBook = [Device deviceWithName:@"Mac Book"
                                           imagePath:@"MacBook-1"
                                       thumbnailPath:@"MacBook-Button"];
            
            Device *MacBookAir = [Device deviceWithName:@"Mac Book Air"
                                              imagePath:@"MacBook-2"
                                          thumbnailPath:@"MacBook Air-Button"];
            
            Device *MacBookPro = [Device deviceWithName:@"Mac Book Pro"
                                              imagePath:@"MacBook-3"
                                          thumbnailPath:@"MacBook Pro-Button"];
            
            self.deviceArray = @[MacBook, MacBookAir, MacBookPro];
        } break;
            
        default:
            NSLog(@"错误的设备类型");
            break;
    }
}

@end
