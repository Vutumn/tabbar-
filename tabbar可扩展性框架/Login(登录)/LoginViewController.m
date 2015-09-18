//
//  LoginViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/24.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "SystemTabbarViewController.h"

@interface LoginViewController ()
@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self InitWithSubViews];
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self.view addSubview:self.loginButton];
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.backgroundColor = [UIColor redColor];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_loginButton];
        
        [_loginButton makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.centerX);
            make.centerY.equalTo(self.view.centerY);
        }];
    }
    return _loginButton;
}

#pragma mark -event response
- (void)loginAction
{
    SystemTabbarViewController *vc = [[SystemTabbarViewController alloc] init];
    ((AppDelegate *)[UIApplication sharedApplication].delegate).window.rootViewController = vc;
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
