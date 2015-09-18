//
//  DelegateDetailViewController.m
//  tabbar可扩展性框架
//
//  Created by 刘旭 on 15/8/20.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "DelegateDetailViewController.h"

@interface DelegateDetailViewController ()
@property (nonatomic, strong) UIButton *upButton;
@property (nonatomic, strong) UIButton *downButton;
@property (nonatomic, strong) UILabel *upLabel;
@property (nonatomic, strong) UILabel *downLabel;

@end

@implementation DelegateDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.upButton = [[UIButton alloc]init];
    if (1 == _sex) {
        self.upButton.backgroundColor = [UIColor orangeColor];
    }
    else {
        self.upButton.backgroundColor = [UIColor blueColor];
    }
    [self.upButton addTarget:self action:@selector(upButtonAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.upButton];
    [self.upButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-50);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.width.equalTo(@(30));
        make.height.equalTo(@(30));
    }];
    
    self.upLabel = [[UILabel alloc]init];
    self.upLabel.text = @"你是狗";
    self.upLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.upLabel];
    [self.upLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.upButton.left).offset(-10);
        make.centerY.equalTo(self.upButton.mas_centerY);
    }];
    
    self.downButton = [[UIButton alloc]init];
    if (1 == _sex) {
        self.downButton.backgroundColor = [UIColor blueColor];
    }
    else {
        self.downButton.backgroundColor = [UIColor orangeColor];
    }
    [self.downButton addTarget:self action:@selector(downButtonAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.downButton];
    [self.downButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-50);
        make.top.equalTo(self.upButton.mas_bottom).offset(20);
        make.width.equalTo(@(30));
        make.height.equalTo(@(30));
    }];
    
    self.downLabel = [[UILabel alloc]init];
    self.downLabel.text = @"你是猫";
    self.downLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.downLabel];
    [self.downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.downButton.left).offset(-10);
        make.centerY.equalTo(self.downButton.mas_centerY);
    }];
}
- (void)upButtonAction:(UIButton *)sender {
    sender.backgroundColor = [UIColor orangeColor];
    self.downButton.backgroundColor = [UIColor blueColor];
    [_delegate setForwardTitle:@"狗"];
}
- (void)downButtonAction:(UIButton *)sender {
    sender.backgroundColor = [UIColor orangeColor];
    self.upButton.backgroundColor = [UIColor blueColor];
    [_delegate setForwardTitle:@"猫"];
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
