//
//  HitTestViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/10.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "HitTestViewController.h"
#import "HTestView.h"
#import "HTestViewB.h"

@interface HitTestViewController()<HTestViewBDelegate>
@property (nonatomic, strong)UIButton *button;
@property (nonatomic, strong)HTestView *tapView;

@end

@implementation HitTestViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"响应链";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tapView = [[HTestView alloc]initWithFrame:self.view.bounds];
    self.tapView.delegate = self;
    self.tapView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:self.tapView];
    
//    [_tapView makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
    
    NSLog(@"%@", _tapView.nextResponder);
    NSLog(@"%@", _tapView.nextResponder.nextResponder);
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSLog(@"%@",_tapView.nextResponder.nextResponder.nextResponder.nextResponder.nextResponder.nextResponder);
    });
    
}

- (void)HTestViewBMethod {
    NSLog(@"B");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
}


@end
