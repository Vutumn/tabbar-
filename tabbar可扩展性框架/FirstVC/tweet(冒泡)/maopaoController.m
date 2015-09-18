//
//  maopaoController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/10.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "MaoPaoController.h"
#import "AFNetAPI.h"
#import "TweetCell.h"

static NSString *kCellIdentifier_Tweet = @"TweetCell";

@interface MaoPaoController()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *myTableView;
@property (nonatomic, strong)NSMutableArray *dataArr;

@end

@implementation MaoPaoController

#pragma mark -getData
- (void)sendRequest
{
    __weak typeof(self) weakSelf = self;
    [[AFNetAPI sharedManager] request_paopao_Block:^(id data, NSError *error) {
        NSLog(@"%@", data);
        //[weakSelf.dataArr addObjectsFromArray:data];
    
        weakSelf.dataArr = [NSMutableArray arrayWithArray:data];
        
        [_myTableView reloadData];

        [weakSelf.view hasData:(self.dataArr.count > 0) hasError:(error != nil) reloadButtonBlock:^(id sender) {
            [self sendRequest];
        }];
    }];
    
}

- (void)dealloc
{
    _myTableView.delegate = nil;
    _myTableView.dataSource = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark -UI
- (void)loadView
{
    [super loadView];
    
    _myTableView = ({
        UITableView *tableView = [UITableView new];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.tableFooterView = [UIView new];
        [tableView registerClass:[TweetCell class] forCellReuseIdentifier:kCellIdentifier_Tweet];
        [self.view addSubview:tableView];
        
        [tableView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        tableView;
    });
 
    [self sendRequest];

    
}

#pragma mark -TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [TweetCell cellHeightWithObj:[self.dataArr objectAtIndex:indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_Tweet forIndexPath:indexPath];
    cell.tweet = [self.dataArr objectAtIndex:indexPath.row];
    
    return cell;
    
}


@end
