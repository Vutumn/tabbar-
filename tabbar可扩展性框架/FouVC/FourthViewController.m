//
//  FourthViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/27.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "FourthViewController.h"
#import "PatientsTableViewCell.h"
#import "PDetailViewController.h"
#import "CloudAskViewController.h"


@interface FourthViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *charArr;

@end

@implementation FourthViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"患者";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _charArr = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"#", nil];

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
        [self.view addSubview:_tableView];
    
        [_tableView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return _tableView;
}

#pragma mark -tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2 + _charArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1;
    }else{
        return 22;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section != 0) {
        UIView *views = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWidth, 22)];
        views.backgroundColor = kSectionHeaderBgColor;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, KDeviceWidth - 10, 22)];
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.textColor = KTextColor80;
        section == 1 ? (titleLabel.text = @"管理患者") : (titleLabel.text = _charArr[section - 2]);
        [views addSubview:titleLabel];
        return views;
    }else{
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 56;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PatientsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPatientsCellIdentifier forIndexPath:indexPath];
   // cell.textLabel.text = @"我的云接诊";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0 && indexPath.section == 0) {
        CloudAskViewController *vc = [[CloudAskViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        PDetailViewController *vc = [[PDetailViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];

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
