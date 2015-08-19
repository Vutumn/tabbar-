//
//  TweetCommentCell.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/13.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#define kTweet_CommentFont [UIFont systemFontOfSize:14]


#define kTweetCommentCell_LeftOrRightPading 10.0
#define kTweetCommentCell_ContentMaxHeight 105.0
#define kTweetCommentCell_ContentWidth (KDeviceWidth - kPaddingLeftWidth - 2*kTweetCommentCell_LeftOrRightPading - 50)


#import "TweetCommentCell.h"

@interface TweetCommentCell()
@property (nonatomic, strong) UILabel *userNameLabel, *timeLabel;
@property (nonatomic, strong) UIImageView *timeClockIconView, *splitLineView;
@property (strong, nonatomic) Comment *curComment;

@end

@implementation TweetCommentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier
            ];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        if (!_commentLabel) {
            _commentLabel = [[UITTTAttributedLabel alloc] initWithFrame:CGRectMake(kTweetCommentCell_LeftOrRightPading, kScaleFrom_iPhone5_Desgin(6), kTweetCommentCell_ContentWidth, 20)];
            _commentLabel.numberOfLines = 0;
            _commentLabel.backgroundColor = [UIColor clearColor];
            _commentLabel.font = kTweet_CommentFont;
            _commentLabel.textColor = [UIColor colorWithHexString:@"0x222222"];
            _commentLabel.linkAttributes = kLinkAttributes;
            _commentLabel.activeLinkAttributes = kLinkAttributesActive;
            [self.contentView addSubview:_commentLabel];
        }
        
        if (!_userNameLabel) {
            _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(kTweetCommentCell_LeftOrRightPading, 0, 150, 15)];
            _userNameLabel.backgroundColor = [UIColor clearColor];
            _userNameLabel.font = [UIFont boldSystemFontOfSize:10];
            _userNameLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
            [self.contentView addSubview:_userNameLabel];
        }
        
        if (!_timeLabel) {
            _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, 80, 15)];
            _timeLabel.backgroundColor = [UIColor clearColor];
            _timeLabel.font = [UIFont systemFontOfSize:10];
            _timeLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
            [self.contentView addSubview:_timeLabel];
        }
        if (!_timeClockIconView) {
            _timeClockIconView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 0, 12, 12)];
            _timeClockIconView.image = [UIImage imageNamed:@"time_clock_icon"];
            [self.contentView addSubview:_timeClockIconView];
        }
        if (!_splitLineView) {
            _splitLineView = [[UIImageView alloc] initWithFrame:CGRectMake(kTweetCommentCell_LeftOrRightPading, 0, kTweetCommentCell_ContentWidth+kTweetCommentCell_LeftOrRightPading, 1)];
            _splitLineView.image = [UIImage imageNamed:@"splitlineImg"];
            [self.contentView addSubview:_splitLineView];
        }

    }
    
    return self;
}

- (void)configWithComment:(Comment *)curComment topLine:(BOOL)has
{
    _curComment = curComment;
    _splitLineView.hidden = !has;
    User *curUser = _curComment.owner;
    //    [_commentLabel setWidth:kTweetCommentCell_ContentWidth];
    //    _commentLabel.text = _curComment.content;
    //    [_commentLabel sizeToFit];
    [_commentLabel setLongString:_curComment.content withFitWidth:kTweetCommentCell_ContentWidth maxHeight:kTweetCommentCell_ContentMaxHeight];
    
    CGFloat curBottomY = CGRectGetMaxY(_commentLabel.frame) +kScaleFrom_iPhone5_Desgin(5);
    
    _userNameLabel.text = curUser.name;
   // _timeLabel.text = [_curComment.created_at stringTimesAgo];
    [_userNameLabel setY:curBottomY];
    [_userNameLabel sizeToFit];
    
    CGRect frame = _timeClockIconView.frame;
    frame.origin.y = curBottomY;
    frame.origin.x = 15+ CGRectGetWidth(_userNameLabel.frame);
    _timeClockIconView.frame = frame;
    
    frame.origin.x += 15;
    frame.size = _timeLabel.frame.size;
    _timeLabel.frame = frame;
    [_timeLabel sizeToFit];
}

+ (CGFloat)cellHeightWithObj:(id)obj{
    CGFloat cellHeight = 0;
    if ([obj isKindOfClass:[Comment class]]) {
        Comment *curComment = (Comment *)obj;
        cellHeight = MIN(kTweetCommentCell_ContentMaxHeight, [curComment.content getHeightWithFont:kTweet_CommentFont constrainedToSize:CGSizeMake(kTweetCommentCell_ContentWidth, CGFLOAT_MAX)]) +15 + kScaleFrom_iPhone5_Desgin(15);
    }
    return cellHeight;
}

@end
