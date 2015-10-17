//
//  CompareViewController.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/17.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "CompareViewController.h"
#import "AppDelegate.h"
#import "YahooAPIConnection.h"
#import "TWRChart.h"

@interface CompareViewController ()

@property (nonatomic, weak) AppDelegate *appDelegate;
@property (nonatomic, weak) NSDate *lastUpdateTime;
@property (nonatomic, copy) NSMutableArray *ratesArray;
@property (weak, nonatomic) IBOutlet UISwitch *currencySwitch;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) TWRChartView *chartView;
@property (weak, nonatomic) IBOutlet UILabel *recentUpdateLabel;

@end

@implementation CompareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    [self updateRates];
    CGRect chartRect = self.contentView.frame;
    _chartView = [[TWRChartView alloc] initWithFrame: chartRect];
    self.chartView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.chartView];
    [self loadBarChart];
}

- (void)loadBarChart {
    NSDictionary *priceDictionary = [self.device priceDictonary];
    
    CurrencyExchange *CNYtoUSD = [self.ratesArray objectAtIndex:0];
    CurrencyExchange *CNYtoJPY = [self.ratesArray objectAtIndex:1];
    CurrencyExchange *CNYtoHKD = [self.ratesArray objectAtIndex:2];
    
    float rateOfUSD = CNYtoUSD.rate.floatValue;
    float rateOfJPY = CNYtoJPY.rate.floatValue;
    float rateOfHKD = CNYtoHKD.rate.floatValue;
    
    NSInteger priceOfUS = [[priceDictionary valueForKey:@"usPrice"] integerValue] / rateOfUSD;
    NSInteger priceOfJP = [[priceDictionary valueForKey:@"jpPrice"] integerValue] / rateOfJPY;
    NSInteger priceOfHK = [[priceDictionary valueForKey:@"hkPrice"] integerValue] / rateOfHKD;
    
    NSNumber *cnPrice = [priceDictionary valueForKey:@"cnPrice"];
    NSNumber *eduPrice = [priceDictionary valueForKey:@"eduPrice"];
    NSNumber *usPrice = [NSNumber numberWithInteger:priceOfUS];
    NSNumber *jpPrice = [NSNumber numberWithInteger:priceOfJP];
    NSNumber *hkPrice = [NSNumber numberWithFloat:priceOfHK];
    
    // Build chart data
    TWRDataSet *dataSet1 = [[TWRDataSet alloc] initWithDataPoints:@[cnPrice, cnPrice, cnPrice, cnPrice]
                                                        fillColor:[[UIColor orangeColor] colorWithAlphaComponent:0.5]
                                                      strokeColor:[UIColor orangeColor]];
    
    TWRDataSet *dataSet2 = [[TWRDataSet alloc] initWithDataPoints:@[eduPrice, usPrice, jpPrice, hkPrice]
                                                        fillColor:[[UIColor redColor] colorWithAlphaComponent:0.5]
                                                      strokeColor:[UIColor redColor]];
    
    NSArray *labels = @[@"A", @"B", @"C", @"D"];
    TWRBarChart *bar = [[TWRBarChart alloc] initWithLabels:labels
                                                  dataSets:@[dataSet1, dataSet2]
                                                  animated:YES];
    // Load data
    [self.chartView loadBarChart:bar];
}

- (void)updateRates {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [self getCurrencyExchange];
}

- (void)getCurrencyExchange {
    YahooAPIConnection * connection = [[YahooAPIConnection alloc] init];
    [connection getCurrencyExchange];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    self.lastUpdateTime = [NSDate date];
    self.ratesArray = self.appDelegate.tempArray.mutableCopy;
    self.appDelegate.tempArray = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
