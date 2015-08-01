//
//  NSTextAttachment+Common.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/1.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "NSTextAttachment+Common.h"

@implementation NSTextAttachment (Common)

- (void)adjustY:(CGFloat)y
{
    self.bounds = CGRectMake(0, y, self.image.size.width, self.image.size.height);
}


@end
