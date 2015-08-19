//
//  AFNetAPI.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/10.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "AFNetAPI.h"
#import "AFNetManage.h"
#import "Tweet.h"

@implementation AFNetAPI

+ (instancetype)sharedManager{
    static AFNetAPI *shareClient = nil;
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken, ^{
        shareClient = [[self alloc] init];
    });
    return shareClient;
}

//冒泡界面测试
- (void)request_paopao_Block:(void (^)(id data, NSError *error))block{
    
    NSDictionary *requestDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:99999999], @"last_id", @"time", @"sort", nil];
    
    [[AFNetManage shareClient] requestJsonDataWithPath: @"api/tweet/public_tweets" withParams:requestDic withMethodType:Get andBlock:^(id data, NSError *error) {
        if (data) {
            NSArray *resultData = [data valueForKeyPath:@"data"];
//            NSArray *resultA = [NSObject arrayFromJSON:resultData ofObjects:@"Tweet"];
            NSArray *resultA = [Tweet objectArrayWithKeyValuesArray:resultData];
            
            
            block(resultA, nil);
        }else{
            block(nil, error);
        }
    }];
    
}



@end
