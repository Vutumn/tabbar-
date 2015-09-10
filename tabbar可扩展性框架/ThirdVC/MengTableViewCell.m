//
//  MengTableViewCell.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/25.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "MengTableViewCell.h"

@interface MengTableViewCell()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *infoImage;
@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIView *groupView;

@property (nonatomic, strong) MASConstraint *rightConstraint;
@property (nonatomic, strong) MASConstraint *imgHiddenConstraint;
@property (nonatomic, strong) MASConstraint *titleRightConstraint;


@property (nonatomic, strong) NSMutableArray *contentConstraints;

@end

@implementation MengTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

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
    [self addSubview:self.titleLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.infoImage];
    [self addSubview:self.contentLabel];

}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
       // _titleLabel.numberOfLines = 1;
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.text = @"精彩海淀,阳发生地方时代发生发生地方时代水电费水电费的光义诊";
        [self addSubview:_titleLabel];
        
        [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.top.equalTo(self).offset(10);
//            make.left.top.lessThanOrEqualTo(self).offset(10).priorityHigh();
           // make.right.equalTo(self).offset(-10).priorityLow();
        }];
        

    }
    return _titleLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.text = @"8分钟前";
        [self addSubview:_timeLabel];
        
        [_timeLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.bottom.equalTo(self).offset(-10);
        }];
    }
    return _timeLabel;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.text = @"肯定是能否打开肌肤卡卡贾夫纳加咖啡那就啊的空间啊加拿大啊看见的烦恼咖啡卡决定能否能看到就安分啊快点解放能看见啊电脑";
        _contentLabel.numberOfLines = 3;
        //_contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _contentLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_contentLabel];
        
        [_contentLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.top.equalTo(_titleLabel.bottom).offset(10);
            make.right.equalTo(_infoImage.left).offset(-10);

        }];

    }
    return _contentLabel;
}

- (UIImageView *)infoImage
{
    if (!_infoImage) {
        _infoImage = [UIImageView new];
        _infoImage.backgroundColor = [UIColor redColor];
        _infoImage.layer.cornerRadius = 3;
         [self addSubview:_infoImage];
        
        [_infoImage makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.top.equalTo(self).offset(10);
            make.bottom.equalTo(self).offset(-10);
            make.width.equalTo(_infoImage.height);
            make.height.equalTo(_infoImage.width);
             make.left.equalTo(_titleLabel.right).offset(10).priority(UILayoutPriorityRequired);

            
            self.imgHiddenConstraint = make.width.height.equalTo(@0).priority(UILayoutPriorityRequired);
            
           // [self.titleRightConstraint deactivate];
           // [self.imgHiddenConstraint deactivate];
        }];

        
    }
    return _infoImage;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (_cellType == 0) {
        _contentLabel.numberOfLines = 2;
 
        [self.imgHiddenConstraint activate];
    }
    
    if (_cellType == 1) {
        [self.imgHiddenConstraint deactivate];
       // _infoImage.hidden = YES;
       // [_infoImage removeFromSuperview];
    }
    
    
    if (_cellType == 2) {
        [self.imgHiddenConstraint activate];

        _contentLabel.hidden = YES;
        UIImageView *lastimg;
        for (NSUInteger i = 0; i < 2; i++) {
            UIImageView *img = [UIImageView new];
            img.backgroundColor = [UIColor redColor];
            img.layer.cornerRadius = 3;
            [self addSubview:img];
            
            [img makeConstraints:^(MASConstraintMaker *make) {
                if (lastimg) {
                    make.left.equalTo(lastimg.right).offset(10);
                }
                else{
                    make.left.equalTo(self).offset(10);
                }
                make.top.equalTo(_titleLabel.bottom).offset(10);
                make.bottom.equalTo(_timeLabel.top).offset(-10);
                make.width.equalTo(@((KDeviceWidth - 30) / 2));
            }];
                                   
            lastimg = img;
        }
        
    }
    
}


+ (CGFloat)cellHeightWithObj:(id)obj{
    
    return 120;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
