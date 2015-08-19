//
//  TweetCell.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/11.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//


#define kTweetCell_PadingLeft 50.0
#define kTweetCell_PadingTop 45.0
#define kTweetCell_PadingBottom 10.0
#define kTweetCell_ContentWidth (KDeviceWidth -kTweetCell_PadingLeft - kPaddingLeftWidth)
#define kTweetCell_LikeComment_Height 25.0
#define kTweetCell_LikeComment_Width 50.0
#define kTweetCell_LikeUserCCell_Height 25.0
#define kTweetCell_LikeUserCCell_Pading 10.0
#define kTweetCell_LocationCCell_Pading 9.0
#define kTweet_ContentFont [UIFont systemFontOfSize:16]
#define kTweet_ContentMaxHeight 125.0
#define kTweet_CommentFont [UIFont systemFontOfSize:14]
#define kTweet_TimtFont [UIFont systemFontOfSize:12]
#define kTweet_LikeUsersLineCount 7.0


#import "TweetCell.h"
#import "TweetMoreCommentCell.h"
#import "TweetCommentCell.h"
#import "UITapImageView.h"


static NSString *kCellIdentifier_TweetCommentMore = @"kCellIdentifier_TweetCommentMore";
static NSString *kCellIdentifier_TweetComment = @"kCellIdentifier_TweetComment";

@interface TweetCell()
@property (nonatomic, strong)UITapImageView *ownerImaView;
@property (nonatomic, strong)UITTTAttributedLabel *contentLabel;
@property (nonatomic, strong)UIButton *ownerNameBtn;
@property (nonatomic, strong)UILabel *timeLabel, *fromLabel;
@property (nonatomic, strong)UIButton *likeBtn, *commentBtn, *deleteBtn;
@property (nonatomic, strong)UIButton *locationBtn;
@property (nonatomic, strong)UICollectionView *mediaView;
@property (nonatomic, strong)UICollectionView *likeUsersView;
@property (nonatomic, strong)UITableView *commentListView;
@property (nonatomic, strong)UIImageView *timeClockIconView, *commentOrLikeBeginImgView, *commentOrLikeSplitlineView;
@property (nonatomic, strong)NSMutableDictionary *imageViewsDict;

@end

@implementation TweetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        [self initWithSubViews];
    }
    return self;
}

