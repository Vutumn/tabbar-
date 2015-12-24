//
//  HTestView.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/11.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
#import "HTestViewB.h"

@interface HTestView : UIView<HTestViewBDelegate>

@property (nonatomic, weak) id<HTestViewBDelegate> delegate;

@end
