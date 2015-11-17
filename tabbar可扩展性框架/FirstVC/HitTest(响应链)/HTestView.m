//
//  HTestView.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/11.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//


/** 层次结构
    　-ViewA
 
 　　　　-ButtonA
 
 　　　　-ViewB
 
 　　　　　　-ButtonB
 */

#import "HTestView.h"
#import "HTestViewB.h"

@interface HTestView()
@property (nonatomic, strong) UIButton *buttonA;
@property (nonatomic, strong) HTestViewB *viewB;

@end

@implementation HTestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self InitWithSubViews];
    }
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.buttonA];
    [self addSubview:self.viewB];
//    [self addSubview:self.buttonB];
}

- (UIButton *)button
{
    if (!_buttonA) {
        _buttonA = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonA.backgroundColor = [UIColor redColor];
        [self addSubview:_buttonA];
        
        [_buttonA makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self.center);
            make.width.height.equalTo(@100);
        }];
    }
    return _buttonA;
}

- (HTestViewB *)ViewB
{
    if (!_viewB) {
        _viewB = [HTestViewB new];
        _viewB.backgroundColor = [UIColor yellowColor];
        [self addSubview:_viewB];
        
        [_viewB makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self.center);
            make.width.height.equalTo(@100);
        }];
    }
    return _viewB;
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGPoint btPointA = [_buttonA convertPoint:point fromView:self];
    if ([_buttonA pointInside:btPointA withEvent:event]) {
        return _buttonA;
    }
    
    return [super hitTest:point withEvent:event];
}

@end
