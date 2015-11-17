//
//  PatientsTableViewCell.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/7.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

static NSString *const kPatientsCellIdentifier = @"PatientsCell";

@interface PatientsTableViewCell : UITableViewCell
@property (nonatomic, strong) UISwitch *switchbutton;


+ (CGFloat)cellHeightWithObj:(id)obj;
@end
