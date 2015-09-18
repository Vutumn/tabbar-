
//
//  OtherInfoTableViewCell.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/27.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "OtherInfoTableViewCell.h"

@interface OtherInfoTableViewCell()
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;

@end

@implementation OtherInfoTableViewCell

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
    [self addSubview:self.leftLabel];
    [self addSubview:self.rightLabel];
}

- (UILabel *)leftLabel
{
    if (!_leftLabel) {
        _leftLabel = [UILabel new];
        _leftLabel.text = @"所在医院";
        _leftLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_leftLabel];
        
        [_leftLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.centerY.equalTo(self.centerY);
        }];
    }
    return _leftLabel;
}

- (UILabel *)rightLabel
{
    if (!_rightLabel) {
        _rightLabel = [UILabel new];
        _rightLabel.text = @"背景协和医院";
        _rightLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_rightLabel];
        
        [_rightLabel makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.centerY.equalTo(self.centerY);
        }];
    }
    return _rightLabel;
}

+ (CGFloat)cellHeightWithObj:(id)obj
{
    return 40;
}



@end
