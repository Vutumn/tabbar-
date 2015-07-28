//
//  MyTabbarViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/24.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//


#import "MyTabbarViewController.h"
#import "ViewController.h"
#import "BaseViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"


@interface MyTabbarViewController ()
@property (nonatomic, strong)UIButton *button;

@end

@implementation MyTabbarViewController
{
    UIView *_bgView;
    UIView *_line;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
      //  _TitleArr = [[NSMutableArray alloc] init];
    }
    return self;
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self tabBarHidden];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _NormalImageArr = [NSArray arrayWithObjects:@"home_icon_grey.png",
                       @"message_icon_grey.png",
                       @"discover_icon_grey.png",
                       @"news_icon_grey.png",
                       @"my_icon_grey.png", nil];
    _SelectImageArr = [NSArray arrayWithObjects:@"home_icon_green.png",
                       @"message_icon_green.png",
                       @"discover_icon_green.png",
                       @"news_icon_hover_green.png",
                       @"my_icon_hover_green.png", nil];
    
    //先来个简单版本的,单纯的把view加上
    [self initWithSubViews];
   // [self setLayoutConstraisnt];
    
    UINavigationController *VC = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc]init]];
    UINavigationController *baseVC = [[UINavigationController alloc] initWithRootViewController:[[BaseViewController alloc] init]];
    UINavigationController *thVC = [[UINavigationController alloc] initWithRootViewController:[[ThirdViewController alloc] init]];
    UINavigationController *fouVC = [[UINavigationController alloc] initWithRootViewController:[[FourthViewController alloc] init]];
    UINavigationController *fifVC = [[UINavigationController alloc] initWithRootViewController:[[FifthViewController alloc] init]];

    self.viewControllers = @[VC, baseVC, thVC, fouVC, fifVC,];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTabbar:) name:SHOW_TAB_BAR object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddenTabbar:) name:HIDDEN_TAB_BAR object:nil];
}

#pragma mark -layout
- (void)initWithSubViews
{
    _bgView = [UIView new];
    _bgView.userInteractionEnabled = YES;
    _bgView.backgroundColor = [UIColor whiteColor];
    _bgView.alpha = 0.9;
    [self.view addSubview:_bgView];
    
    [_bgView makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.equalTo(@49);
    }];
    
    _line = [UIView new];
    _line.backgroundColor = UIColorFromRGB(0xd3d3d3);
    [_bgView addSubview:_line];
    
    
    [_line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_bgView.top);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@.5);
    }];
    
    
    UIButton *lastBtn;

    for (int i = 0; i < _NormalImageArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:_NormalImageArr[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:_SelectImageArr[i]] forState:UIControlStateSelected];
        [btn setTag:i];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:btn];
        
        
        if (lastBtn) {
            [btn makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastBtn.right);
                make.bottom.top.equalTo(_bgView);
                make.width.equalTo(@(KDeviceWidth / _NormalImageArr.count));
            }];
        }
        
        else{
            [btn makeConstraints:^(MASConstraintMaker *make) {
                make.left.top.bottom.equalTo(_bgView);
                make.width.equalTo(@(KDeviceWidth / _NormalImageArr.count));
            }];
        }
        lastBtn = btn;
        
    }
    [lastBtn makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bgView);
    }];
}


#pragma mark -private
- (void)tabBarHidden
{
//    for (UIView *view in self.view.subviews) {
//        if ([view isKindOfClass:[UITabBar class]]) {
//            [view removeFromSuperview];
//        }
//    }
    
    [[self tabBar] setHidden:YES];
}

- (void)btnAction:(UIButton *)sender
{
    [self setSelectedIndex:sender.tag];
}

- (void)hiddenTabbar:(NSNotification *)notification
{
    _bgView.hidden = YES;
}

- (void)showTabbar:(NSNotification *)notification
{
    _bgView.hidden = NO;
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
