//
//  EmojiViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/31.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "EmojiViewController.h"

@interface EmojiViewController ()<UITextFieldDelegate>
@property (nonatomic, strong)UITextField *field;
@property (nonatomic, strong)UILabel *changLabel;

@end

@implementation EmojiViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"emoji转换";
        self.view.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter ]addObserver:self selector:@selector(textChange:) name:UITextFieldTextDidChangeNotification object:nil];

}


#pragma mark -initUI
- (void)loadView
{
    [super loadView];
    _field = [UITextField new];
    _field.delegate = self;
    _field.backgroundColor = [UIColor redColor];
    [self.view addSubview:_field];
    
    [_field makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(@200);
        make.height.equalTo(@50);
    }];
    
    
    _changLabel = [UILabel new];
    _changLabel.backgroundColor = [UIColor blackColor];
    _changLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _changLabel.font = [UIFont boldSystemFontOfSize:15];
    [_changLabel setAttributedText:[Utils emojiStringFromRawString:@"[微笑]"]];
    [self.view addSubview:_changLabel];
    
    NSLog(@"%@",[Utils emojiStringFromRawString:@"[强]"]);

    
    [_changLabel makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_field.top).offset(-10);
        make.centerX.equalTo(self.view);
        make.width.height.equalTo(_field);
    }];
}

#pragma mark -private
- (void)textChange:(id)sender
{
   // _changLabel.text = _field.text;
    
   // NSString *convertString = [Utils convertRichTextToRawText:_field];
    NSLog(@"%@",_changLabel.text);
    //NSLog(@"%@", convertString);
}

#pragma mark -keyBoardDelegate
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    [_field resignFirstResponder];
    
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
