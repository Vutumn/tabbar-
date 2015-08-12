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

@interface TweetCell()
@property (nonatomic, strong)UIImageView *ownerImaView;
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
        self.ownerImaView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 33, 33)];
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
    
    
    if (!self.likeUsersView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        self.likeUsersView = [[UICollectionView alloc] initWithFrame:CGRectMake(kTweetCell_PadingLeft, 0, kTweetCell_ContentWidth, 35) collectionViewLayout:layout];
        self.likeUsersView.scrollEnabled = NO;
        [self.likeUsersView setBackgroundView:nil];
        [self.likeUsersView setBackgroundColor:kColorTableSectionBg];
//        [self.likeUsersView registerClass:[TweetLikeUserCCell class] forCellWithReuseIdentifier:kCCellIdentifier_TweetLikeUser];
        self.likeUsersView.dataSource = self;
        self.likeUsersView.delegate = self;
        [self.contentView addSubview:self.likeUsersView];
    }
    
    if (!self.mediaView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        self.mediaView = [[UICollectionView alloc] initWithFrame:CGRectMake(kTweetCell_PadingLeft, 0, kTweetCell_ContentWidth, 80) collectionViewLayout:layout];
        self.mediaView.scrollEnabled = NO;
        [self.mediaView setBackgroundView:nil];
        [self.mediaView setBackgroundColor:[UIColor clearColor]];
//        [self.mediaView registerClass:[TweetMediaItemCCell class] forCellWithReuseIdentifier:kCCellIdentifier_TweetMediaItem];
//        [self.mediaView registerClass:[TweetMediaItemSingleCCell class] forCellWithReuseIdentifier:kCCellIdentifier_TweetMediaItemSingle];
        self.mediaView.dataSource = self;
        self.mediaView.delegate = self;
        [self.contentView addSubview:self.mediaView];
    }
    
    
    if (!self.commentListView) {
        self.commentListView = [[UITableView alloc] initWithFrame:CGRectMake(kTweetCell_PadingLeft, 0, kTweetCell_ContentWidth, 20) style:UITableViewStylePlain];
        self.commentListView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.commentListView.scrollEnabled = NO;
        [self.commentListView setBackgroundView:nil];
        [self.commentListView setBackgroundColor:kColorTableSectionBg];
//        [self.commentListView registerClass:[TweetCommentCell class] forCellReuseIdentifier:kCellIdentifier_TweetComment];
//        [self.commentListView registerClass:[TweetCommentMoreCell class] forCellReuseIdentifier:kCellIdentifier_TweetCommentMore];
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
    
    
}

//+ (CGFloat)cellHeightWithObj:(id)obj
//{
//    Tweet *tweet = (Tweet *)obj;
//    CGFloat cellHeight = 0;
//    if (tweet.likes.integerValue > 0 || tweet.comments.integerValue > 0) {
//        cellHeight = 6;
//    }else{
//        cellHeight = 3;
//    }
//    
//    
//}


@end
