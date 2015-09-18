//
//  VideoHistoryTableViewCell.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/8.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "VideoHistoryTableViewCell.h"

@interface VideoHistoryTableViewCell()
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UIButton *moreButton;

@end

@implementation VideoHistoryTableViewCell

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
    [self addSubview:self.timeLabel];
    [self addSubview:self.typeLabel];
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:17];
        _timeLabel.textColor = kButtonBG;
        _timeLabel.text = @"1923-12-32 12:01:12";
        [self addSubview:_timeLabel];
        
        [_timeLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.centerY.equalTo(self.centerY);
        }];
    }
    return _timeLabel;
}

- (UILabel *)typeLabel
{
    if (!_typeLabel) {
        _typeLabel = [UILabel new];
        _typeLabel.font = [UIFont systemFontOfSize:15];
        _typeLabel.text = @"已完成";
        _typeLabel.textColor = kTextColorCC;
        [self addSubview:_typeLabel];
        
        [_typeLabel makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.centerY.equalTo(self.centerY);
        }];
    }
    return _typeLabel;
}



+ (CGFloat)cellHeightWithObj:(id)obj{
    
    return 44;
    
}


@end
