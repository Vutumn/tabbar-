//
//  BBaseViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/29.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "BBaseViewController.h"

@interface BBaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;

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
