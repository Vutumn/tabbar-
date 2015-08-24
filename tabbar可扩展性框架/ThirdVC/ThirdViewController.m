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

static NSString *const kCellIdentifier = @"kCellIdentifier";

@interface ThirdViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) AutoSlideScrollView *mySlideView;
@property (nonatomic, strong) NSArray *adListArray;
@property (nonatomic, strong) NSMutableArray *imageViewList;

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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
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
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
        _tableView.tableHeaderView = self.mySlideView;
        [self.view addSubview:_tableView];
        
        [_tableView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return _tableView;
}

- (AutoSlideScrollView *)mySlideView
{
    if (!_mySlideView) {
        __weak typeof(self) weakSelf = self;
        _mySlideView = [[AutoSlideScrollView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWidth, 150) animationDuration:3];
        _mySlideView.layer.masksToBounds = YES;
        _mySlideView.scrollView.scrollsToTop = NO;
        _mySlideView.totalPagesCount = ^NSInteger(){
            return weakSelf.adListArray.count;
        };
        
        _mySlideView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
            if (weakSelf.adListArray.count > pageIndex) {
                UIImageView *imageView = [weakSelf p_reuseViewForIndex:pageIndex];
                CodingBanner *curBanner = weakSelf.adListArray[pageIndex];
                [imageView sd_setImageWithURL:[curBanner.image urlWithCodePath]];
                return imageView;
            }else{
                return [UIView new];
            }
        };
        _mySlideView.currentPageIndexChangeBlock = ^(NSInteger currentPageIndex){
            if (weakSelf.adListArray.count > currentPageIndex) {
                //pagecontrol滚动
//                weakSelf.myPageControl.currentPage = currentPageIndex;
                
            }
        };
        
    }
    return _mySlideView;
}

#pragma mark -TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? 150 : 0.1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    return cell;
}

#pragma mark -private
- (UIImageView *)p_reuseViewForIndex:(NSInteger)pageIndex{
    if (!_imageViewList) {
        _imageViewList = [[NSMutableArray alloc] initWithCapacity:3];
        for (int i = 0; i < 3; i++) {
            UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(kPaddingLeftWidth, 10, KDeviceWidth - 2 * kPaddingLeftWidth, (KDeviceWidth - 2) * 0.3)];
            view.backgroundColor = [UIColor colorWithHexString:@"0xe5e5e5"];
            view.clipsToBounds = YES;
            view.contentMode = UIViewContentModeScaleAspectFill;
            [_imageViewList addObject:view];
        }
    }
    UIImageView *imageView;
    NSInteger currentPageIndex = self.mySlideView.currentPageIndex;
    if (pageIndex == currentPageIndex) {
        imageView = _imageViewList[1];
    }else if (pageIndex == currentPageIndex + 1
              || (labs(pageIndex - currentPageIndex) > 1 && pageIndex < currentPageIndex)){
        imageView = _imageViewList[2];
    }else{
        imageView = _imageViewList[0];
    }
    return imageView;
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
