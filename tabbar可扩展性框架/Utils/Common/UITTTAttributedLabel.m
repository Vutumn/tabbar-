//
//  UITTTAttributedLabel.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/11.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "UITTTAttributedLabel.h"

@interface UITTTAttributedLabel()
@property (nonatomic, assign) BOOL isSelectedMenu;
@property (nonatomic, copy) UITTTLabelTapBlock tapBlock;
@property (nonatomic, copy) UITTTLabelTapBlock deletrBlock;
@property (nonatomic, copy) UIColor *copyingColor;

@end

@implementation UITTTAttributedLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _deletrBlock = nil;
        self.copyingColor = [UIColor colorWithHexString:@"0xc0c1c2"];
    }
    return self;
}

- (void)addTapBlock:(UITTTLabelTapBlock)block
{
    _tapBlock = block;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:tap];
}

- (void)addDeleteBlock:(UITTTLabelTapBlock)block
{
    _deletrBlock = block;
}

- (void)handleTap:(UIGestureRecognizer *)recognizer
{
    if (_tapBlock) {
        _tapBlock(self);
    }
}

- (void)addLongPressForCopy
{
    _isSelectedMenu = NO;
    UILongPressGestureRecognizer *press = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handlePress:)];
    [self addGestureRecognizer:press];
}

- (void)addLongPressForCopyWithBGColor:(UIColor *)color
{
    self.copyingColor = color;
    [self addLongPressForCopy];
}

- (void)handlepress:(UIGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        if (!_isSelectedMenu) {
            _isSelectedMenu = YES;
        }
        
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
