//
//  DeviceHeaderView.h
//  iDeviceGuide
//
//  Created by 成鑫 on 15/9/24.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCAnimatedPageControl.h"

@interface DeviceHeaderView : UIView<UIScrollViewDelegate>

// 存放图片
@property (nonatomic, strong) UIScrollView                  *scrollView;
@property (strong, nonatomic) LCAnimatedPageControl         *pageControl;
@property (nonatomic, strong) UIView                        *contentView;
@property (nonatomic, strong) UIImageView                   *backGroundImage;
@property (nonatomic, assign) NSUInteger                    picturesCount;

-(void)pageControlClicked:(UIPageControl *)sender;
- (instancetype)initWithFrame:(CGRect)frame andImageArray:(NSArray *) imageArray;

@end
