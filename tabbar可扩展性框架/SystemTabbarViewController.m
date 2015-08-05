//
//  SystemTabbarViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/29.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "SystemTabbarViewController.h"
#import "ViewController.h"
#import "BaseViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"


@interface SystemTabbarViewController ()

@end

@implementation SystemTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.tabBar.translucent = NO;

    NSArray *titles = [NSArray arrayWithObjects:@"第一个", @"第二个", @"第三个", @"第四个", @"第五个",nil];
    
    NSArray *ImagesArr = [NSArray arrayWithObjects:@"home_icon_grey.png",
                       @"message_icon_grey.png",
                       @"discover_icon_grey.png",
                       @"news_icon_grey.png",
                       @"my_icon_grey.png", nil];
    NSArray *SImageArr = [NSArray arrayWithObjects:@"home_icon_green.png",
                       @"message_icon_green.png",
                       @"discover_icon_green.png",
                       @"news_icon_hover_green.png",
                       @"my_icon_hover_green.png", nil];
    
    UINavigationController *VC = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc]init]];
    UINavigationController *baseVC = [[UINavigationController alloc] initWithRootViewController:[[BaseViewController alloc] init]];
    UINavigationController *thVC = [[UINavigationController alloc] initWithRootViewController:[[ThirdViewController alloc] init]];
    UINavigationController *fouVC = [[UINavigationController alloc] initWithRootViewController:[[FourthViewController alloc] init]];
    UINavigationController *fifVC = [[UINavigationController alloc] initWithRootViewController:[[FifthViewController alloc] init]];
    
    self.viewControllers = @[VC, baseVC, thVC, fouVC, fifVC,];
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *item, NSUInteger idx, BOOL *stop) {
        [item setTitle:titles[idx]];
       // [item setImage:[UIImage imageNamed:ImagesArr[idx]]];
       // [item setSelectedImage:[UIImage imageNamed:SImageArr[idx]]];
    }];
    
    
    
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
