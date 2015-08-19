//
//  UILabel+Common.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/3.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@interface UILabel (Common)

- (void)setString:(NSString *)str  WithMaxWidth:(CGFloat)MaxWidth;

- (void) setLongString:(NSString *)str withFitWidth:(CGFloat)width maxHeight:(CGFloat)maxHeight;


- (void) setLongString:(NSString *)str withVariableWidth:(CGFloat)maxWidth;
@end
