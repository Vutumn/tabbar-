//
//  CircleTableViewCell.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/25.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "CircleTableViewCell.h"

@interface CircleTableViewCell()
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *iconImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *userImage;
@property (nonatomic, strong) UILabel *circleName;
@property (nonatomic, strong) UILabel *commentNum;

@end

@implementation CircleTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]
    ;
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
    [self addSubview:self.iconImage];
    [self addSubview:self.contentLabel];
    [self addSubview:self.circleName];
    [self addSubview:self.commentNum];
    [self addSubview:self.nameLabel];
    [self addSubview:self.userImage];
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.numberOfLines = 2;
        _contentLabel.font = [UIFont systemFontOfSize:13];
        _contentLabel.text = @"如果福鼎市妇女科技看电视看见的";
        [self addSubview:_contentLabel];
        
        [_contentLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_iconImage.right).offset(10);
            make.top.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
        }];
        
    }
    return _contentLabel;
}

- (UIImageView *)iconImage
{
    if (!_iconImage) {
        _iconImage = [UIImageView new];
        _iconImage.layer.cornerRadius = 3;
        _iconImage.backgroundColor = [UIColor redColor];
        [self addSubview:_iconImage];
        
        [_iconImage makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self).offset(10);
            make.bottom.equalTo(self).offset(-10);
            make.width.equalTo(_iconImage.height);
        }];
    }
    return _iconImage;
}

- (UILabel *)circleName
{
    if (!_circleName) {
        _circleName = [UILabel new];
        _circleName.text = @" 北大圈子里 ";
        _circleName.backgroundColor = [UIColor greenColor];
        _circleName.font = [UIFont systemFontOfSize:13];
        _circleName.textColor = [UIColor whiteColor];
        [self addSubview:_circleName];
        
        [_circleName makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_iconImage.right).offset(10);
            make.bottom.equalTo(self).offset(-10);
        }];
    }
    return _circleName;
}

- (UILabel *)commentNum
{
    if (!_commentNum) {
        _commentNum = [UILabel new];
        _commentNum.text = @"8回复";
        _commentNum.font = [UIFont systemFontOfSize:13];
        [self addSubview:_commentNum];
        
        [_commentNum makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_circleName.right).offset(10);
            make.bottom.equalTo(self).offset(-10);
        }];

    }
    return _commentNum;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:13];
        _nameLabel.text = @"蓉儿";
        [self addSubview:_nameLabel];
        
        [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(self).offset(-10);
        }];
    }
    return _nameLabel;
}

- (UIImageView *)userImage
{
    if (!_userImage) {
        _userImage = [UIImageView new];
        _userImage.backgroundColor = [UIColor redColor];
        [self addSubview:_userImage];
        
        [_userImage makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_nameLabel.left).offset(-4);
            make.centerY.equalTo(_nameLabel.centerY);
            make.width.height.equalTo(@20);
        }];

    }
    return _userImage;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_userImage doCircleFrame];
    
}

+ (CGFloat)cellHeightWithObj:(id)obj{

    return 80;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
