//
//  VideoHistoryTableViewCell.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/8.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Header.h"

static NSString *const kVideoHistoryCellIdentifier = @"VideoHistoryCell";


@interface VideoHistoryTableViewCell : UITableViewCell

+ (CGFloat)cellHeightWithObj:(id)obj;

@end
