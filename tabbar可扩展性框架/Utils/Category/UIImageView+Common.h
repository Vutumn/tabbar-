//
//  UIImageView+Common.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/4.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@interface UIImageView (Common)

- (void)doBorderWidth:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;

- (void)doCircleFrame;

@end
