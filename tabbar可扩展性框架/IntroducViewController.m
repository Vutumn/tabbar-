//
//  IntroducViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/5.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "IntroducViewController.h"
#import "SystemTabbarViewController.h"

@interface IntroducViewController ()
@property (nonatomic, strong)UIButton *selectButton;

@end

@implementation IntroducViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"补贴助手";
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //当存在navbar时可调用如下方法
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(selectRightAction)];
//    rightButton.title = @"跳过此步骤";
//    self.navigationItem.rightBarButtonItem = rightButton;
    
//    [self performSelector:@selector(selectRightAction) withObject:self afterDelay:2];
    
}


- (void)loadView
{
    [super loadView];
    self.selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectButton.backgroundColor = [UIColor redColor];
    [self.selectButton setTitle:@"跳过此步骤" forState:UIControlStateNormal];
    [self.selectButton addTarget:self action:@selector(selectRightAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.selectButton];
    [self.selectButton makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
}

#pragma mark -private
- (void)selectRightAction
{
 //   [self dismissViewControllerAnimated:YES completion:nil];
    
    

    SystemTabbarViewController *vc = [[SystemTabbarViewController alloc] init];
    //[[app window] setRootViewController:app.systab];
    
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self  presentViewController:vc animated:YES completion:nil];
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
