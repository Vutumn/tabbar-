//
//  DelegateDetailViewController.h
//  tabbar可扩展性框架
//
//  Created by 刘旭 on 15/8/20.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "BBaseViewController.h"

@protocol myDelegate <NSObject>

- (void)setForwardTitle:(NSString *)myTitle;

@end


@interface DelegateDetailViewController : BBaseViewController
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, assign) id<myDelegate> delegate;
@end
