//
//  DeviceHeaderView.m
//  iDeviceGuide
//
//  Created by 成鑫 on 15/9/24.
//  Copyright © 2015年 Deli-Lib. All rights reserved.
//

#import "DeviceHeaderView.h"

#define MAX_NUM_OF_PIC 3
@implementation DeviceHeaderView

const CGFloat pageControlHeight = 37;

- (instancetype)initWithFrame:(CGRect)frame andImageArray:(NSArray *)imageArray{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _picturesCount = [imageArray count];
        
        CGRect screenRect = self.bounds;
        CGFloat width = screenRect.size.width;
        CGFloat height = screenRect.size.height;
        CGFloat scrollViewWidth = width;
        CGFloat scrollViewHeight = height - pageControlHeight;
        
        CGRect scrollViewRect = CGRectMake(0, 0, scrollViewWidth, scrollViewHeight);
        CGRect contentViewRect = CGRectMake(0, 0, scrollViewWidth * _picturesCount, scrollViewHeight);
        CGRect pageControlRect = CGRectMake(0, height - pageControlHeight, scrollViewWidth, pageControlHeight);
        
        [self initScrollViewWithFrame:scrollViewRect];
        [self initContentViewWithFrame:contentViewRect andImageArray:imageArray];
        [self initPageControlWithFrame:pageControlRect];
        
        [self addSubview:_scrollView];
        [_scrollView addSubview:_contentView];
        [self addSubview:_pageControl];
    }
    return self;
}

- (void)initScrollViewWithFrame:(CGRect) rect {
    _scrollView = [[UIScrollView alloc] initWithFrame:rect];
    _scrollView.backgroundColor = [UIColor clearColor];
    
    _scrollView.contentSize = CGSizeMake(rect.size.width * _picturesCount, rect.size.height);
    _scrollView.pagingEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = false;
    _scrollView.showsHorizontalScrollIndicator = false;
    _scrollView.delegate = self;
}

- (void)initContentViewWithFrame:(CGRect) rect andImageArray:(NSArray *) imageArray {
    _contentView = [[UIView alloc] initWithFrame:rect];
    CGFloat imageWidth = rect.size.width / _picturesCount;
    CGFloat imageHeight = rect.size.height;
    
    for (UIImage *img in imageArray) {
        NSUInteger index = [imageArray indexOfObject:img];
        UIView *view = [[UIView alloc] initWithFrame:
                        CGRectMake(index * imageWidth, 0, imageWidth, imageHeight)];
        view.backgroundColor = [UIColor clearColor];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:
                                  CGRectMake(0, 0, imageWidth, imageHeight)];
        imageView.image = img;
        imageView.backgroundColor = [UIColor clearColor];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
        [_contentView addSubview:view];
    }
    _contentView.backgroundColor = [UIColor whiteColor];
}

- (void)initPageControlWithFrame:(CGRect) rect {
    _pageControl = [[LCAnimatedPageControl alloc] initWithFrame:rect];
    
    _pageControl.numberOfPages = _picturesCount;
    _pageControl.indicatorMargin = 10.0f;
    _pageControl.indicatorMultiple = 1.3f;
    _pageControl.indicatorDiameter = 10.0f;
    _pageControl.pageIndicatorColor = [UIColor lightGrayColor]; // 普通状态下的颜色
    _pageControl.currentPageIndicatorColor = [UIColor blackColor]; // 当前状态下的颜色
    _pageControl.pageStyle = LCDepthColorPageStyle;
    _pageControl.sourceScrollView = _scrollView;
    _pageControl.backgroundColor = [UIColor clearColor];
    
    [self.pageControl prepareShow];
    [_pageControl addTarget:self
                     action:@selector(pageControlClicked:)
           forControlEvents:UIControlEventValueChanged];
}


- (void)pageControlClicked:(UIPageControl *)pageControl {
    CGFloat width = self.frame.size.width;
    CGFloat scrollViewWidth = width;
    [_scrollView setContentOffset:CGPointMake(pageControl.currentPage * scrollViewWidth, 0) animated:YES];
}


@end
