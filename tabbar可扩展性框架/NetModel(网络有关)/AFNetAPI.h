//
//  AFNetAPI.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/10.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Header.h"

@interface AFNetAPI : NSObject

- (void)request_paopao_Block:(void (^)(id data, NSError *error))block;

- (void)request_BannersWithBlock:(void (^)(id data, NSError *error))block;

+ (instancetype)sharedManager;
@end
