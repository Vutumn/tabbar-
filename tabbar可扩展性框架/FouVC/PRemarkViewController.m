//
//  PRemarkViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/9.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "PRemarkViewController.h"

@interface PRemarkViewController()<UITextViewDelegate>
@property (nonatomic, strong)UITextView *contentText;

@end

@implementation PRemarkViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"备注";
    }
    return self;
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
    [self.view addSubview:self.contentText];

}

- (UITextView *)contentText
{
    if (!_contentText) {
        _contentText = [UITextView new];
        _contentText.delegate = self;
        _contentText.text = @"热热热放方法和宽容时代是发呆发呆啊打开公开课去二中默多克公开反对美国对开放港口地方而去去奋斗";
        _contentText.font = [UIFont systemFontOfSize:15];
        _contentText.textColor = KTextColor66;
        [_contentText becomeFirstResponder];
        [self.view addSubview:_contentText];
        
        [_contentText makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(10);
            make.right.equalTo(self.view).offset(-10);
            make.top.equalTo(self.view).offset(15);
            make.bottom.equalTo(self.view).offset(-15);
        }];
    }
    return _contentText;
}

@end
