//
//  AdddFriendController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/27.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "AdddFriendController.h"
#import "AddFriendTableViewCell.h"
#import "FriendInfoViewController.h"

NSString *const kAddFriendCellIdentifier = @"AddFriendCell";


@interface AdddFriendController()<UISearchBarDelegate, UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UISearchBar *mySearchBar;
@property (nonatomic, strong) UISearchDisplayController *mySearchDisplayController;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *charArr;

@end

@implementation AdddFriendController

#pragma mark -life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"添加好友";
        _charArr = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"#", nil];
        [_charArr insertObject:UITableViewIndexSearch atIndex:0];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
//    [self setAutomaticallyAdjustsScrollViewInsets:YES];
//    [self setExtendedLayoutIncludesOpaqueBars:YES];
    [self InitWithSubViews];
}

#pragma mark -UI
- (void)InitWithSubViews
{
    [self.view addSubview:self.mySearchBar];
    [self.view addSubview:self.tableView];
 
}

- (UISearchBar *)mySearchBar
{
    if (!_mySearchBar) {
        _mySearchBar = [UISearchBar new];
        _mySearchBar.delegate = self;
    //    [[_mySearchBar.subviews objectAtIndex:0] removeFromSuperview];
//        [_mySearchBar setBackgroundImage:[self imageWithColor:[UIColor yellowColor]]
//                                                    forBarPosition:0
//                                                        barMetrics:UIBarMetricsDefault];

        [_mySearchBar sizeToFit];
        _mySearchBar.placeholder = @"搜索";
        _mySearchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:_mySearchBar contentsController:self];
        [_mySearchDisplayController.searchResultsTableView registerClass:[AddFriendTableViewCell class] forCellReuseIdentifier:kAddFriendCellIdentifier];
        _mySearchDisplayController.delegate = self;
        _mySearchDisplayController.searchResultsDataSource = self;
        _mySearchDisplayController.searchResultsDelegate = self;
        if (kHigher_iOS_6_1) {
            _mySearchDisplayController.displaysSearchBarInNavigationBar = NO;
        }
    }
    
    return _mySearchBar;
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.tableHeaderView = _mySearchBar;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[AddFriendTableViewCell class] forCellReuseIdentifier:kAddFriendCellIdentifier];
         _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
        _tableView.sectionIndexTrackingBackgroundColor = [UIColor clearColor];
        _tableView.sectionIndexColor = [UIColor colorWithHexString:@"0x666666"];
        [self.view addSubview:_tableView];
        
        [_tableView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return _tableView;
}

#pragma mark -TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _charArr.count;
}

//索引列点击事件
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    if (index == 0) {
        [tableView setContentOffset:CGPointZero animated:NO];
        return NSNotFound;
    }
    return index;
}

//添加索引列
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (tableView == _mySearchDisplayController.searchResultsTableView) {
        return nil;
    }else{
        return _charArr;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (tableView == _mySearchDisplayController.searchResultsTableView) {
        return nil;
    }else{
        if (section != 0) {
            return _charArr[section];
        }else{
            return nil;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == _mySearchDisplayController.searchResultsTableView) {
        return 0;
    }else{
        if (section == 0) {
            return 0;
        }
        return 20;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 0;
    }else{
        return [AddFriendTableViewCell cellHeightWithObj:nil];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    CGFloat height = [self tableView:tableView heightForHeaderInSection:section];
    if (height <= 0) {
        return nil;
    }
    
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWidth, height)];
    headerV.backgroundColor = kColorTableSectionBg;
    
    UILabel *titleL = [[UILabel alloc] init];
    titleL.font = [UIFont systemFontOfSize:12];
    titleL.textColor = [UIColor colorWithHexString:@"0x999999"];
    titleL.text = [self tableView:tableView titleForHeaderInSection:section];
    [headerV addSubview:titleL];
    [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(headerV).insets(UIEdgeInsetsMake(4, kPaddingLeftWidth, 4, kPaddingLeftWidth));
    }];
    return headerV;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddFriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kAddFriendCellIdentifier forIndexPath:indexPath];
    [tableView addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:10 withRightSpace:10];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    FriendInfoViewController *vc = [[FriendInfoViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
  //  [searchBar insertBGColor:[UIColor colorWithHexString:@"0x28303b"]];
    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
   // [searchBar insertBGColor:nil];
    return YES;
}

//- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {
//
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
//}
//    
//- (void)searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller {
//    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//
//}
@end
