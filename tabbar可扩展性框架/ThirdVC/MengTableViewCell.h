//
//  MengTableViewCell.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/25.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@interface MengTableViewCell : UITableViewCell
@property (nonatomic, assign)NSInteger cellType;

+ (CGFloat)cellHeightWithObj:(id)obj;

@end
