//
//  Comment.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/13.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Comment : NSObject

@property (readwrite, nonatomic, strong) NSString *content;
@property (readwrite, nonatomic, strong) User *owner;
@property (readwrite, nonatomic, strong) NSNumber *id, *owner_id, *tweet_id;
@property (readwrite, nonatomic, strong) NSDate *created_at;

@end
