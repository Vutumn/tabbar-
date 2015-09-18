//
//  FriendInfoTableViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/27.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "FriendInfoViewController.h"
#import "MainInfoTableViewCell.h"
#import "OtherInfoTableViewCell.h"
#import "ActionView.h"

NSString *const kOtherInfoCellIdentifier = @"OtherInfoCell";
NSString *const kMainInfoCellIdentifier = @"MainInfoCell";

@interface FriendInfoViewController()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ActionView *footerView;

@end

@implementation FriendInfoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"好友资料";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:HIDDEN_TAB_BAR object:nil];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:SHOW_TAB_BAR object:nil];

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
    [self.view addSubview:self.footerView];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[MainInfoTableViewCell class] forCellReuseIdentifier:kMainInfoCellIdentifier];
         [_tableView registerClass:[OtherInfoTableViewCell class] forCellReuseIdentifier:kOtherInfoCellIdentifier];
        
        [self.view addSubview:_tableView];
        
        [_tableView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return _tableView;
}

- (ActionView *)footerView
{
    if (!_footerView) {
        __weak typeof(self) weakSelf = self;
        _footerView = [ActionView new];
        
        _footerView.addFriensBlock = ^(){
            [weakSelf addFriendAction];
        };
        _footerView.sendMessageBlock = ^(){
            [weakSelf sendMessageAction];
        };
        
        [self.view addSubview:_footerView];
        
        [_footerView makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(self.view);
            make.height.equalTo(@50);
        }];
    }
    return _footerView;
}


#pragma mark -TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section == 0 ? ([MainInfoTableViewCell cellHeightWithObj:nil]) : ([OtherInfoTableViewCell cellHeightWithObj:nil]);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MainInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainInfoCellIdentifier forIndexPath:indexPath];
        [_tableView addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:0 hasSectionLine:YES];
        return cell;
    }
    OtherInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kOtherInfoCellIdentifier forIndexPath:indexPath];
    [_tableView addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:0 hasSectionLine:YES];

    return cell;

}

#pragma mark -event response
- (void)addFriendAction
{
    NSLog(@"添加好友去");
}

- (void)sendMessageAction
{
    NSLog(@"发送消息去");
}


@end
