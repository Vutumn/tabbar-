
//
//  MoreButtonTableViewCell.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/9.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "MoreButtonTableViewCell.h"

@interface MoreButtonTableViewCell()
@property (nonatomic, strong)UIButton *moreButton;

@end


@implementation MoreButtonTableViewCell

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

- (void)InitWithSubViews
{
    [self addSubview:self.moreButton];
}

- (UIButton *)moreButton
{
    if (!_moreButton) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _moreButton.backgroundColor = klightButtonBG;
        [_moreButton setTitle:@"查看更多" forState:UIControlStateNormal];
        _moreButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_moreButton addTarget:self action:@selector(moreAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_moreButton];
        
        [_moreButton makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.right.equalTo(self).offset(-10);
            make.top.equalTo(self).offset(12);
            make.bottom.equalTo(self).offset(-12);
            
        }];
    }
    return _moreButton;
}

- (void)moreAction
{
    if (self.moreActionBlock) {
        self.moreActionBlock();
    }
}

+ (CGFloat)cellHeightWithObj:(id)obj
{
    return 64;
}

@end
