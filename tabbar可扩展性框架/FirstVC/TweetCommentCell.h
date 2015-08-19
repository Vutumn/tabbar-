//
//  TweetCommentCell.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/13.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITTTAttributedLabel.h"
#import "Comment.h"
#import "Header.h"

@interface TweetCommentCell : UITableViewCell

@property (nonatomic, strong) UITTTAttributedLabel *commentLabel;

- (void)configWithComment:(Comment *)curComment topLine:(BOOL)has;
+(CGFloat)cellHeightWithObj:(id)obj;

@end
