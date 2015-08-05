//
//  NSString+Common.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/1.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Common)

- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

- (CGFloat)getHeightWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

- (CGFloat)getWidthWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
