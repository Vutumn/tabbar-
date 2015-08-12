//
//  UIView+Common.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/12.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "UIView+Common.h"
#import <objc/runtime.h>

@implementation UIView (Common)
static char blankViewKey;

- (void)setBlankView:(BlankView *)blankView
{
    //kvo监听
    [self willChangeValueForKey:@"blankViewKey"];
    objc_setAssociatedObject(self, &blankViewKey, blankView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"blankViewKey"];
}

- (BlankView *)blankView
{
    return objc_getAssociatedObject(self, &blankViewKey);
}

- (void)hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block
{
    if (hasData) {
        if (self.blankView) {
            self.blankView.hidden = YES;
            [self.blankView removeFromSuperview];
        }
    }else{
        if ((!self.blankView)) {
            self.blankView = [[BlankView alloc] initWithFrame:self.bounds];
        }
        self.blankView.hidden = NO;
        
        [self.blankPageContainer addSubview:self.blankView];
        
        [self.blankView hasData:hasData hasError:hasError reloadButtonBlock:block];
    }
}

- (UIView *)blankPageContainer{
    UIView *blankPageContainer = self;
    for (UIView *aView in [self subviews]) {
        if ([aView isKindOfClass:[UITableView class]]) {
            blankPageContainer = aView;
        }
    }
    return blankPageContainer;
}

@end


@implementation BlankView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block
{
    if (hasData) {
        [self removeFromSuperview];
    }
    
    self.alpha = 1.0;
    
    if (!_tipLabel) {
        _tipLabel = [UILabel new];
        _tipLabel.numberOfLines = 0;
        _tipLabel.font = [UIFont systemFontOfSize:15];
        _tipLabel.text = @"无网请点击屏幕试试";
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_tipLabel];
        
        [_tipLabel makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
    }
    
    _reloadButtonBlock = nil;
    
    if (!_reloadButton) {
        _reloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_reloadButton addTarget:self action:@selector(reloadButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_reloadButton];
        
        [_reloadButton makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    
    _reloadButtonBlock = block;
    
}

- (void)reloadButtonClick:(UIButton *)sender
{
    self.hidden = YES;
    [self removeFromSuperview];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_reloadButtonBlock) {
            _reloadButtonBlock(sender);
        }
    });
}

@end