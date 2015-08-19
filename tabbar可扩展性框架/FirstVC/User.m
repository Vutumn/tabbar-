//
//  User.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/11.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "User.h"
#import <objc/runtime.h>
#import <MJExtension.h>

@implementation User

- (id)newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
//    if ([property.name isEqualToString:@"created_at"]) {
//        if (oldValue == nil || [oldValue isKindOfClass:[NSNull class]]) return @"";
//    }else if (property.type.typeClass == [NSDate class] && oldValue != nil) {
//        NSNumber *timeSince1970 = (NSNumber *)oldValue;
//
//        NSTimeInterval timeSince1970TimeInterval = timeSince1970.doubleValue/1000;
//        NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeSince1970TimeInterval];
//        return date;
//    }
//
//    return oldValue;

    if ([property.name isEqualToString:@"created_at"] && property.type.typeClass == [NSNumber class]) {
        if (oldValue == nil) {
            return @"";
        }else{
            NSNumber *timeSince1970 = (NSNumber *)oldValue;
            
            NSTimeInterval timeSince1970TimeInterval = timeSince1970.doubleValue/1000;
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeSince1970TimeInterval];
            return date;
  
        }
    }
        return oldValue;
}

@end
