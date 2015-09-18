//
//  ThirdViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/27.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "ThirdViewController.h"
#import "AutoSlideScrollView.h"
#import "CodingBanner.h"
#import "AFNetAPI.h"
#import "HeaderView.h"
#import "CircleTableViewCell.h"
#import "MengTableViewCell.h"
#import "AdddFriendController.h"

static NSString *const kCircleCellIdentifier = @"kCircleCellIdentifier";
static NSString *const kMengCellIdentifier = @"kMengCellIdentifier";


@interface ThirdViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HeaderView *headView;

@end

@implementation ThirdViewController


#pragma mark -life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"第三个";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)dealloc
{
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
 
    [self InitWithSubViews];
}



#pragma mark -UI
- (void)InitWithSubViews
{
    
    [self.view addSubview:self.tableView];
    [self refreshBanner];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[CircleTableViewCell class] forCellReuseIdentifier:kCircleCellIdentifier];
        [_tableView registerClass:[MengTableViewCell class] forCellReuseIdentifier:kMengCellIdentifier];
        [self.view addSubview:_tableView];
        
        [_tableView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return _tableView;
}

#pragma mark -Banner
- (void)refreshBanner
{
    __weak typeof(self) weakSelf = self;
    if (!_headView) {
        _headView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWidth, 350)];
        _headView.tapActionBlock = ^(CodingBanner *tappedBanner){
            [weakSelf goToBanner:tappedBanner];
        };
        
        _headView.buttonActionBlock = ^(NSInteger index){
            [weakSelf buttonSelected:index];
        };
        
        _headView.producActionBlock = ^(NSInteger index){
            [weakSelf productSelect:index];
        };
        
        _tableView.tableHeaderView = _headView;
    }
    
    [[AFNetAPI sharedManager] request_BannersWithBlock:^(id data, NSError *error) {
        if (data) {
            weakSelf.headView.adListArray = data;
        }
    }];
}

#pragma mark -TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [CircleTableViewCell cellHeightWithObj:nil];
    }else{
        return [MengTableViewCell cellHeightWithObj:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
   
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWidth, 30)];
    view.backgroundColor = [UIColor yellowColor];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 2, 26, 26)];
    img.backgroundColor = [UIColor redColor];
    [img doCircleFrame];
    [view addSubview:img];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(img.frame) + 5, 0, 40, 30)];
    section == 0 ? (label.text = @"圈子") : (label.text = @"医萌通");
    label.font = [UIFont systemFontOfSize:13];
    [view addSubview:label];
    
  
    return view;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        CircleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCircleCellIdentifier forIndexPath:indexPath];
        [tableView addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:0 hasSectionLine:YES];
        return cell;
    }else{
        MengTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMengCellIdentifier forIndexPath:indexPath];
        if (indexPath.row == 0) {
            cell.cellType = 1;
        }else if(indexPath.row == 1){
            cell.cellType = 0;
        }else{
            cell.cellType = 2;
        }
        [tableView addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:0 hasSectionLine:YES];
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//uitableview处理section的不悬浮，禁止section停留的方法，主要是这段代码
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 50;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
    
}

#pragma mark -event response
- (void)goToBanner:(CodingBanner *)tapedBanner{
    //点击轮播方法
    
    //[self analyseLinkStr:tapedBanner.link];
}

- (void)buttonSelected:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            NSLog(@"云问诊");
            AdddFriendController *vc = [[AdddFriendController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
            NSLog(@"健康产品");
            break;
        case 2:
            NSLog(@"圈子");
            break;
        case 3:
            NSLog(@"医萌通");
            break;
        default:
            break;
    }
}

- (void)productSelect:(NSInteger)index
{
    switch (index) {
        case 0:
            NSLog(@"养老产品");
            break;
        case 1:
            NSLog(@"首发新品");
            break;
        case 2:
            NSLog(@"敬老宣传");
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
