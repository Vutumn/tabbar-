//
//  Tweet.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/11.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject

@property (nonatomic, strong) NSNumber *activity_id;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSNumber *comments;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *coord;
@property (nonatomic, strong) NSNumber *created_at;
@property (nonatomic, strong) NSString *device;
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSNumber *liked;
@property (nonatomic, strong) NSNumber *likes;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSNumber *owner_id;
@property (nonatomic, strong) NSMutableArray *comment_list, *like_users;
@property (nonatomic, strong) User *owner;


@property (nonatomic, strong, readwrite) NSDictionary *propertyArrayMap;


@end
