//
//  BlockDetailViewController.h
//  tabbar可扩展性框架
//
//  Created by 刘旭 on 15/8/20.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "BaseViewController.h"
typedef void (^myBlock) (NSString *title);
@interface BlockDetailViewController : BBaseViewController

@property (nonatomic, strong) myBlock block;
@property (nonatomic, assign) NSInteger sex;
@end
