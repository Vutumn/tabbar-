//
//  AFNetManage.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/6.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#define kNetworkMethodName @[@"Get", @"Post", @"Put", @"Delete"]

#import "AFNetManage.h"

@implementation AFNetManage

+ (instancetype)shareClient
{
    static AFNetManage *_shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kNetPath_Code_Base]];
    });
    return _shareClient;
}


- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    //response处理返回的数据
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    
    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    return self;
}

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary *)params
                 withMethodType:(NetworkMethod)method
                       andBlock:(void (^)(id data, NSError *error))block{
    [self requestJsonDataWithPath:aPath withParams:params withMethodType:method autoShowError:YES andBlock:block];
}

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary *)params
                 withMethodType:(NetworkMethod)method
                  autoShowError:(BOOL)autoShowError
                       andBlock:(void (^)(id data, NSError *error))block{
    if (!aPath || aPath.length <= 0) {
        return;
    }
    DebugLog(@"\n===========request===========:%@\n%@:\n%@", kNetworkMethodName[method], aPath, params);

    
    aPath = [aPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //发起请求
    switch (method) {
        case Get:{
            [self GET:aPath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                id error = [self handleResponse:responseObject autoShowError:autoShowError];
                if (error) {
                    block(nil, error);
                }else{
                    block(responseObject, nil);
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                !autoShowError || [self showError:error];
                block(nil, error);
            }];
            break;
        }
        case Post:{
            [self POST:aPath parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                id error = [self handleResponse:responseObject autoShowError:autoShowError];
                if (error) {
                    block(nil, error);
                }else{
                    block(responseObject, nil);
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                if (autoShowError) {
                    [self showError:error];
                }
                block(nil, error);
            }];
            break;
        }
        /* 可以加其他的 put delete类型 */
            
        default:
            break;
    }
}

@end
