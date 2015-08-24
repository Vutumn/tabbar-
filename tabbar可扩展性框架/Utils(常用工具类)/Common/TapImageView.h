//
//  TapImageView.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/28.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TapImageDelegate <NSObject>

- (void)tapImage:(id)sender;

@end

@interface TapImageView : UIImageView

@property (nonatomic, assign)id<TapImageDelegate>delegate;

@end
