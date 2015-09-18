//
//  TweetCommentCell.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/13.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "TweetMoreCommentCell.h"

@interface TweetMoreCommentCell()
@property (nonatomic, strong)UILabel *contentLabel;
@property (nonatomic, strong)UIImageView *commentIconView, *splitLineView;

@end

@implementation TweetMoreCommentCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        if (!_commentIconView) {
            _commentIconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 13, 13)];
            _commentIconView.image = [UIImage imageNamed:@"tweet_more_comment_icon"];
            [self.contentView addSubview:_commentIconView];
        }
        
        if (!_contentLabel) {
            _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, 245, 20)];
            _contentLabel.backgroundColor = [UIColor clearColor];
            _contentLabel.font = [UIFont systemFontOfSize:14];
            _contentLabel.textColor = [UIColor colorWithHexString:@"0x222222"];
            [self.contentView addSubview:_contentLabel];
        }
        if (!_splitLineView) {
            _splitLineView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 255, 1)];
            _splitLineView.image = [UIImage imageNamed:@"splitlineImg"];
            [self.contentView addSubview:_splitLineView];
            [_splitLineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView).offset(5);
                make.top.right.equalTo(self.contentView);
                make.height.mas_equalTo(1.0);
            }];
        }
        
        
        
    }
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.contentLabel.text = [NSString stringWithFormat:@"查看全部%d条评论", _commentNum.intValue];
}
+(CGFloat)cellHeight{
    return 12+10*2;
}

@end
