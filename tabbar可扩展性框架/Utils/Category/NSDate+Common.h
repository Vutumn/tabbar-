//
//  NSDate+Common.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/13.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+Helper.h"
#import "NSDate+convenience.h"

@interface NSDate (Common)

- (NSString *)stringTimesAgo;

- (NSString *)stringDisplay_HHmm;


- (NSString *)DatetimeConversionAndDatetime:(NSNumber *)datetime;
@end
