//
//  Tweet.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/11.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet


+ (NSDictionary *)objectClassInArray
{
    return @{
             @"comment_list" : @"Comment",
             @"like_users" : @"User"
             };
}


- (id)newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
//    if ([property.name isEqualToString:@"created_at"]) {
//        if (oldValue == nil || [oldValue isKindOfClass:[NSNull class]]) return @"";
//    }else if (property.type.typeClass == [NSDate class] && oldValue != nil) {
//        NSNumber *timeSince1970 = (NSNumber *)oldValue;
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

- (NSInteger)numberOfComments
{
    return MIN(_comment_list.count + 1, MIN(_comments.intValue, 6));
}

- (BOOL)hasMoreComments{
    return (_comments.intValue > _comment_list.count || _comments.intValue > 5);
}

- (NSInteger)numOfLikers{
    return MIN(_like_users.count +1,
               MIN(_likes.intValue,
                   [self maxLikerNum]));
}

- (NSInteger)maxLikerNum{
    NSInteger maxNum = 8;
    if (kDevice_Is_iPhone6) {
        maxNum = 10;
    }else if (kDevice_Is_iPhone6Plus){
        maxNum = 11;
    }
    return maxNum;
}


@end



