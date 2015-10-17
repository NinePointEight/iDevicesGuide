//
//  YahooAPIConnection.m
//  iDevicesGuide
//
//  Created by 成鑫 on 15/10/17.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "YahooAPIConnection.h"
#import "AppDelegate.h"

@implementation YahooAPIConnection {
    NSMutableArray * exchangeParametersArray;
}

-(void)getCurrencyExchange{
    [self setExchangeParameters];
    double timeoutInterval = 60.0;
    
    NSString * address = [NSString stringWithFormat:@"https://query.yahooapis.com/v1/public/yql?q=select%%20*%%20from%%20yahoo.finance.xchange%%20where%%20pair%%20in%%20(%%22%@%%22%%2C%%22%@%%22%%2C%%20%%22%@%%22)&format=json&diagnostics=true&env=store%%3A%%2F%%2Fdatatables.org%%2Falltableswithkeys&callback=",
                          [exchangeParametersArray objectAtIndex:0],
                          [exchangeParametersArray objectAtIndex:1],
                          [exchangeParametersArray objectAtIndex:2]];
    
    NSURL *url = [NSURL URLWithString:address];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url
                                                              cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                          timeoutInterval:timeoutInterval];
    NSError * error1 = [[NSError alloc] init];
    NSData * synchData = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:nil error:&error1];
    NSLog([[NSString alloc] initWithData:synchData encoding:NSUTF8StringEncoding]);
    if (error1.code > 0) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"这是第一个警告" message:@"看不懂俄语"
                                                          delegate:self cancelButtonTitle:nil otherButtonTitles:@"ОК", nil];
        [alertView show];
        return;
    }
    
    NSError * JSONError = [[NSError alloc] init];
    NSDictionary *JSONResponse = [NSJSONSerialization JSONObjectWithData:synchData
                                                                 options:kNilOptions
                                                                   error:&JSONError];
    if (JSONError.code > 0) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"这是第二个警告" message:@"还是看不懂俄语"
                                                          delegate:self cancelButtonTitle:nil otherButtonTitles:@"ОК", nil];
        [alertView show];
        return;
    }
    
    NSMutableArray * JSONResultsArray = [[JSONResponse valueForKeyPath:@"query.results.rate"] mutableCopy];
    NSMutableArray * currencyExchangeResultsArray = [NSMutableArray new];
    for (NSMutableDictionary * currentResult in JSONResultsArray) {
        CurrencyExchange * currencyExchange = [[CurrencyExchange alloc] init];
        currencyExchange.name = [currentResult valueForKey:@"Name"];
        NSString *rate = [currentResult valueForKey:@"Rate"];
        currencyExchange.rate = [NSNumber numberWithFloat:[rate floatValue]];
        [currencyExchangeResultsArray addObject:currencyExchange];
    }
    
    AppDelegate * appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.tempArray = currencyExchangeResultsArray;
}

-(void)setExchangeParameters{
    exchangeParametersArray = [[NSMutableArray alloc] init];
    [exchangeParametersArray addObject:@"CNYUSD"];
    [exchangeParametersArray addObject:@"CNYJPY"];
    [exchangeParametersArray addObject:@"CNYHKD"];
//    [exchangeParametersArray addObject:@"CNYTRY"];
}

@end

