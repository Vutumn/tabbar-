//
//  BlockViewController.m
//  tabbar可扩展性框架
//
//  Created by 刘旭 on 15/8/20.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "BlockViewController.h"
#import "BlockDetailViewController.h"
@interface BlockViewController ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.button = [UIButton new];
    self.button.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.button setTitle:@"狗" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(@(100));
        make.height.equalTo(@(100));
    }];
}
- (void)buttonAction:(UIButton *)sender {
    BlockDetailViewController *vc = [[BlockDetailViewController alloc]init];
    if ([sender.titleLabel.text isEqualToString:@"狗"]) {
        vc.sex = 1;
    }
    else {
        vc.sex = 2;
    }

    vc.block = ^(NSString *title) {
        [self.button setTitle:title forState:UIControlStateNormal];
    };
    [self.navigationController pushViewController:vc animated:YES];
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
