//
//  PicEnlargeViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/27.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "PicEnlargeViewController.h"
#import "ImageViewController.h"
#import "TapImageView.h"

@interface PicEnlargeViewController ()<TapImageDelegate>

@end

@implementation PicEnlargeViewController
{
    TapImageView *_tapImage;
    TapImageView *_tapImage1;
    ImageViewController *_vc;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"点击图片放大demo";
        self.view.backgroundColor = [UIColor whiteColor];
     
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   // [[NSNotificationCenter defaultCenter] postNotificationName:HIDDEN_TAB_BAR object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    
}

#pragma mark -UI
- (void)loadView
{
    [super loadView];
    
    _tapImage = [TapImageView new];
    _tapImage.delegate = self;
    _tapImage.tag = 0;
    _tapImage.image = [UIImage imageNamed:@"photo3.jpg"];
    _tapImage.userInteractionEnabled = YES;
//    
//    UITapGestureRecognizer *singleHand = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleHand:)];
//    [_tapImage addGestureRecognizer:singleHand];
    [self.view addSubview:_tapImage];
//    
    [_tapImage makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.and.height.equalTo(@100);
    }];
    
    _tapImage1 = [TapImageView new];
    _tapImage1.delegate = self;
    _tapImage1.tag = 1;
    _tapImage1.image = [UIImage imageNamed:@"photo6.jpg"];
    _tapImage1.userInteractionEnabled = YES;
    [self.view addSubview:_tapImage1];
    [_tapImage1 makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view).offset(120);
        make.width.and.height.equalTo(@100);
    }];
    
 
}


#pragma mark -private

- (void)tapImage:(id)sender
{
    TapImageView *tapimage = (TapImageView *)sender;
    NSMutableArray *imageArr = [NSMutableArray array];
    for (UIView *view in tapimage.superview.subviews) {
        if ([view isKindOfClass:[TapImageView class]]) {
            [imageArr addObject:[(TapImageView *)view image]];
        }
    }
    _vc = [[ImageViewController alloc] init];
    _vc.currentIndex = tapimage.tag;
    _vc.imageArr = imageArr;
    [self presentViewController:_vc animated:YES completion:nil];

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
