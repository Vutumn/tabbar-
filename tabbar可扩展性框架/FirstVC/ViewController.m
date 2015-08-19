//
//  ViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/24.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "ViewController.h"
#import "PicEnlargeViewController.h"
#import "EmojiViewController.h"
#import "AutoTableViewCell.h"
#import "ProductImageViewController.h"
#import "welcomeView.h"
#import "maopaoController.h"
#import <objc/runtime.h>

#define kCellIdentifier @"kCellIdentifier"
#define kAutoCellIdentifier @"kAutoCellIdentifier"



@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController
{
    UITableView *_tableView;
    NSArray *_test;
    NSArray *_nameArr;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"第一个";

    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // [[NSNotificationCenter defaultCenter] postNotificationName:SHOW_TAB_BAR object:nil];

    if (_test) {
        NSLog(@"出现第一次");
       // _test = [[NSArray alloc] init];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    _test = [[NSArray alloc] init];
    _nameArr = [NSArray arrayWithObjects:@"点击图片放大",@"emoji表情转换",@"多线程", @"关于label", @"生成一张纯色image", @"冒泡界面", nil];
}



#pragma mark -UI
- (void)loadView
{
    [super loadView];
    _tableView = [UITableView new];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    [_tableView registerClass:[AutoTableViewCell class] forCellReuseIdentifier:kAutoCellIdentifier];
    
    [self.view addSubview:_tableView];
    
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    

}


#pragma mark -TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _nameArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [AutoTableViewCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3) {
        AutoTableViewCell *autoCell = [tableView dequeueReusableCellWithIdentifier:kAutoCellIdentifier forIndexPath:indexPath];
        //autoCell.textLabel.text = _nameArr[indexPath.row];
        
       // [autoCell fuck];
        return autoCell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = _nameArr[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];

    UIViewController *vc;
    
    switch (indexPath.row) {
        case 0:
            vc = [[PicEnlargeViewController alloc] init];
            break;
        case 1:
            vc = [[EmojiViewController alloc] init];
            break;
        case 4:
            vc = [[ProductImageViewController alloc] init];
            break;
        case 5:
            vc = [[maopaoController alloc] init];
        default:
            break;
    }
    
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];

  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
