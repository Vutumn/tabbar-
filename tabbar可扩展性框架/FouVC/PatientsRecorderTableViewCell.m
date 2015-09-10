//
//  PatientsRecorderTableViewCell.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/8.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "PatientsRecorderTableViewCell.h"

@interface PatientsRecorderTableViewCell()
@property (nonatomic, strong) UIImageView *userImage;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation PatientsRecorderTableViewCell

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
    [self addSubview:self.titleLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.contentLabel];
}

- (UIImageView *)userImage
{
    if (!_userImage) {
        _userImage = [UIImageView new];
        _userImage.backgroundColor = [UIColor redColor];
        [self addSubview:_userImage];
        
        [_userImage makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.width.height.equalTo(@80);
            make.centerY.equalTo(self.centerY);
        }];
    }
    return _userImage;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.numberOfLines = 1;
        _titleLabel.text = @"但是发生地方时代发生地方时";
        _titleLabel.textColor = UIColorFromRGB(0x404040);
        [self addSubview:_titleLabel];
        
        [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_userImage.right).offset(10);
            make.top.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
        }];
    }
    return _titleLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.text = @"1922-01-01 12:00";
        _timeLabel.textColor = kTextColorCC;
        [self addSubview:_timeLabel];
        
        [_timeLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_userImage.right).offset(10);
            make.top.equalTo(_titleLabel.bottom).offset(10);
        }];
    }
    return _timeLabel;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.numberOfLines = 2;
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.textColor = kTextColorCC;
        _contentLabel.text = @"发生地方时代发生的事地方是多福多寿时代时代福鼎市多少多少多少时代奋斗时代奋斗的对手发动是粉色的";
        [self addSubview:_contentLabel];
        
        [_contentLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_userImage.right).offset(10);
            make.right.equalTo(self).offset(-10);
            make.top.equalTo(_timeLabel.bottom).offset(10);
        }];
    }
    return _contentLabel;
}

+ (CGFloat)cellHeightWithObj:(id)obj
{
    return 100;
}

@end
