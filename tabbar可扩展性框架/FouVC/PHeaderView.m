//
//  PHeaderView.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/8.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "PHeaderView.h"

@interface PHeaderView()
@property (nonatomic, strong) UIImageView *userImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *sexLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *sendMsgButton;
@property (nonatomic, strong) UIButton *videoButton;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *remarkLabel;
@property (nonatomic, strong) UIView *lineView1;
@property (nonatomic, strong) UIButton *remarkButton;

@end

@implementation PHeaderView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self InitWithSubViews];
    }
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.lineView];
    [self addSubview:self.userImage];
    [self addSubview:self.nameLabel];
    [self addSubview:self.sexLabel];
    [self addSubview:self.ageLabel];
    [self addSubview:self.sendMsgButton];
    [self addSubview:self.videoButton];
    [self addSubview:self.bgView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.remarkLabel];
    [self addSubview:self.lineView1];
    [self addSubview:self.remarkButton];
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = kSeperatorColor;
        [self addSubview:_lineView];
        
        [_lineView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
            make.top.equalTo(self).offset(70);
            make.height.equalTo(@1);
        }];
    }
    return _lineView;
}

- (UIImageView *)userImage
{
    if (!_userImage) {
        _userImage = [UIImageView new];
        _userImage.layer.cornerRadius = 3;
        _userImage.backgroundColor = [UIColor redColor];
        [self addSubview:_userImage];
        
        [_userImage makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.width.height.equalTo(@50);
            make.top.equalTo(self).offset(10);
        }];
    }
    return _userImage;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.text = @"发生的";
        _nameLabel.textColor = UIColorFromRGB(0x5477a7);
        [self addSubview:_nameLabel];
        
        [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_userImage.right).offset(10);
            make.top.equalTo(self).offset(15);
        }];
    }
    return _nameLabel;
}

- (UILabel *)sexLabel
{
    if (!_sexLabel) {
        _sexLabel = [UILabel new];
        _sexLabel.font = [UIFont systemFontOfSize:12];
        _sexLabel.text = @"男";
        _sexLabel.textColor = UIColorFromRGB(0xb9c4d4);
        [self addSubview:_sexLabel];
        
        [_sexLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_userImage.right).offset(10);
            make.bottom.equalTo(_lineView).offset(-12.5);
        }];
    }
    return _sexLabel;
}

- (UILabel *)ageLabel
{
    if (!_ageLabel) {
        _ageLabel = [UILabel new];
        _ageLabel.font = [UIFont systemFontOfSize:12];
        _ageLabel.text = @"12";
        _ageLabel.textColor = UIColorFromRGB(0xb9c4d4);
        [self addSubview:_ageLabel];
        
        [_ageLabel makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_sexLabel);
            make.left.equalTo(_sexLabel.right).offset(3);
        }];
    }
    return _ageLabel;
}

- (UIButton *)sendMsgButton
{
    if (!_sendMsgButton) {
        _sendMsgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendMsgButton.backgroundColor = kButtonBG;
        [_sendMsgButton setTitle:@"发消息" forState:UIControlStateNormal];
        _sendMsgButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        _sendMsgButton.layer.cornerRadius = 3;
        [self addSubview:_sendMsgButton];
        
        [_sendMsgButton makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
            make.top.equalTo(_lineView.bottom).offset(12);
            make.height.equalTo(@40);
        }];
    }
    return _sendMsgButton;
}

- (UIButton *)videoButton
{
    if (!_videoButton) {
        _videoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _videoButton.backgroundColor = kButtonBG;
        [_videoButton setTitle:@"邀请视频" forState:UIControlStateNormal];
        _videoButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        _videoButton.layer.cornerRadius = 3;
        [self addSubview:_videoButton];
        
        [_videoButton makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_sendMsgButton.bottom).offset(12);
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
            make.height.equalTo(@40);
        }];
    }
    return _videoButton;
}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = kGrayBG;
        [self addSubview:_bgView];
        
        [_bgView makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(_videoButton.bottom).offset(12);
            make.height.equalTo(@25);
        }];
    }
    return _bgView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"我的备注";
        _titleLabel.textColor = KTextColor80;
        [self addSubview:_titleLabel];
        
        [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_bgView).offset(10);
            make.centerY.equalTo(_bgView.centerY);
        }];
    }
    return _titleLabel;
}

- (UILabel *)remarkLabel
{
    if (!_remarkLabel) {
        _remarkLabel = [UILabel new];
        _remarkLabel.font = [UIFont systemFontOfSize:15];
        _remarkLabel.textColor = kTextColor93;
        _remarkLabel.numberOfLines = 0;
        _remarkLabel.text = @"阿短发短发发呆发呆发呆发呆发发呆发呆发呆发呆复古风回复";
        [self addSubview:_remarkLabel];
        
        [_remarkLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.top.equalTo(_bgView.bottom).offset(14);
            make.right.equalTo(self).offset(-10);
        }];
    }
    return _remarkLabel;
}

- (UIView *)lineView1
{
    if (!_lineView1) {
        _lineView1 = [UIView new];
        _lineView1.backgroundColor = kSeperatorColor;
        [self addSubview:_lineView1];
        
        [_lineView1 makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
            make.top.equalTo(_remarkLabel.bottom).offset(14);
            make.height.equalTo(@1);
        }];
    }
    return _lineView1;
}

- (UIButton *)remarkButton
{
    if (!_remarkButton) {
        _remarkButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _remarkButton.backgroundColor = klightButtonBG;
        [_remarkButton setTitle:@"编辑备注" forState:UIControlStateNormal];
        _remarkButton.layer.cornerRadius = 3;
        _remarkButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_remarkButton addTarget:self action:@selector(remarkButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_remarkButton];
        
        [_remarkButton makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
            make.top.equalTo(_lineView1.bottom).offset(12);
            make.height.equalTo(@40);
        }];
    }
    return _remarkButton;
}

- (void)remarkButtonAction
{
    if (self.remarkActionBlock) {
        self.remarkActionBlock();
    }
}

@end
