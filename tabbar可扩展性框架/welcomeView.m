//
//  welcomeView.m
//  discountAssistant_iOS
//
//  Created by 刘旭 on 15/8/5.
//  Copyright (c) 2015年 刘旭. All rights reserved.
//

#import "welcomeView.h"
#import "Header.h"

static NSString *const kCellIdentifier = @"kCellIdentifier";

@implementation welcomeView
{
    UITableView *_tableView;
}

- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor purpleColor];
        [self getLayout];

    }
    return self;
}

#pragma mark -UI
- (void)getLayout {
    UIView *view = [UIView new];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.width.equalTo(self);
        make.height.equalTo(@(64));
    }];
    
    UIButton *button = [UIButton new];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"跳过此步骤" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchDown];
    [view addSubview:button];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(30);
        make.right.equalTo(self.mas_right).offset(-10);
    }];
    
    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom);
        make.left.right.bottom.equalTo(self);
    }];
}

#pragma mark -tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    return cell;
}

#pragma mark -pucblic
- (void)buttonAction {
    [UIView animateWithDuration:1 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"welcome" object:nil];
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
