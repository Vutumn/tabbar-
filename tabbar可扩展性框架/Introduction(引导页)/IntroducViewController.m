//
//  IntroducViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/5.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "IntroducViewController.h"
#import <NYXImagesKit/NYXImagesKit.h>
#import "LoginViewController.h"
#import <SMPageControl.h>

@interface IntroducViewController ()
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) NSMutableDictionary *iconsDict, *tipsDict;
@property (nonatomic, assign) NSUInteger numberOfPages;
@property (nonatomic, strong) SMPageControl *pageControl;

@end

@implementation IntroducViewController

#pragma mark -life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.numberOfPages = 3;
        _iconsDict = [@{
                        @"0_image" : @"intro_icon_6",
                        @"1_image" : @"intro_icon_0",
                        @"2_image" : @"intro_icon_1",
                        @"3_image" : @"intro_icon_2",
                        @"4_image" : @"intro_icon_3",
                        @"5_image" : @"intro_icon_4",
                        @"6_image" : @"intro_icon_5",
                        } mutableCopy];
        _tipsDict = [@{
                       @"1_image" : @"intro_tip_0",
                       @"2_image" : @"intro_tip_1",
                       @"3_image" : @"intro_tip_2",
                       @"4_image" : @"intro_tip_3",
                       @"5_image" : @"intro_tip_4",
                       @"6_image" : @"intro_tip_5",
                       } mutableCopy];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    
    [self InitWithSubViews];
    //当存在navbar时可调用如下方法
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(selectRightAction)];
//    rightButton.title = @"跳过此步骤";
//    self.navigationItem.rightBarButtonItem = rightButton;
    
//    [self performSelector:@selector(selectRightAction) withObject:self afterDelay:2];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"first" forKey:@""];
    
   
}


- (NSString *)imageKeyForIndex:(NSInteger)index{
    return [NSString stringWithFormat:@"%ld_image", (long)index];
}

- (NSString *)viewKeyForIndex:(NSInteger)index{
    return [NSString stringWithFormat:@"%ld_view", (
                                                    long)index];
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self.view addSubview:self.nextButton];
    [self.view addSubview:self.pageControl];
    [self configureViews];
    [self configureAnimations];
}

- (UIButton *)nextButton
{
    if (!_nextButton) {
        UIColor *darkColor = [UIColor colorWithHexString:@"0x28303b"];
        _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextButton.frame = CGRectZero;
        _nextButton.backgroundColor = darkColor;
        [_nextButton setTitle:@" 开启您的健康生活 " forState:UIControlStateNormal];
        _nextButton.alpha = 0;
        _nextButton.layer.cornerRadius = 7;
        _nextButton.layer.borderWidth = 1;
        _nextButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [_nextButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_nextButton];
        
        [_nextButton makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.centerX);
            make.bottom.equalTo(self.view.bottom).offset(-30);
        }];
    }
    return _nextButton;
}

- (SMPageControl *)pageControl
{
    if (!_pageControl) {
        UIImage *pageIndicatorImage = [UIImage imageNamed:@"intro_dot_unselected"];
        UIImage *currentPageIndicatorImage = [UIImage imageNamed:@"intro_dot_selected"];
        
        if (!kDevice_Is_iPhone6 && !kDevice_Is_iPhone6Plus) {
            CGFloat desginWidth = 375.0;//iPhone6 的设计尺寸
            CGFloat scaleFactor = KDeviceWidth/desginWidth;
            pageIndicatorImage = [pageIndicatorImage scaleByFactor:scaleFactor];
            currentPageIndicatorImage = [currentPageIndicatorImage scaleByFactor:scaleFactor];
        }
        
        _pageControl = [SMPageControl new];
        _pageControl.numberOfPages = self.numberOfPages;
        _pageControl.userInteractionEnabled = NO;
        _pageControl.pageIndicatorImage = pageIndicatorImage;
        _pageControl.currentPageIndicatorImage = currentPageIndicatorImage;
        _pageControl.currentPage = 0;
        [_pageControl sizeToFit];
        [self.view addSubview:self.pageControl];
        
        [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(KDeviceWidth, kScaleFrom_iPhone5_Desgin(20)));
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.nextButton.mas_top).offset(-kScaleFrom_iPhone5_Desgin(10));
        }];
    }
    return _pageControl;
}

