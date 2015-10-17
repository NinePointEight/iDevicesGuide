//
//  DeviceModelViewController.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/2.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//
#import "Device.h"
#import "DeviceModelCell.h"
#import "DeviceModelViewController.h"
#import "CompareViewController.h"
#import <TWRCharts/TWRChart.h>

@interface DeviceModelViewController () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) TWRChartView *chartView;      // 自定义View，用来显示环状图表
@property (weak, nonatomic) IBOutlet UIView *headerView;    // 用来容纳图标和更新日期

@end

@implementation DeviceModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [UIScreen mainScreen].bounds;
    CGFloat heightOfChart = self.headerView.frame.size.height;
    
    // headerView一半为自定义图表，另一半在stroyboard中
    _chartView = [[TWRChartView alloc] initWithFrame:
                  CGRectMake(0, 0, screen.size.width / 2, heightOfChart)];
    _chartView.backgroundColor = [UIColor clearColor];

    [_headerView addSubview:_chartView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self loadPieChart];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"DeviceModelView viewWillDisappear被执行");
    self.chartView = nil;
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"DeviceModelView viewDidDisappear被执行");
    self.view = nil;
}

- (void)loadPieChart {
    NSLog(@"loadPieChart");
    Device *device = [self.devicesArray firstObject];
    
    // 获取更新周期，距上一次更新的时长，距下一次更新剩余的时长，由Device.m中的方法计算得出
    NSNumber *releaseCycle = [device releaseCycle];
    NSNumber *sinceLastRelease = [device sinceLastRelease];
    NSNumber *timeToNextRelease = [device timeToNextRelease];
    
    // 为图表提供数据
    NSArray *values = @[releaseCycle, sinceLastRelease, timeToNextRelease];
    
    UIColor *gray = [UIColor colorWithRed:0.569 green:0.597 blue:0.624 alpha:1.0];
    UIColor *yellow = [UIColor colorWithRed:0.910 green:0.714 blue:0.279 alpha:1.0];
    UIColor *green = [UIColor colorWithRed:0.746 green:0.761 blue:0.248 alpha:1.0];
    UIColor *red = [UIColor colorWithRed:0.781 green:0.244 blue:0.228 alpha:1.0];
    
    NSArray *colors;
    
    // 根据取得的数据更新View
    self.releaseCycleLabel.text = [NSString stringWithFormat:@"平均更新周期%@天", releaseCycle];
    self.sinceLastReleaseLabel.text = [NSString stringWithFormat:@"距上次更新已有%@天", sinceLastRelease];
    self.timeToNextReleaseLabel.text = [NSString stringWithFormat:@"预计%@天后更新", timeToNextRelease];
    
    // 如果距离下次更新的时长大于更新周期时长的40%，剩余时长用绿色显示，否则用红色
    if ((timeToNextRelease.doubleValue / releaseCycle.doubleValue) > 0.25) {
        colors = @[gray, yellow, green];
        self.markingImage3.image = [UIImage imageNamed:@"Green Button"];
        self.timeToNextReleaseLabel.textColor = green;
    } else {
        colors = @[gray, yellow, red];
        self.markingImage3.image = [UIImage imageNamed:@"Red Button"];
        self.timeToNextReleaseLabel.textColor = red;
    }
    
    // 生成环状图
    TWRCircularChart *pieChart = [[TWRCircularChart alloc] initWithValues:values
                                                                   colors:colors
                                                                     type:TWRCircularChartTypeDoughnut
                                                                 animated:YES];
    
    // 载入环状图
    [_chartView loadCircularChart:pieChart];
}

- (void)initWithDevicesArray:(NSArray *)array {
    self.devicesArray = [array copy];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView protocol methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.devicesArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"deviceView" bundle:[NSBundle mainBundle]];
    CompareViewController *compareVC = [storyboard instantiateViewControllerWithIdentifier:@"comparePage"];
    compareVC.device = [self.devicesArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:compareVC animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellReuseIdentifier = @"CellReuseIdentifier";
    DeviceModelCell *cell = (DeviceModelCell *)[tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
   
    if (cell == nil) {
        // 生成自定义cell
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
