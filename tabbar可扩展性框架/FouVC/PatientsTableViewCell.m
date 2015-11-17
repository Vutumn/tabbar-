//
//  PatientsTableViewCell.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/7.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "PatientsTableViewCell.h"

@interface PatientsTableViewCell()
@property (nonatomic, strong) UIImageView *userImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *testButton;

@end

@implementation PatientsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];

        
        [self InitWithSubViews];
    }
    
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.userImage];
    [self addSubview:self.nameLabel];
    [self addSubview:self.switchbutton];
    [self addSubview:self.testButton];
}

- (UIImageView *)userImage
{
    if (!_userImage) {
        _userImage = [UIImageView new];
        _userImage.backgroundColor = [UIColor redColor];
        [self addSubview:_userImage];
        
        [_userImage makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kPaddingLeftWidth10);
            make.centerY.equalTo(self.centerY);
            make.width.height.equalTo(@36);
        }];
    }
    return _userImage;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:17];
        _nameLabel.text = @"测试";
        [self addSubview:_nameLabel];
        
        [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_userImage.right).offset(kPaddingLeftWidth10);
            make.centerY.equalTo(self.centerY);
        }];
    }
    return _nameLabel;
}

- (UISwitch *)switchbutton
{
    if (!_switchbutton) {
        _switchbutton = [UISwitch new];
        [_switchbutton setOn:YES];
        _switchbutton.hidden = YES;
        [self addSubview:_switchbutton];
        
        [_switchbutton makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.centerY.equalTo(self.centerY);
        }];
    }
    return _switchbutton;
}

- (UIButton *)testButton
{
    if (!_testButton) {
        _testButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _testButton.backgroundColor = [UIColor redColor];
        [_testButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_testButton];
        
        [_testButton makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.centerY.equalTo(self.centerY);
            make.width.height.equalTo(@30);
        }];
    }
    return _testButton;
}

- (void)buttonAction
{
    
}

#pragma mark -Height
+ (CGFloat)cellHeightWithObj:(id)obj{
    
    return 56;
    
}

@end
