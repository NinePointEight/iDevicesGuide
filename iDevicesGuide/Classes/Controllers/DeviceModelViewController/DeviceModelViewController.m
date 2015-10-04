//
//  DeviceModelViewController.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/2.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "DeviceModelViewController.h"
#import "TWRChart.h"

@interface DeviceModelViewController () <UITableViewDelegate,UITableViewDataSource>

typedef enum { iPhone, iPad, iPod, Mac } DeviceType;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *capacitiesArray;
@property(strong, nonatomic) TWRChartView *chartView;

- (void)initDevicesArrayWithDeviceType:(DeviceType)deviceType;

- (void)loadPieChart;
@end

@implementation DeviceModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [UIScreen mainScreen].bounds;
    _chartView = [[TWRChartView alloc] initWithFrame:CGRectMake(0, 64, screen.size.width, 300)];
    _chartView.backgroundColor = [UIColor yellowColor];
    
    NSString *jsFilePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"js"];
    [_chartView setChartJsFilePath:jsFilePath];
    
    [self.view addSubview:_chartView];
//    [self loadPieChart];
    _tableView.tableHeaderView = _chartView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)loadPieChart {
    // Values
    NSArray *values = @[@20, @30, @15, @5];
    
    // Colors
    UIColor *color1 = [UIColor colorWithHue:0.5 saturation:0.6 brightness:0.6 alpha:1.0];
    UIColor *color2 = [UIColor colorWithHue:0.6 saturation:0.6 brightness:0.6 alpha:1.0];
    UIColor *color3 = [UIColor colorWithHue:0.7 saturation:0.6 brightness:0.6 alpha:1.0];
    UIColor *color4 = [UIColor colorWithHue:0.8 saturation:0.6 brightness:0.6 alpha:1.0];
//    UIColor *color1 = [UIColor redColor];
//    UIColor *color2 = [UIColor yellowColor];
//    UIColor *color3 = [UIColor greenColor];
//    UIColor *color4 = [UIColor whiteColor];
    
    NSArray *colors = @[color1, color2, color3, color4];
    
    // Doughnut Chart
    TWRCircularChart *pieChart = [[TWRCircularChart alloc] initWithValues:values
                                                                   colors:colors
                                                                     type:TWRCircularChartTypeDoughnut
                                                                 animated:YES];
    
    
    // You can even leverage callbacks when chart animation ends!
    [_chartView loadCircularChart:pieChart];
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
