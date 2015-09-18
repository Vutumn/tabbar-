//
//  MainInfoTableViewCell.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/27.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "MainInfoTableViewCell.h"

@interface MainInfoTableViewCell()
@property (nonatomic, strong) UIImageView *userImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *idLabel;

@end

@implementation MainInfoTableViewCell

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
    [self addSubview:self.idLabel];
}

- (UIImageView *)userImage
{
    if (!_userImage) {
        _userImage = [UIImageView new];
        _userImage.layer.cornerRadius = 3;
        _userImage.backgroundColor = [UIColor redColor];
        [self addSubview:_userImage];
        
        [_userImage  makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.top.equalTo(self).offset(10);
            make.bottom.equalTo(self).offset(-10);
            make.width.equalTo(_userImage.height);
            make.height.equalTo(_userImage.width);
        }];
    }
    return _userImage;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:13];
        _nameLabel.text = @"李逵";
        [self addSubview:_nameLabel];
        
        [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_userImage.right).offset(10);
            make.top.equalTo(_userImage.top);
        }];
    }
    return _nameLabel;
}

- (UILabel *)idLabel
{
    if (!_idLabel) {
        _idLabel = [UILabel new];
        _idLabel.font = [UIFont systemFontOfSize:13];
        _idLabel.text = @"id:123123123";
        [self addSubview:_idLabel];
        
        [_idLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_nameLabel.left);
            make.bottom.equalTo(_userImage.bottom);
        }];
    }
    return _idLabel;
}

+ (CGFloat)cellHeightWithObj:(id)obj
{
    return 100;
}


@end
