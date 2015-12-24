//
//  HTestViewB.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/14.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "HTestViewB.h"

@interface HTestViewB()
@property (nonatomic, strong) UIButton *buttonB;

@end

@implementation HTestViewB

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self InitWithSubViews];
        
    }
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.buttonB];
}

- (UIButton *)buttonB
{
    if (!_buttonB) {
        _buttonB = [UIButton buttonWithType:UIButtonTypeCustom];
        _buttonB.backgroundColor = [UIColor blackColor];
        [self addSubview:_buttonB];
        [_buttonB addTarget:self action:@selector(buttonBAction) forControlEvents:UIControlEventTouchDown];
        [_buttonB makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self.center);
            make.width.height.equalTo(@100);
        }];
    }
    return _buttonB;
}

- (void)buttonBAction {
    if ([self.delegate respondsToSelector:@selector(HTestViewBMethod)]) {
        [self.delegate HTestViewBMethod];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"ViewB touchesBegin");
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"ViewB touchCancelled");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"viewB touchesEnded");
}


@end
