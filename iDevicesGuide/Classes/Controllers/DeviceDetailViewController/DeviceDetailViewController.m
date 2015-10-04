//
//  DeviceDetailViewController.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/4.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "DeviceDetailViewController.h"
#import <TWRCharts/TWRChart.h>

@interface DeviceDetailViewController ()

@property(strong, nonatomic) TWRChartView *chartView;

@end

@implementation DeviceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _chartView = [[TWRChartView alloc] initWithFrame:CGRectMake(0, 64, 320, 300)];
    _chartView.backgroundColor = [UIColor clearColor];
    [self loadPieChart];
    
}

- (void)loadPieChart {
    // Values
    NSArray *values = @[@20, @30, @15, @5];
    
    // Colors
//    UIColor *color1 = [UIColor colorWithHue:0.5 saturation:0.6 brightness:0.6 alpha:1.0];
//    UIColor *color2 = [UIColor colorWithHue:0.6 saturation:0.6 brightness:0.6 alpha:1.0];
//    UIColor *color3 = [UIColor colorWithHue:0.7 saturation:0.6 brightness:0.6 alpha:1.0];
//    UIColor *color4 = [UIColor colorWithHue:0.8 saturation:0.6 brightness:0.6 alpha:1.0];
    UIColor *color1 = [UIColor redColor];
    UIColor *color2 = [UIColor yellowColor];
    UIColor *color3 = [UIColor greenColor];
    UIColor *color4 = [UIColor whiteColor];
    
    
    NSArray *colors = @[color1, color2, color3, color4];
    
    // Doughnut Chart
    TWRCircularChart *pieChart = [[TWRCircularChart alloc] initWithValues:values
                                                                   colors:colors
                                                                     type:TWRCircularChartTypeDoughnut
                                                                 animated:YES];
    
    // You can even leverage callbacks when chart animation ends!
    [_chartView loadCircularChart:pieChart withCompletionHandler:^(BOOL finished) {
        if (finished) {
            NSLog(@"Animation finished!!!");
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
