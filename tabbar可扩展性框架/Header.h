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
#import "UILabel+Common.h"
#import "UIImageView+Common.h"
#import "NSString+Common.h"
#import "NSObject+Common.h"
#import "UIColor+Common.h"
#import "UIView+Common.h"
#import "NSDate+Common.h"
#import "UIScrollView+Common.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <MJExtension.h>
#import "UIButton+Common.h"
#import "UITableView+Common.h"
#import "UIImage+Common.h"
#import "UISearchBar+Common.h"

#define HIDDEN_TAB_BAR @"hidden_home_tabbar"
#define SHOW_TAB_BAR @"show_home_tabbar"

//屏幕适配
#define KDeviceWidth [UIScreen mainScreen].bounds.size.width
#define KDeviceHeight [UIScreen mainScreen].bounds.size.height

//设备判断
#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//颜色转换
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//其他
#define kNetPath_Code_Base @"https://coding.net/"
//测试地址
#define kBaseUrlStr_Test @"https://coding.net/"

#define kKeyWindow [UIApplication sharedApplication].keyWindow
#define DebugLog(s, ...) NSLog(@"%s(%d): %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])

//链接颜色
#define kLinkAttributes     @{(__bridge NSString *)kCTUnderlineStyleAttributeName : [NSNumber numberWithBool:NO],(NSString *)kCTForegroundColorAttributeName : (__bridge id)[UIColor colorWithHexString:@"0x3bbd79"].CGColor}
#define kLinkAttributesActive       @{(NSString *)kCTUnderlineStyleAttributeName : [NSNumber numberWithBool:NO],(NSString *)kCTForegroundColorAttributeName : (__bridge id)[[UIColor colorWithHexString:@"0x1b9d59"] CGColor]}

#define kPaddingLeftWidth 15.0
#define kPaddingLeftWidth10 10.0
#define kLoginPaddingLeftWidth 18.0
#define kMySegmentControl_Height 44.0
#define kMySegmentControlIcon_Height 70.0

#define KTextColor80 [UIColor colorWithHexString:@"0x808080"]
#define kTextColor93 [UIColor colorWithHexString:@"0x8e8e93"]
#define kTextColorCC [UIColor colorWithHexString:@"0xc6c6cc"]
#define kTextColor9a [UIColor colorWithHexString:@"0x798b9a"]
#define KTextColor66 [UIColor colorWithHexString:@"0x666666"]
#define kTextColor49 [UIColor colorWithHexString:@"0xf254a9"]
#define kTextColora7 [UIColor colorWithHexString:@"0x5477a7"]
#define kTextColord4 [UIColor colorWithHexString:@"0xb9c4d4"]

#define kColor999 [UIColor colorWithHexString:@"0x999999"]
#define kColorTableBG [UIColor colorWithHexString:@"0xfafafa"]
#define kColorTableSectionBg [UIColor colorWithHexString:@"0xe5e5e5"]
#define kSectionHeaderBgColor [UIColor colorWithHexString:@"0xf7f7f7"]
#define kSeperatorColor [UIColor colorWithHexString:@"0xe6e6e6"]
#define kButtonBG [UIColor colorWithHexString:@"0x35a8fc"]
#define kGrayBG [UIColor colorWithHexString:@"f7f7f7"]
#define klightButtonBG [UIColor colorWithHexString:@"0xbfe4ff"]

#define kScaleFrom_iPhone5_Desgin(_X_) (_X_ * (KDeviceWidth/320))
#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


#define kPlaceholderMonkeyRoundView(_view_) [UIImage imageNamed:[NSString stringWithFormat:@"placeholder_monkey_round_%.0f", CGRectGetWidth(_view_.frame)]]
#define kHigher_iOS_6_1 (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1)


#endif
