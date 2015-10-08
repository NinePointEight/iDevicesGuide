//
//  DeviceModelViewController.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/2.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "DeviceModelViewController.h"
#import <TWRCharts/TWRChart.h>

@interface DeviceModelViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) TWRChartView *chartView;
@property (weak, nonatomic) IBOutlet UIView *HeaderView;

@end

@implementation DeviceModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [UIScreen mainScreen].bounds;
    CGFloat heightOfChart = self.HeaderView.frame.size.height;
    _chartView = [[TWRChartView alloc] initWithFrame:
                  CGRectMake(0, 0, screen.size.width / 2, heightOfChart)];
    _chartView.backgroundColor = [UIColor clearColor];

    [_HeaderView addSubview:_chartView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self loadPieChart];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"DeviceModelView viewWillDisappear被执行");
    self.chartView = nil;
    self.devicesArray = nil;
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"DeviceModelView viewDidDisappear被执行");
    self.view = nil;
}

- (void)loadPieChart {
    NSLog(@"loadPieChart");
    // Values
    NSArray *values = @[@365, @100, @265];
    
    UIColor *gray = [UIColor colorWithRed:0.569 green:0.597 blue:0.624 alpha:1.0];
    UIColor *yellow = [UIColor colorWithRed:0.910 green:0.714 blue:0.279 alpha:1.0];
    UIColor *green = [UIColor colorWithRed:0.746 green:0.761 blue:0.248 alpha:1.0];
    UIColor *red = [UIColor colorWithRed:0.781 green:0.244 blue:0.228 alpha:1.0];

    
    NSArray *colors = @[gray, yellow, green];
    
    // Doughnut Chart
    TWRCircularChart *pieChart = [[TWRCircularChart alloc] initWithValues:values
                                                                   colors:colors
                                                                     type:TWRCircularChartTypeDoughnut
                                                                 animated:YES];
    
    
    // You can even leverage callbacks when chart animation ends!
    [_chartView loadCircularChart:pieChart];
}

- (void)initWithDevicesArray:(NSArray *)array {
    self.devicesArray = [array copy];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
