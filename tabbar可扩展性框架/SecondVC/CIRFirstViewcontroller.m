//
//  CIRFirstViewcontroller.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/17.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "CIRFirstViewcontroller.h"

@implementation CIRFirstViewcontroller

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    DebugLog(@"%f", self.view.frame.size.height);
}

- (void)loadView
{
    [super loadView];
    
    UILabel *label = [UILabel new];
    label.text = @"第一";
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.centerY.equalTo(self.view.centerY);
        
    }];
    
}


@end
