//
//  PDetailViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/8.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "PDetailViewController.h"
#import "PHeaderView.h"
#import "VideoHistoryTableViewCell.h"
#import "PatientsRecorderTableViewCell.h"
#import "MoreButtonTableViewCell.h"
#import "PVideoHistoryViewController.h"
#import "PRemarkViewController.h"

static NSString *const kPatientsRecorderCellIdentifier = @"PatientsRecorderCell";

@interface PDetailViewController()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) PHeaderView *headView;

@end

@implementation PDetailViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"患者详情";
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self InitWithSubViews];
    
}

#pragma mark -UI
- (void)InitWithSubViews
{
  //  [self.view addSubview:self.headView];
    [self.view addSubview:self.tableView];


   // [self.view addSubview:self.headView];
}

//- (PHeaderView *)headViewa
//{
//    if (!_headView) {
//        __weak __typeof(self)weakSelf = self;
//
//        _headView = [PHeaderView new];
//        
//    }
//    return _headView;
//}

- (UITableView *)tableView
{
    if (!_tableView) {
        __weak __typeof(self)weakSelf = self;

        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _headView = [[PHeaderView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWidth, 350)];
        _tableView.tableHeaderView = _headView;
        _headView.remarkActionBlock = ^{
            PRemarkViewController *vc = [[PRemarkViewController alloc] init];
            weakSelf.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[VideoHistoryTableViewCell class] forCellReuseIdentifier:kVideoHistoryCellIdentifier];
        [_tableView registerClass:[PatientsRecorderTableViewCell class] forCellReuseIdentifier:kPatientsRecorderCellIdentifier];
        [_tableView registerClass:[MoreButtonTableViewCell class] forCellReuseIdentifier:kMoreButtonnCellIdentifier];
        [self.view addSubview:_tableView];
        
        [_tableView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return _tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3) {
        return [MoreButtonTableViewCell cellHeightWithObj:nil];
    }else if (indexPath.section == 0){
        return [VideoHistoryTableViewCell cellHeightWithObj:nil];
    }else
        return [PatientsRecorderTableViewCell cellHeightWithObj:nil];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *views = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWidth, 25)];
    views.backgroundColor = kGrayBG;
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 25)];
    section == 0 ? (leftLabel.text = @"视频记录") : (leftLabel.text = @"患者健康档案");
    leftLabel.font = [UIFont systemFontOfSize:12];
    leftLabel.textColor = KTextColor80;
    
    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(KDeviceWidth - 100 - 10, 0, 100, 25)];
    rightLabel.textAlignment = NSTextAlignmentRight;
    rightLabel.font = [UIFont systemFontOfSize:12];
    section == 0 ? (rightLabel.text = @"共10次") : (rightLabel.text = @"共4次");
    rightLabel.textColor = KTextColor80;
    [views addSubview:leftLabel];
    [views addSubview:rightLabel];
    return views;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak __typeof(self)weakSelf = self;
    if (indexPath.section == 0) {
        if (indexPath.row == 3) {
            MoreButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMoreButtonnCellIdentifier forIndexPath:indexPath];
            cell.moreActionBlock = ^(){
                PVideoHistoryViewController *vc = [[PVideoHistoryViewController alloc] init];
                weakSelf.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:vc animated:YES];
            };
            [tableView addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:10 withRightSpace:10 hasSectionLine:NO];
            
            return cell;
        }
        VideoHistoryTableViewCell *result = [tableView  dequeueReusableCellWithIdentifier:kVideoHistoryCellIdentifier forIndexPath:indexPath];
        
        [tableView addLineforPlainCell:result forRowAtIndexPath:indexPath withLeftSpace:10 withRightSpace:10 hasSectionLine:NO];
        
        return result;

    }else if (indexPath.section == 1){
        if (indexPath.row == 3) {
            MoreButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMoreButtonnCellIdentifier forIndexPath:indexPath];
            cell.moreActionBlock = ^(){
                PVideoHistoryViewController *vc = [[PVideoHistoryViewController alloc] init];
                weakSelf.hidesBottomBarWhenPushed = YES;
                [weakSelf.navigationController pushViewController:vc animated:YES];
            };
            [tableView addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:10 withRightSpace:10 hasSectionLine:NO];
            
            return cell;
        }
        PatientsRecorderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPatientsRecorderCellIdentifier forIndexPath:indexPath];
        [tableView addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:10 withRightSpace:10 hasSectionLine:NO];

        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


@end
