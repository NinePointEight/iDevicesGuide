//
//  mainViewController.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/9/29.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//
#import "DeviceModelViewController.h"
#import "DeviceHeaderView.h"
#import "deviceCell.h"
#import "Device.h"
#import "DeviceViewController.h"
#import "DevicesLibrary.h"

#define Rows_Of_Section 3

@interface DeviceViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray *imageArray;
// DeviceHeaderView为自定义View，封装了scrollView,contentView和一个具有动画效果的第三方pageConrtol
@property (strong, nonatomic) DeviceHeaderView *deviceHeaderView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DeviceViewController

- (void)viewDidLoad {
    NSLog(@"DeviceView viewDidLoad被执行");
    [super viewDidLoad];
    [self prepareForShow];
    CGFloat width = self.view.bounds.size.width;
    self.deviceHeaderView = [[DeviceHeaderView alloc] initWithFrame:CGRectMake(0, 0, width, 187)
                                                             andImageArray:self.imageArray];
    [self.view addSubview:self.deviceHeaderView];
    self.tableView.tableHeaderView = self.deviceHeaderView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"DeviceView viewWillDisappear被执行");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"DeviceView viewDidDisappear被执行");
    self.view = nil;
}

#pragma mark - prepare for show

- (void)prepareForShow {
    NSMutableArray *imgArray = [[NSMutableArray alloc] init];
    for (NSUInteger index = 0; index < [self.Devices count]; ++index) {
        NSArray *array = [self.Devices objectAtIndex:index];
        Device *device = [array firstObject];
        [imgArray addObject:[UIImage imageNamed:device.imagePath]];
    }
    self.imageArray = imgArray.mutableCopy;
}

#pragma mark - UITableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.Devices count];
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
        // 生成自定义cell
        NSLog(@"产生新的cell");
        UIStoryboard *stroyboard = [UIStoryboard storyboardWithName:@"deviceView" bundle:[NSBundle mainBundle]];
        UIViewController *vc = [stroyboard instantiateViewControllerWithIdentifier:@"deviceHomePage"];
        cell = (DeviceCell *)[vc.view viewWithTag:2];
    }
    
    if ([self.Devices count] > indexPath.row) {
        NSArray *devicesArray = [[self.Devices objectAtIndex:indexPath.row] copy];
        Device *device = (Device *)[devicesArray firstObject];
        
        [cell setDeviceThumbnailPath:device.thumbnailPath
                       andDeviceName:device.name];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *stroyboard = [UIStoryboard storyboardWithName:@"deviceView"
                                                         bundle:[NSBundle mainBundle]];
    DeviceModelViewController *deviceModelVC =
    [stroyboard instantiateViewControllerWithIdentifier:@"deviceModelPage"];
    
    NSUInteger index = indexPath.row;
    NSArray *selectedArray = [[self.Devices objectAtIndex:index] copy];
    [deviceModelVC initWithDevicesArray:selectedArray];

    [self.navigationController pushViewController:deviceModelVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
