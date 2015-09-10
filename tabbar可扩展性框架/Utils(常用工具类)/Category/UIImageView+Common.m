//
//  UIImageView+Common.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/4.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "UIImageView+Common.h"

@implementation UIImageView (Common)

- (void)doBorderWidth:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

- (void)doCircleFrame{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width/2;
   // self.layer.borderWidth = 0.5;
//    self.layer.borderColor = [UIColor colorWithHexString:@"0xdddddd"].CGColor;
}

@end
