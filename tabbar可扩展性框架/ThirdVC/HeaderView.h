//
//  HeaderView.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/25.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
#import "CodingBanner.h"

@interface HeaderView : UIView

//轮播图片数组
@property (nonatomic, copy)NSArray *adListArray;

//图片点击方法block
@property (nonatomic, copy) void (^tapActionBlock)(CodingBanner *tapedBanner);
@property (nonatomic , copy) void (^buttonActionBlock)(NSInteger pageIndex);

@property (nonatomic, copy) void (^producActionBlock)(NSInteger tag);

- (void)reloadData;

@end
