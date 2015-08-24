//
//  TweetCommentCell.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/13.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@interface TweetMoreCommentCell : UITableViewCell
@property (strong, nonatomic) NSNumber *commentNum;
+(CGFloat)cellHeight;

@end
