//
//  UIScrollView+Common.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/17.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "UIScrollView+Common.h"

@implementation UIScrollView (Common)

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)addLineForTop:(BOOL)isTop bottom:(BOOL)isBottom
{
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGRect bounds = CGRectInset(self.bounds, 0, 0);
    CGPathAddRect(pathRef, nil, bounds);
    layer.path = pathRef;
    CFRelease(pathRef);
    layer.fillColor =  [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
    //线条颜色
    CGColorRef lineColor = [UIColor colorWithHexString:@"0xdddddd"].CGColor;
    
    CALayer *topLineLayer = [[CALayer alloc] init];
    CALayer *bottomLineLayer = [[CALayer alloc] init];
    
    CGFloat lineHeight = (1.0f / [UIScreen mainScreen].scale);
    
    CGFloat top = 0;
    if (isTop) {
        top = 0;
        topLineLayer.frame = CGRectMake(0, top, self.contentSize.width, lineHeight);
        topLineLayer.backgroundColor = lineColor;
        
        [layer addSublayer:topLineLayer];
    }
    if(isBottom){
        top = self.bounds.size.height - lineHeight;
        
        
        bottomLineLayer.frame = CGRectMake(0, top, self.contentSize.width, lineHeight);
        bottomLineLayer.backgroundColor = lineColor;
        
        [layer addSublayer:bottomLineLayer];
    }
    
    
    //UIView *testView = [[UIView alloc] initWithFrame:bounds];
    [self.layer addSublayer:topLineLayer];
    [self.layer addSublayer:bottomLineLayer];
    //[self addSubview:testView];
}

@end
