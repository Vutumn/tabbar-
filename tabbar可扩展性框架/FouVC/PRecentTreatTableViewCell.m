//
//  PRecentTreatTableViewCell.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/9.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "PRecentTreatTableViewCell.h"

@interface PRecentTreatTableViewCell()
@property (nonatomic, strong) UIView *groupView1;
@property (nonatomic, strong) UIView *groupView2;
@property (nonatomic, strong) UIView *groupView3;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UIView *lineView1;
@property (nonatomic, strong) UIView *lineView2;
@property (nonatomic, strong) UIImageView *userImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *sexLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *descripLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIButton *startVideo;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *bottomView;

@end

@implementation PRecentTreatTableViewCell

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
    [self addSubview:self.topView];
    [self addSubview:self.bottomView];
    [self addSubview:self.groupView1];
    [self addSubview:self.lineView1];
    [self addSubview:self.groupView2];
    [self addSubview:self.lineView2];
    [self addSubview:self.timeLabel];
    [self addSubview:self.typeLabel];
    [self addSubview:self.userImage];
    [self addSubview:self.groupView3];
    [self addSubview:self.nameLabel];
    [self addSubview:self.sexLabel];
    [self addSubview:self.ageLabel];
    [self addSubview:self.descripLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.startVideo];
}

- (UIView *)topView
{
    if (!_topView) {
        _topView = [UIView new];
        _topView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_topView];
        
        [_topView makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.equalTo(@140);
        }];
    }
    return _topView;
}

- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = kSectionHeaderBgColor;
        [self addSubview:_bottomView];
        
        [_bottomView makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(_topView.bottom);
            make.height.equalTo(@10);
        }];
    }
    return _bottomView;
}

- (UIView *)groupView1
{
    if (!_groupView1) {
        _groupView1 = [UIView new];
        [self addSubview:_groupView1];
        
        [_groupView1 makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self);
            make.height.equalTo(@35);
        }];
    }
    return _groupView1;
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
            make.height.equalTo(@1);
            make.top.equalTo(_groupView1.bottom);
        }];
    }
    return _lineView1;
}

- (UIView *)groupView2
{
    if (!_groupView2) {
        _groupView2 = [UIView new];
        [self addSubview:_groupView2];
        
        [_groupView2 makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(_lineView1.bottom);
            make.height.equalTo(@70);
        }];
    }
    return _groupView2;
}

- (UIView *)lineView2
{
    if (!_lineView2) {
        _lineView2 = [UIView new];
        _lineView2.backgroundColor = kSeperatorColor;
        [self addSubview:_lineView2];
        
        [_lineView2 makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
            make.height.equalTo(@1);
            make.top.equalTo(_groupView2.bottom);
        }];
    }
    return _lineView2;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.text = @"视频时间:2013-08-21 18:30-19:00";
        _timeLabel.textColor = kTextColor9a;
        [self addSubview:_timeLabel];
        
        [_timeLabel makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_groupView1.centerY);
            make.left.equalTo(_groupView1).offset(10);
        }];
    }
    return _timeLabel;
}

- (UILabel *)typeLabel
{
    if (!_typeLabel) {
        _typeLabel = [UILabel new];
        _typeLabel.text = @"待视频";
        _typeLabel.font = [UIFont systemFontOfSize:13];
        _typeLabel.textColor = kTextColor49;
        [self addSubview:_typeLabel];
        
        [_typeLabel makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_groupView1).offset(-10);
            make.centerY.equalTo(_timeLabel.centerY);
        }];
    }
    return _timeLabel;
}

- (UIImageView *)userImage
{
    if (!_userImage) {
        _userImage = [UIImageView new];
        _userImage.backgroundColor = [UIColor redColor];
        _userImage.layer.cornerRadius = 3;
        [self addSubview:_userImage];
        
        [_userImage makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_groupView2.centerY);
            make.left.equalTo(_groupView2).offset(10);
            make.width.height.equalTo(@50);
        }];
        
    }
    return _userImage;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.text = @"张成(c行气门诊，为恶言)";
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.backgroundColor = kTextColora7;
        [self addSubview:_nameLabel];
        
        [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_userImage.right).offset(10);
            make.top.equalTo(_groupView2.top).offset(14);
        }];
    }
    return _nameLabel;
}

- (UILabel *)sexLabel
{
    if (!_sexLabel) {
        _sexLabel = [UILabel new];
        _sexLabel.text = @"男";
        _sexLabel.font = [UIFont systemFontOfSize:12];
        _sexLabel.textColor = kTextColor9a;
        [self addSubview:_sexLabel];
        
        [_sexLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_nameLabel.right).offset(3);
            make.bottom.equalTo(_nameLabel.bottom);
        }];
    }
    return _sexLabel;
}

- (UILabel *)ageLabel
{
    if (!_ageLabel) {
        _ageLabel = [UILabel new];
        _ageLabel.text = @"12岁";
        _ageLabel.font = [UIFont systemFontOfSize:12];
        _ageLabel.textColor = kTextColor9a;
        [self addSubview:_ageLabel];
        
        [_ageLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_sexLabel.right).offset(3);
            make.bottom.equalTo(_nameLabel.bottom);
        }];
    }
    return _ageLabel;
}

//- (UILabel *)sexLabel
//{
//    if (!_sexLabel) {
//        _sexLabel = [UILabel new];
//        _sexLabel.font = [UIFont systemFontOfSize:<#(CGFloat)#>]
//    }
//}

- (UILabel *)descripLabel
{
    if (!_descripLabel) {
        _descripLabel = [UILabel new];
        _descripLabel.numberOfLines = 1;
        _descripLabel.text = @"最大的室内空间的时刻贾夫纳市看能否都开始减肥可能的框架啊姑娘开始";
        _descripLabel.font = [UIFont systemFontOfSize:12];
        _descripLabel.textColor =  kTextColord4;
        [self addSubview:_descripLabel];
        
        [_descripLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_userImage.right).offset(10);
            make.bottom.equalTo(_groupView2.bottom).offset(-14);
            make.right.equalTo(_groupView2).offset(-10);
        }];
    }
    return _descripLabel;
}

- (UIView *)groupView3
{
    if (!_groupView3) {
        _groupView3 = [UIView new];
        [self addSubview:_groupView3];
        
        [_groupView3 makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.height.equalTo(@35);
            make.top.equalTo(_lineView2.bottom);
        }];
    }
    return _groupView3;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = [UIFont systemFontOfSize:13];
        _priceLabel.text = @"时长:30分钟(200元)";
        _priceLabel.textColor = kTextColor9a;
        [self addSubview:_priceLabel];
        
        [_priceLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_groupView3).offset(10);
            make.centerY.equalTo(_groupView3.centerY);
        }];
    }
    return _priceLabel;
}

- (UIButton *)startVideo
{
    if (!_startVideo) {
        _startVideo = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startVideo setTitle:@"开始视频" forState:UIControlStateNormal];
        _startVideo.titleLabel.font = [UIFont systemFontOfSize:12];
        [_startVideo setTitleColor:kButtonBG forState:UIControlStateNormal];
        [_startVideo setBackgroundImage:nil forState:UIControlStateNormal];
        [self addSubview:_startVideo];
        
        [_startVideo makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_groupView3).offset(-10);
            make.centerY.equalTo(_groupView3.centerY);
        }];
    }
    return _startVideo;
}


@end
