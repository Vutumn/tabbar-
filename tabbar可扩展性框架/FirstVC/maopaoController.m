//
//  maopaoController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/10.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "maopaoController.h"
#import "AFNetAPI.h"
#import "TweetCell.h"

@interface maopaoController()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *myTableView;
@property (nonatomic, strong)NSMutableArray *dataArr;

@end

@implementation maopaoController

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

    
}

#pragma mark -UI
- (void)loadView
{
    [super loadView];
    _myTableView = [UITableView new];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    _myTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_myTableView];
    
    [_myTableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self sendRequest];

    
}

#pragma mark -TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return [TweetCell cellHeightWithObj:[self.dataArr objectAtIndex:indexPath.row]];
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
    
}


@end