- (void)configureViews
{
    CGFloat scaleFactor = 1.0;
    CGFloat desginHeight = 667.0;//iPhone6 的设计尺寸
    if (!kDevice_Is_iPhone6 && !kDevice_Is_iPhone6Plus) {
        scaleFactor = KDeviceHeight/desginHeight;
    }
    
    for (int i = 0; i < self.numberOfPages; i++) {
        NSString *imageKey = [self imageKeyForIndex:i];
        NSString *viewKey = [self viewKeyForIndex:i];
        NSString *iconImageName = [self.iconsDict objectForKey:imageKey];
        NSString *tipImageName = [self.tipsDict objectForKey:imageKey];
        
        if (iconImageName) {
            UIImage *iconImage = [UIImage imageNamed:iconImageName];
            if (iconImage) {
                iconImage = scaleFactor != 1.0? [iconImage scaleByFactor:scaleFactor] : iconImage;
                UIImageView *iconView = [[UIImageView alloc] initWithImage:iconImage];
                [self.contentView addSubview:iconView];
                [self.iconsDict setObject:iconView forKey:viewKey];
            }
        }
        
        if (tipImageName) {
            UIImage *tipImage = [UIImage imageNamed:tipImageName];
            if (tipImage) {
                tipImage = scaleFactor != 1.0? [tipImage scaleByFactor:scaleFactor]: tipImage;
                UIImageView *tipView = [[UIImageView alloc] initWithImage:tipImage];
                [self.contentView addSubview:tipView];
                [self.tipsDict setObject:tipView forKey:viewKey];
            }
        }
    }
}

- (void)configureAnimations
{
    [self configureTipAndTitleViewAnimations];
}

- (void)configureTipAndTitleViewAnimations
{
    for (int index = 0; index < self.numberOfPages; index++) {
        NSString *viewKey = [self viewKeyForIndex:index];
        UIView *iconView = [self.iconsDict objectForKey:viewKey];
        UIView *tipView = [self.tipsDict objectForKey:viewKey];
        if (iconView) {
            if (index == 0) {
                [self keepView:iconView onPages:@[@(index +1), @(index)] atTimes:@[@(index - 1), @(index)]];
                
                [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(KDeviceHeight/7);
                }];
            }else{
                [self keepView:iconView onPage:index];
                
                [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.mas_equalTo(-KDeviceHeight/6);
                }];
            }
            IFTTTAlphaAnimation *iconAlphaAnimation = [IFTTTAlphaAnimation animationWithView:iconView];
            [iconAlphaAnimation addKeyframeForTime:index -0.5 alpha:0.f];
            [iconAlphaAnimation addKeyframeForTime:index alpha:1.f];
            [iconAlphaAnimation addKeyframeForTime:index +0.5 alpha:0.f];
            [self.animator addAnimation:iconAlphaAnimation];
        }
        if (tipView) {
            [self keepView:tipView onPages:@[@(index +1), @(index), @(index-1)] atTimes:@[@(index - 1), @(index), @(index +1)]];
            
            IFTTTAlphaAnimation *tipAlphaAnimation = [IFTTTAlphaAnimation animationWithView:tipView];
            [tipAlphaAnimation addKeyframeForTime:index -0.5 alpha:0.f];
            [tipAlphaAnimation addKeyframeForTime:index alpha:1.f];
            [tipAlphaAnimation addKeyframeForTime:index +0.5 alpha:0.f];
            [self.animator addAnimation:tipAlphaAnimation];
            
            [tipView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(iconView.mas_bottom).offset(kScaleFrom_iPhone5_Desgin(45));
            }];
        }
    }
}

#pragma mark -super
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self animateCurrentFrame];
    NSInteger nearestPage = floorf(self.pageOffset + 0.5);
    self.pageControl.currentPage = nearestPage;
    if (scrollView == self.scrollView && self.scrollView.contentOffset.x / KDeviceWidth == 2) {
        [UIView animateWithDuration:0.5 animations:^{
            _nextButton.alpha = 1;
        }];
    }
  
    
}

#pragma mark -event response
- (void)nextAction:(UIButton *)sender
{
    LoginViewController *vc = [[LoginViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark -private method



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
