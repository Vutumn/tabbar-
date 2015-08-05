//
//  AutoTableViewCell.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/3.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "AutoTableViewCell.h"

@interface AutoTableViewCell()
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *ageLabel;
@property (nonatomic, strong)UIImageView *userImage;

@end

@implementation AutoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self initWithSubViews];
    
        
    }
    
    return self;
}


- (void)initWithSubViews
{
    if (!_userImage) {
        _userImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, ([AutoTableViewCell cellHeight] - 40) / 2, 40, 40)];
        _userImage.backgroundColor = [UIColor redColor];
        [_userImage doBorderWidth:0 color:nil cornerRadius:40 / 2];
        [self addSubview:_userImage];
        
    }
    
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_userImage.frame) + 10, CGRectGetMinY(_userImage.frame), 0, 0)];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.backgroundColor = [UIColor redColor];
        [self addSubview:_nameLabel];
 
    }
    
    if (!_ageLabel) {
        _ageLabel = [[UILabel alloc] init];
        _ageLabel.font = [UIFont systemFontOfSize:12];
        _ageLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:_ageLabel];
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_nameLabel setString:@"我的姓名适配" WithMaxWidth:KDeviceWidth - CGRectGetMaxX(_userImage.frame) - 20];
    _ageLabel.frame = CGRectMake(CGRectGetMaxX(_nameLabel.frame) + 5, CGRectGetMinY(_userImage.frame), 0, 0);
    [_ageLabel setString:@"21" WithMaxWidth:0];
    
}

+ (CGFloat)cellHeight
{
    return 44;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
