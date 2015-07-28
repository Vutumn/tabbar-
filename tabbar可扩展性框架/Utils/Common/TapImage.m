//
//  TapImage.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/27.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "TapImage.h"

@interface TapImage()
@property(nonatomic, strong)UIImageView *imageView;
@property(nonatomic, strong)UIImageView *fullImageView;
@property(nonatomic, assign)CGRect originFrame;

@end

@implementation TapImage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (void)tapActionWithImageView
{
   // self.imageView = imageview;
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tap];
}

- (void)tap:(UITapGestureRecognizer *)sender
{
    _originFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    _fullImageView = [UIImageView new];
    _fullImageView.backgroundColor = [UIColor blackColor];
    _fullImageView.userInteractionEnabled = YES;
    _fullImageView.contentMode = UIViewContentModeScaleAspectFit;

    
    UITapGestureRecognizer *backToOrigin = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back:)];
    [_fullImageView addGestureRecognizer:backToOrigin];
    
    
    UITapGestureRecognizer *doubleHandTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleHandTap:)];
    doubleHandTap.numberOfTapsRequired = 2;
    [_fullImageView addGestureRecognizer:doubleHandTap];
    
    if (![_fullImageView superview]) {
        _fullImageView.image = self.image;
        [self.window addSubview:_fullImageView];
        _fullImageView.frame = _originFrame;
        
        [UIView animateWithDuration:0.2 animations:^{
            _fullImageView.frame = CGRectMake(0, 0, KDeviceWidth, KDeviceHeight);
        } completion:^(BOOL finished) {
            [[UIApplication sharedApplication] setStatusBarHidden:YES];
        }];
    }
}

- (void)back:(UITapGestureRecognizer *)sender
{
    [UIView animateWithDuration:0.2 animations:^{
        
        _fullImageView.frame = _originFrame;
        
        
    } completion:^(BOOL finished) {
        
        [_fullImageView removeFromSuperview];
        
        
    }];
    
    [UIApplication sharedApplication].statusBarHidden=NO;

}

//双击放大，用scrollview做
- (void)doubleHandTap:(UITapGestureRecognizer *)sender
{
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
