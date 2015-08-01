//
//  Header.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/24.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#ifndef tabbar_______Header_h
#define tabbar_______Header_h

#define MAS_SHORTHAND

//引用的
#import <Masonry.h>
#import "BBaseViewController.h"
#import "Utils.h"
#import "UITextField+Common.h"

#define HIDDEN_TAB_BAR @"hidden_home_tabbar"
#define SHOW_TAB_BAR @"show_home_tabbar"

//屏幕适配
#define KDeviceWidth [UIScreen mainScreen].bounds.size.width
#define KDeviceHeight [UIScreen mainScreen].bounds.size.height

//颜色转换
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



#endif
