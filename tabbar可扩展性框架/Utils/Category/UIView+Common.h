//
//  UIView+Common.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/12.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@class BlankView;

@interface UIView (Common)
@property (nonatomic, strong)BlankView *blankView;

- (void)setY:(CGFloat)y;
- (void)setX:(CGFloat)x;
- (void)setOrigin:(CGPoint)origin;
- (void)setHeight:(CGFloat)height;
- (void)setWidth:(CGFloat)width;
- (void)setSize:(CGSize)size;
- (CGFloat)maxXOfFrame;
- (void)hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void(^)(id sender))block;

@end

@interface BlankView:UIView
@property (nonatomic, strong)UILabel *tipLabel;
@property (nonatomic, strong)UIButton *reloadButton;
@property (copy, nonatomic)void(^reloadButtonBlock)(id sender);

- (void)hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block;


@end