- (void)initWithSubViews
{
    if (!self.ownerImaView) {
        self.ownerImaView = [[UITapImageView alloc] initWithFrame:CGRectMake(10, 10, 33, 33)];
        [self.ownerImaView  doCircleFrame];
        [self.contentView addSubview:self.ownerImaView];
    }
    
    if (!self.ownerNameBtn) {
        self.ownerNameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.ownerNameBtn.frame = CGRectMake(50, 18, 50, 20);
        [self.ownerNameBtn addTarget:self action:@selector(userBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.ownerNameBtn];
    }
    
    if (!self.timeClockIconView) {
        self.timeClockIconView = [[UIImageView alloc] initWithFrame:CGRectMake(KDeviceWidth - 15 - 70, 20, 12, 12)];
        self.timeClockIconView.image = [UIImage imageNamed:@"time_clock_icon"];
        [self.contentView addSubview:self.timeClockIconView];
        
    }
    
    if (!self.timeLabel) {
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(KDeviceWidth - 15 - 55, 18, 55, 12)];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textAlignment = NSTextAlignmentRight;
        self.timeLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
        [self.contentView addSubview:self.timeLabel];
    }
    
    if (!self.contentLabel) {
        self.contentLabel = [[UITTTAttributedLabel alloc] initWithFrame:CGRectMake(50, 45, KDeviceWidth - 65, 20)];
        self.contentLabel.font = [UIFont systemFontOfSize:16];
        self.contentLabel.textColor = [UIColor colorWithHexString:@"0x222222"];
        self.contentLabel.numberOfLines = 0;
        
        self.contentLabel.linkAttributes = kLinkAttributes;
        self.contentLabel.activeLinkAttributes = kLinkAttributesActive;
        self.contentLabel.delegate = self;
        [self.contentLabel addLongPressForCopy];
        [self.contentView addSubview:self.contentLabel];
    }
    
    if (!self.commentBtn) {
        self.commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.commentBtn.frame = CGRectMake(KDeviceWidth - 65, 0, 50, 25);
        [self.commentBtn setImage:[UIImage imageNamed:@"tweet_comment_btn"] forState:UIControlStateNormal];
        [self.commentBtn addTarget:self action:@selector(commentBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.commentBtn];
    }
    
    if (!self.likeBtn) {
        self.likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.likeBtn.frame = CGRectMake(KDeviceWidth - 15 - 5 -100, 0, 50, 25);
        [self.likeBtn addTarget:self action:@selector(likeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.likeBtn];
    }
    
    if (!self.deleteBtn) {
        self.deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.deleteBtn.frame = CGRectMake(KDeviceWidth - kPaddingLeftWidth- 3*kTweetCell_LikeComment_Width -5, 0, kTweetCell_LikeComment_Width, kTweetCell_LikeComment_Height);
        [self.deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [self.deleteBtn setTitleColor:[UIColor colorWithHexString:@"0x3bbd79"] forState:UIControlStateNormal];
        [self.deleteBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        self.deleteBtn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        [self.deleteBtn addTarget:self action:@selector(deleteBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:self.deleteBtn];
    }
    
    if (!self.locationBtn) {
        self.locationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.locationBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.locationBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.locationBtn.frame = CGRectMake(kTweetCell_PadingLeft, 0, 100, 15);
        //            self.locaitonBtn.titleLabel.minimumScaleFactor = 0.80;
        self.locationBtn.titleLabel.adjustsFontSizeToFitWidth = NO;
        self.locationBtn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        [self.locationBtn setTitleColor:[UIColor colorWithHexString:@"0x3bbd79"] forState:UIControlStateNormal];
        [self.locationBtn addTarget:self action:@selector(locationBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.locationBtn];
    }
    
    if (!self.fromLabel) {
        self.fromLabel = [[UILabel alloc] initWithFrame:CGRectMake(kTweetCell_PadingLeft, 0, 100, 15)];
        self.fromLabel.font = kTweet_TimtFont;
        self.fromLabel.minimumScaleFactor = 0.50;
        self.fromLabel.adjustsFontSizeToFitWidth = YES;
        self.fromLabel.textAlignment = NSTextAlignmentLeft;
        self.fromLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
        [self.contentView addSubview:self.fromLabel];
    }
    
    if (!_commentOrLikeBeginImgView) {
        _commentOrLikeBeginImgView = [[UIImageView alloc] initWithFrame:CGRectMake(kTweetCell_PadingLeft +20, 0, 15, 7)];
        _commentOrLikeBeginImgView.image = [UIImage imageNamed:@"commentOrLikeBeginImg"];
        [self.contentView addSubview:_commentOrLikeBeginImgView];
    }
    
    
//    if (!self.likeUsersView) {
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        self.likeUsersView = [[UICollectionView alloc] initWithFrame:CGRectMake(kTweetCell_PadingLeft, 0, kTweetCell_ContentWidth, 35) collectionViewLayout:layout];
//        self.likeUsersView.scrollEnabled = NO;
//        [self.likeUsersView setBackgroundView:nil];
//        [self.likeUsersView setBackgroundColor:kColorTableSectionBg];
////        [self.likeUsersView registerClass:[TweetLikeUserCCell class] forCellWithReuseIdentifier:kCCellIdentifier_TweetLikeUser];
//        self.likeUsersView.dataSource = self;
//        self.likeUsersView.delegate = self;
//        [self.contentView addSubview:self.likeUsersView];
//    }
    
//    if (!self.mediaView) {
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        self.mediaView = [[UICollectionView alloc] initWithFrame:CGRectMake(kTweetCell_PadingLeft, 0, kTweetCell_ContentWidth, 80) collectionViewLayout:layout];
//        self.mediaView.scrollEnabled = NO;
//        [self.mediaView setBackgroundView:nil];
//        [self.mediaView setBackgroundColor:[UIColor clearColor]];
////        [self.mediaView registerClass:[TweetMediaItemCCell class] forCellWithReuseIdentifier:kCCellIdentifier_TweetMediaItem];
////        [self.mediaView registerClass:[TweetMediaItemSingleCCell class] forCellWithReuseIdentifier:kCCellIdentifier_TweetMediaItemSingle];
//        self.mediaView.dataSource = self;
//        self.mediaView.delegate = self;
//        [self.contentView addSubview:self.mediaView];
//    }
    
    
    if (!self.commentListView) {
        self.commentListView = [[UITableView alloc] initWithFrame:CGRectMake(kTweetCell_PadingLeft, 0, kTweetCell_ContentWidth, 20) style:UITableViewStylePlain];
        self.commentListView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.commentListView.scrollEnabled = NO;
        [self.commentListView setBackgroundView:nil];
        [self.commentListView setBackgroundColor:kColorTableSectionBg];
        [self.commentListView registerClass:[TweetCommentCell class] forCellReuseIdentifier:kCellIdentifier_TweetComment];
        [self.commentListView registerClass:[TweetMoreCommentCell class] forCellReuseIdentifier:kCellIdentifier_TweetCommentMore];
        self.commentListView.dataSource = self;
        self.commentListView.delegate = self;
        [self.contentView addSubview:self.commentListView];
    }
    if (!_commentOrLikeSplitlineView) {
        _commentOrLikeSplitlineView = [[UIImageView alloc] initWithFrame:CGRectMake(kTweetCell_PadingLeft, 0, kTweetCell_ContentWidth, 1)];
        _commentOrLikeSplitlineView.image = [UIImage imageNamed:@"splitlineImg"];
        [self.contentView addSubview:_commentOrLikeSplitlineView];
    }
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    if (!_tweet) {
        return;
    }
    
    __weak __typeof(self)weakSelf = self;
    
    [self.ownerImaView setImageWithUrl:[NSURL URLWithString:_tweet.owner.avatar] placeholderImage:kPlaceholderMonkeyRoundView(_ownerImaView) tapBlock:^(id obj) {
        
    }];
    
    [self.ownerNameBtn setUserTitle:_tweet.owner.name font:[UIFont systemFontOfSize:17] maxWidth:(kTweetCell_ContentWidth-85)];

    
    [self.timeLabel setLongString:[_tweet.created_at stringDisplay_HHmm] withVariableWidth:KDeviceWidth/2];
    CGFloat timeLabelX = KDeviceWidth - kPaddingLeftWidth - CGRectGetWidth(self.timeLabel.frame);

    [self.timeLabel setX:timeLabelX];

    
    CGFloat curBottomY = kTweetCell_PadingTop +[TweetCell contentLabelHeightWithTweet:_tweet] +10;
    
    
//    if(_tweet.device.length > 0) {
//        self.fromLabel.text = [NSString stringWithFormat:@"来自 %@", _tweet.device];
//        self.fromLabel.frame = CGRectMake(kTweetCell_PadingLeft, curBottomY +5,
//                                          (isMineTweet? (KDeviceWidth - kTweetCell_PadingLeft- kPaddingLeftWidth- 3*kTweetCell_LikeComment_Width- 10):
//                                           (KDeviceWidth - kTweetCell_PadingLeft- kPaddingLeftWidth- 2*kTweetCell_LikeComment_Width- 10)), 15);
//        self.fromLabel.hidden = NO;
//    }else {
//        self.fromLabel.hidden = YES;
//    }
    
    //喜欢&评论 按钮
    [self.likeBtn setImage:[UIImage imageNamed:(_tweet.liked.boolValue? @"tweet_liked_btn":@"tweet_like_btn")] forState:UIControlStateNormal];
    [self.likeBtn setY:curBottomY];
    [self.commentBtn setY:curBottomY];
//    if (isMineTweet) {
//        [self.deleteBtn setY:curBottomY];
//        self.deleteBtn.hidden = NO;
//    }else{
//        self.deleteBtn.hidden = YES;
//    }
    
    
    curBottomY += kTweetCell_LikeComment_Height;
    curBottomY += [TweetCell likeCommentBtn_BottomPadingWithTweet:_tweet];
    
    
    curBottomY += 5;
    if (_tweet.numOfLikers > 0 || _tweet.numberOfComments > 0) {
        [_commentOrLikeBeginImgView setY:(curBottomY - CGRectGetHeight(_commentOrLikeBeginImgView.frame))];
        _commentOrLikeBeginImgView.hidden = NO;
    }else{
        _commentOrLikeBeginImgView.hidden = YES;
    }

    
    //点赞的人_列表
    //    可有可无
    if (_tweet.numOfLikers > 0) {
        CGFloat likeUsersHeight = [TweetCell likeUsersHeightWithTweet:_tweet];
        [self.likeUsersView setFrame:CGRectMake(kTweetCell_PadingLeft, curBottomY, kTweetCell_ContentWidth, likeUsersHeight)];
        [self.likeUsersView reloadData];
        self.likeUsersView.hidden = NO;
        curBottomY += likeUsersHeight;
    }else{
        if (self.likeUsersView) {
            self.likeUsersView.hidden = YES;
        }
    }

    //评论与赞的分割线
    if (_tweet.numOfLikers > 0 && _tweet.numberOfComments > 0) {
        [_commentOrLikeSplitlineView setY:(curBottomY -1)];
        _commentOrLikeSplitlineView.hidden = NO;
    }else{
        _commentOrLikeSplitlineView.hidden = YES;
    }
    
    //评论的人_列表
    //    可有可无
    if (_tweet.numberOfComments > 0) {
        CGFloat commentListViewHeight = [TweetCell commentListViewHeightWithTweet:_tweet];
        [self.commentListView setFrame:CGRectMake(kTweetCell_PadingLeft, curBottomY, kTweetCell_ContentWidth, commentListViewHeight)];
        [self.commentListView reloadData];
        self.commentListView.hidden = NO;
    }else{
        if (self.commentListView) {
            self.commentListView.hidden = YES;
        }
    }
    
}

- (void)likeBtnClicked:(UIButton *)sender
{
    if (_likeBtnBlock) {
        _likeBtnBlock(_tweet);
    }
}

+ (CGFloat)cellHeightWithObj:(id)obj
{
    Tweet *tweet = (Tweet *)obj;
    CGFloat cellHeight = 0;
    if (tweet.likes.integerValue > 0 || tweet.comments.integerValue > 0) {
        cellHeight = 6;
    }else{
        cellHeight = 3;
    }
    cellHeight += 20;
    //padding_top
    cellHeight += 45;
    cellHeight += [TweetCell contentLabelHeightWithTweet:tweet];
    //!!!
    //cellHeight += [TweetCell contentMediaHeightWithTweet:tweet];
    
    //likecomment height
    cellHeight += 25;
    cellHeight += [TweetCell locationHeightWithTweet:tweet];
    cellHeight += [TweetCell likeCommentBtn_BottomPadingWithTweet:tweet];
    cellHeight += [TweetCell likeUsersHeightWithTweet:tweet];
    cellHeight += 10;
    
    
    return cellHeight;
    
}

+ (CGFloat)locationHeightWithTweet:(Tweet *)tweet{
    CGFloat ocationHeight = 0;
    if ( tweet.location.length > 0) {
        ocationHeight = 15 + kTweetCell_LocationCCell_Pading;
    }else{
        ocationHeight = 0;
    }
    return ocationHeight;
}

+ (CGFloat)contentLabelHeightWithTweet:(Tweet *)tweet{
    return MIN(kTweet_ContentMaxHeight, [tweet.content getHeightWithFont:kTweet_ContentFont constrainedToSize:CGSizeMake(kTweetCell_ContentWidth, CGFLOAT_MAX)]);
}

+ (CGFloat)likeCommentBtn_BottomPadingWithTweet:(Tweet *)tweet{
    if (tweet &&
        (tweet.likes.intValue > 0
         ||tweet.likes.intValue> 0)){
            return 5.0;
        }else{
            return 0;
        }
}

+ (CGFloat)likeUsersHeightWithTweet:(Tweet *)tweet{
    CGFloat likeUsersHeight = 0;
    if (tweet.likes.intValue > 0) {
        likeUsersHeight = 45;
        //        +30*(ceilf([tweet.like_users count]/kTweet_LikeUsersLineCount)-1);
    }
    return likeUsersHeight;
}

+ (CGFloat)commentListViewHeightWithTweet:(Tweet *)tweet{
    if (!tweet) {
        return 0;
    }
    CGFloat commentListViewHeight = 0;
    
    NSInteger numOfComments = tweet.numberOfComments;
    BOOL hasMoreComments = tweet.hasMoreComments;
    
    for (int i = 0; i < numOfComments; i++) {
        if (i == numOfComments-1 && hasMoreComments) {
            commentListViewHeight += [TweetMoreCommentCell cellHeight];
        }else{
            Comment *curComment = [tweet.comment_list objectAtIndex:i];
            commentListViewHeight += [TweetCommentCell cellHeightWithObj:curComment];
        }
    }
    return commentListViewHeight;
}


#pragma mark Table Comments
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tweet.numberOfComments;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= _tweet.numberOfComments - 1 && _tweet.hasMoreComments) {
        TweetMoreCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_TweetCommentMore forIndexPath:indexPath];
        cell.commentNum = _tweet.comments;
        return cell;
    }else
    {
        TweetCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_TweetComment  forIndexPath:indexPath];
        Comment *curComment = [_tweet.comment_list objectAtIndex:indexPath.row];
        [cell configWithComment:curComment topLine:(indexPath.row != 0)];
        cell.commentLabel.delegate = self;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat cellHeight = 0;
    if (indexPath.row >= _tweet.numberOfComments-1 && _tweet.hasMoreComments) {
        cellHeight = [TweetMoreCommentCell cellHeight];
    }else{
        Comment *curComment = [_tweet.comment_list objectAtIndex:indexPath.row];
        cellHeight = [TweetCommentCell cellHeightWithObj:curComment];
    }
    return cellHeight;
}

@end
