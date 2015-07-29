//
//  TapImageView.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/28.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

/**
 *  继承imageview，添加一个自带手势的，只要遵从delegate即可使用
 */


#import "TapImageView.h"

@implementation TapImageView

- (void)dealloc
{
    self.delegate = nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Tapped:)];
        [self addGestureRecognizer:tap];
        
        self.clipsToBounds = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.userInteractionEnabled = YES;
    }
    return self;
}


- (void) Tapped:(UIGestureRecognizer *) gesture
{
    if ([self.delegate respondsToSelector:@selector(tapImage:)])
    {
        [self.delegate tapImage:self];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
