//
//  UITableView+Common.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/26.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Common)

- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace;
- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace withRightSpace:(CGFloat)rightSpace hasSectionLine:(BOOL)hasSectionLine;
- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace withRightSpace:(CGFloat)rightSpace;

- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace hasSectionLine:(BOOL)hasSectionLine;
@end
