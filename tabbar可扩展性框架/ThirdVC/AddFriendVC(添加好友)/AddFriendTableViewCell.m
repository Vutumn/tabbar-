//
//  AddFriendTableViewCell.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/27.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "AddFriendTableViewCell.h"

@interface AddFriendTableViewCell()
@property (nonatomic, strong) UIImageView *userImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *selectedImage;

@end

@implementation AddFriendTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self InitWithSubViews];
    }
    return self;
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self addSubview:self.userImage];
    [self addSubview:self.nameLabel];
    [self addSubview:self.selectedImage];
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
            make.centerY.equalTo(self.centerY);
            make.width.height.equalTo(@40);
        }];
    }
    return _userImage;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.text = @"德罗约翰";
        _nameLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_nameLabel];
        
        [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_userImage.right).offset(5);
            make.centerY.equalTo(self.centerY);
        }];
    }
    return _nameLabel;
}

- (UIImageView *)selectedImage
{
    if (!_selectedImage) {
        _selectedImage = [UIImageView new];
        _selectedImage.backgroundColor = [UIColor redColor];
        [self addSubview:_selectedImage];
        
        [_selectedImage makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-20);
            make.height.width.equalTo(@30);
            make.centerY.equalTo(self.centerY);
        }];
    }
    return _selectedImage;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_selectedImage doCircleFrame];
}


+ (CGFloat)cellHeightWithObj:(id)obj
{
    return 57;
}



@end
