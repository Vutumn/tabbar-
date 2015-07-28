//
//  ViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/24.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "ViewController.h"
#import "PicEnlargeViewController.h"

#define kCellIdentifier @"kCellIdentifier"


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController
{
    UITableView *_tableView;
    NSArray *_test;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"第一个";
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_test) {
        NSLog(@"出现第一次");
       // _test = [[NSArray alloc] init];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _test = [[NSArray alloc] init];
}

#pragma mark -UI
- (void)loadView
{
    [super loadView];
    _tableView = [UITableView new];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    [self.view addSubview:_tableView];
    
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];

}


#pragma mark -TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"点击图片放大";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    PicEnlargeViewController *vc = [[PicEnlargeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
