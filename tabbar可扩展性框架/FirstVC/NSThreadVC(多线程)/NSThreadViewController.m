//
//  NSThreadViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/1.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "NSThreadViewController.h"

@interface NSThreadViewController ()

@end

@implementation NSThreadViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"多线程";
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
