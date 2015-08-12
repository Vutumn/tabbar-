//
//  TweetCell.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/11.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
#import  "UITTTAttributedLabel.h"
#import "Tweet.h"

@interface TweetCell : UITableViewCell<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate, TTTAttributedLabelDelegate>

@property (strong, nonatomic) Tweet *tweet;



+ (CGFloat)cellHeightWithObj:(id)obj;

@end
