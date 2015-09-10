//
//  ActionView.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/27.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "ActionView.h"

@interface ActionView()
@property (nonatomic, strong) UIButton *addFriendButton;
@property (nonatomic, strong) UIButton *sendMessageButton;

@end

@implementation ActionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self InitWithSubViews];
    }
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.addFriendButton];
    [self addSubview:self.sendMessageButton];
}


- (UIButton *)addFriendButton
{
    if (!_addFriendButton) {
        _addFriendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addFriendButton.backgroundColor = [UIColor whiteColor];
        _addFriendButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _addFriendButton.layer.cornerRadius = 3;
        _addFriendButton.layer.borderWidth = 1;
        [_addFriendButton setTitle:@"添加好友" forState:UIControlStateNormal];
        [_addFriendButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_addFriendButton addTarget:self action:@selector(addFriendAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_addFriendButton];
        
        [_addFriendButton makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.top.equalTo(self.top).offset(5);
            make.bottom.equalTo(self.bottom).offset(-5);
            make.width.equalTo(@((KDeviceWidth - 30 )/ 2));
        }];
    }
    return _addFriendButton;
}

- (UIButton *)sendMessageButton
{
    if (!_sendMessageButton) {
        _sendMessageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendMessageButton.backgroundColor = [UIColor whiteColor];
        _sendMessageButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _sendMessageButton.layer.cornerRadius = 3;
        _sendMessageButton.layer.borderWidth = 1;
        [_sendMessageButton setTitle:@"发消息" forState:UIControlStateNormal];
        [_sendMessageButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_sendMessageButton addTarget:self action:@selector(sendMessageAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sendMessageButton];
        
        [_sendMessageButton makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.top.equalTo(self.top).offset(5);
            make.bottom.equalTo(self.bottom).offset(-5);
            make.width.equalTo(_addFriendButton.width);
        }];
    }
    return _sendMessageButton;
}

#pragma mark -event response
- (void)addFriendAction
{
    if (self.addFriensBlock) {
        self.addFriensBlock();
    }
}

- (void)sendMessageAction
{
    if (self.sendMessageBlock) {
        self.sendMessageBlock();
    }
}

@end
