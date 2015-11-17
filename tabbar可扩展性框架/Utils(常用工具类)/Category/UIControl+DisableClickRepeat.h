//
//  UIControl+DisableClickRepeat.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/14.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

@interface UIControl (DisableClickRepeat)

@property (nonatomic, assign) NSTimeInterval zs_acceptEventInterval; //重复点击加间隔

@end


