//
//  NSDate+Common.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/13.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "NSDate+Common.h"

@implementation NSDate (Common)

- (NSInteger)secondsAgo{
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitSecond)
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    return [components second];
}
- (NSInteger)minutesAgo{
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitMinute)
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    return [components minute];
}
- (NSInteger)hoursAgo{
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour)
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    return [components hour];
}
- (NSInteger)monthsAgo{
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitMonth)
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    return [components month];
}

- (NSInteger)yearsAgo{
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear)
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    return [components year];
}

- (NSInteger)leftDayCount{
    NSCalendar *calendar = [[self class] sharedCalendar];
    NSDate *today = [NSDate dateFromString:[[NSDate date] stringWithFormat:@"yyyy-MM-dd"] withFormat:@"yyyy-MM-dd"];
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:today
                                                 toDate:self
                                                options:0];
    return [components day];
}


- (NSString *)stringTimesAgo{
    if ([self compare:[NSDate date]] == NSOrderedDescending) {
        return @"刚刚";
    }
    
    NSString *text = nil;
    
    NSInteger agoCount = [self monthsAgo];
    if (agoCount > 0) {
        text = [NSString stringWithFormat:@"%ld个月前", (long)agoCount];
    }else{
        agoCount = [self daysAgoAgainstMidnight];
        if (agoCount > 0) {
            text = [NSString stringWithFormat:@"%ld天前", (long)agoCount];
        }else{
            agoCount = [self hoursAgo];
            if (agoCount > 0) {
                text = [NSString stringWithFormat:@"%ld小时前", (long)agoCount];
            }else{
                agoCount = [self minutesAgo];
                if (agoCount > 0) {
                    text = [NSString stringWithFormat:@"%ld分钟前", (long)agoCount];
                }else{
                    agoCount = [self secondsAgo];
                    if (agoCount > 15) {
                        text = [NSString stringWithFormat:@"%ld秒前", (long)agoCount];
                    }else{
                        text = @"刚刚";
                    }
                }
            }
        }
    }
    return text;
}

- (NSString *)stringDisplay_HHmm{
    NSString *displayStr = @"";
    if ([self year] != [[NSDate date] year]) {
        displayStr = [self stringWithFormat:@"yy/MM/dd HH:mm"];
    }else if ([self leftDayCount] != 0){
        displayStr = [self stringWithFormat:@"MM/dd HH:mm"];
    }else if ([self hoursAgo] > 0){
        displayStr = [self stringWithFormat:@"今天 HH:mm"];
    }else if ([self minutesAgo] > 0){
        displayStr = [NSString stringWithFormat:@"%ld 分钟前", (long)[self minutesAgo]];
    }else if ([self secondsAgo] > 10){
        displayStr = [NSString stringWithFormat:@"%ld 秒前", (long)[self secondsAgo]];
    }else{
        displayStr = @"刚刚";
    }
    return displayStr;
}

//项目需要改写stringDisplay_HHmm
- (NSString *)stringDisplay_HHmm_Update{
    NSString *displayStr = @"";
   if ([self leftDayCount] > 9){
        displayStr = [self stringWithFormat:@"yy/MM/dd HH:mm"];
   }if ([self leftDayCount] < 9 && [self leftDayCount] > 0) {
       displayStr = [NSString stringWithFormat:@"%ld 天前", [self leftDayCount]];
   }

   else if ([self hoursAgo] > 0){
        displayStr = [self stringWithFormat:@"今天 HH:mm"];
    }else if ([self minutesAgo] > 0){
        displayStr = [NSString stringWithFormat:@"%ld 分钟前", (long)[self minutesAgo]];
    } else{
        displayStr = @"刚刚";
    }
    return displayStr;
}

- (NSString *)DatetimeConversionAndDatetime:(NSNumber *)datetime
{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:datetime.doubleValue/1000];
    NSDateFormatter *formatter = [[self class] sharedDateFormatter];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; // -----
    NSString *nowtimeStr = [formatter stringFromDate:confromTimesp];
    return nowtimeStr;
}

@end
