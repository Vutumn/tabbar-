//
//  ActionView.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/27.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@interface ActionView : UIView

@property (nonatomic, copy) void(^sendMessageBlock)();
@property (nonatomic, copy) void(^addFriensBlock)();

@end
