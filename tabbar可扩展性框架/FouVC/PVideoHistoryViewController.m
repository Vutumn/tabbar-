//
//  PVideoHistoryViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/9.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "PVideoHistoryViewController.h"
#import "MoreButtonTableViewCell.h"
#import "VideoHistoryTableViewCell.h"

@interface PVideoHistoryViewController()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PVideoHistoryViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"视频记录";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self InitWithSubViews];
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[VideoHistoryTableViewCell class] forCellReuseIdentifier:kVideoHistoryCellIdentifier];
        [_tableView registerClass:[MoreButtonTableViewCell class] forCellReuseIdentifier:kMoreButtonnCellIdentifier];
        [self.view addSubview:_tableView];

        [_tableView  makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 7) {
        return [MoreButtonTableViewCell cellHeightWithObj:nil];
    }else{
        return [VideoHistoryTableViewCell cellHeightWithObj:nil];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *views = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWidth, 25)];
    views.backgroundColor = kGrayBG;
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 25)];
    leftLabel.text = @"共10次";
    leftLabel.font = [UIFont systemFontOfSize:12];
    leftLabel.textColor = KTextColor80;
    
  
    [views addSubview:leftLabel];
    return views;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 7) {
        MoreButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMoreButtonnCellIdentifier forIndexPath:indexPath];
        [tableView addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:10 withRightSpace:10 hasSectionLine:NO];
        return cell;
    }
    VideoHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kVideoHistoryCellIdentifier forIndexPath:indexPath];
    [tableView addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:10 withRightSpace:10 hasSectionLine:NO];
    
    return cell;
}

@end
