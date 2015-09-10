//
//  AFNetManage.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/6.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import <AFNetworking.h>
#import "Header.h"

typedef enum{
    Get = 0,
    Post,
    Put,
    Delete
}NetworkMethod;

@interface AFNetManage : AFHTTPRequestOperationManager

+ (instancetype)shareClient;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary *)params
                 withMethodType:(NetworkMethod)method
                       andBlock:(void (^)(id data, NSError *errro))block;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary *)params
                 withMethodType:(NetworkMethod)method
                  autoShowError:(BOOL)autoShowError
                       andBlock:(void (^)(id data, NSError *error))block;

@end
