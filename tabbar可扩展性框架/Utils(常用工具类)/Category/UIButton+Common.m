//
//  UIButton+Common.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/19.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "UIButton+Common.h"

@implementation UIButton (Common)

- (void)setUserTitle:(NSString *)aUserName font:(UIFont *)font maxWidth:(CGFloat)maxWidth{
    [self setTitle:aUserName forState:UIControlStateNormal];
    self.titleLabel.font = font;
    CGFloat titleWidth = [self.titleLabel.text getWidthWithFont:font constrainedToSize:CGSizeMake(KDeviceWidth, self.frame.size.height)];
    if (titleWidth > maxWidth) {
        titleWidth = maxWidth;
    }
    
    [self setWidth:titleWidth];
    [self.titleLabel setWidth:titleWidth];
    
    
}

@end
