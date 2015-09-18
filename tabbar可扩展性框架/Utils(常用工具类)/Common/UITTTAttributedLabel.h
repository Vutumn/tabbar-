//
//  UITTTAttributedLabel.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/11.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "TTTAttributedLabel.h"
#import "Header.h"

typedef void(^UITTTLabelTapBlock)(id obj);

@interface UITTTAttributedLabel : TTTAttributedLabel

- (void)addLongPressForCopy;
- (void)addLongPressForCopyWithBGColor:(UIColor *)color;
- (void)addTapBlock:(UITTTLabelTapBlock)block;
- (void)addDeleteBlock:(UITTTLabelTapBlock)block;

@end
