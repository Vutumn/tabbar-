
//
//  CloudAskViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/9.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "CloudAskViewController.h"
#import "PatientsTableViewCell.h"
#import "PRecentTreatTableViewCell.h"

@interface CloudAskViewController()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CloudAskViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"云接诊";
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
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[PatientsTableViewCell class] forCellReuseIdentifier:kPatientsCellIdentifier];
        [_tableView registerClass:[PRecentTreatTableViewCell class] forCellReuseIdentifier:kPRecentTreatCellIdentifier];
        [self.view addSubview:_tableView];
        
        [_tableView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 2;
    }else
        return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        return 150;
    }else
        return 56;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1;
    }else
        return 22;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section != 0) {
        UIView *views = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWidth, 22)];
        views.backgroundColor = kSectionHeaderBgColor;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, KDeviceWidth - 10, 22)];
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.textColor = KTextColor80;
        section == 1 ? (titleLabel.text = @"我的云接诊") : (titleLabel.text = @"视频接诊");
        [views addSubview:titleLabel];
        return views;
    }else{
        return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section != 2) {
        PatientsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPatientsCellIdentifier forIndexPath:indexPath];
        if (indexPath.section == 0) {
            cell.switchbutton.hidden = NO;
        }
        
        if (indexPath.section != 0) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            [tableView addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:10 withRightSpace:10 hasSectionLine:NO];
        }
        return cell;
    }else{
        PRecentTreatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPRecentTreatCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    
    return nil;
    
}


@end
