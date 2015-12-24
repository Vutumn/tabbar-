//
//  HTestViewB.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/14.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@protocol HTestViewBDelegate <NSObject>

- (void)HTestViewBMethod;

@end

@interface HTestViewB : UIView

@property (nonatomic, weak) id<HTestViewBDelegate> delegate;

@end
