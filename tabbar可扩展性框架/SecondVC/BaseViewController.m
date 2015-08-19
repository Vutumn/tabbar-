//
//  BaseViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/24.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "BaseViewController.h"
#import "MyTabbarViewController.h"
#import "CIRFirstViewcontroller.h"
#import "CIRSecondViewController.h"
#import "CIRThirdViewController.h"

@interface BaseViewController ()
@property (nonatomic, strong) UIScrollView *headScrollView;
@property (nonatomic, strong) CIRFirstViewcontroller *firstVC;
@property (nonatomic, strong) CIRSecondViewController *secondVC;
@property (nonatomic, strong) CIRThirdViewController *thirdVC;
@property (nonatomic, strong) UIViewController *currentVC;

@end

@implementation BaseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"第二个";
        self.headArray = [NSMutableArray arrayWithObjects:@"财经", @"科技", @"体育", @"头条", @"娱乐", nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
   
    //self.automaticallyAdjustsScrollViewInsets = NO;
    [self initWithSubViews];

    [_headScrollView addLineForTop:YES bottom:YES];

}

#pragma mark -UI
- (void)initWithSubViews
{
    if (!_headScrollView) {
        _headScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, KDeviceWidth, 60)];
        _headScrollView.backgroundColor = [UIColor clearColor];
        _headScrollView.contentSize = CGSizeMake(100 * _headArray.count, 0);
        //_headScrollView.backgroundColor = [UIColor redColor];
        _headScrollView.bounces = NO;
        _headScrollView.pagingEnabled = YES;

        [self.view addSubview:_headScrollView];
        
        for (NSUInteger i = 0; i < _headArray.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(0 + i*100, 0, 100, 60);
            [button setTitle:[self.headArray objectAtIndex:i] forState:UIControlStateNormal];
            button.tag = i + 100;
            button.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
            [button addTarget:self action:@selector(didClickHeadButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.headScrollView addSubview:button];
        }
    }
    
    _firstVC = [CIRFirstViewcontroller new];
    [_firstVC.view setFrame:CGRectMake(0, CGRectGetMaxY(_headScrollView.frame), KDeviceWidth, KDeviceHeight - CGRectGetMaxY(_headScrollView.frame))];
     
    [self addChildViewController:_firstVC];
    
    _secondVC = [CIRSecondViewController new];
    [_secondVC.view setFrame:CGRectMake(0, CGRectGetMaxY(_headScrollView.frame), KDeviceWidth, KDeviceHeight - CGRectGetMaxY(_headScrollView.frame) - 49)];
    
    
    _thirdVC = [CIRThirdViewController new];
    [_thirdVC.view setFrame:CGRectMake(0, CGRectGetMaxY( _headScrollView.frame), KDeviceWidth, KDeviceHeight - CGRectGetMaxY(_headScrollView.frame) - 49)];
    
    [self.view addSubview:_firstVC.view];
    
    self.currentVC = _firstVC;
}


#pragma mark -private
- (void)didClickHeadButtonAction:(UIButton *)sender
{
    BOOL aa = self.currentVC == _firstVC && sender.tag == 100;
    BOOL bb = self.currentVC == _secondVC && sender.tag == 101;
    BOOL cc = self.currentVC == _thirdVC && sender.tag == 102;
    
    if (aa || bb || cc) {
        return;
    }
    
    
        switch (sender.tag) {
            case 100:
                [self replaceController:self.currentVC newController:self.firstVC];
                break;
            case 101:
                [self replaceController:self.currentVC newController:self.secondVC];
                break;
            case 102:
                [self replaceController:self.currentVC newController:self.thirdVC];
                break;
            default:
                break;
        }
}

//  切换各个标签内容
- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController
{
    /**
     *            着重介绍一下它
     *  transitionFromViewController:toViewController:duration:options:animations:completion:
     *  fromViewController      当前显示在父视图控制器中的子视图控制器
     *  toViewController        将要显示的姿势图控制器
     *  duration                动画时间(这个属性,old friend 了 O(∩_∩)O)
     *  options                 动画效果(渐变,从下往上等等,具体查看API)
     *  animations              转换过程中得动画
     *  completion              转换完成
     */
    
    [self addChildViewController:newController];
    [self transitionFromViewController:oldController toViewController:newController duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        
        if (finished) {
            
            [newController didMoveToParentViewController:self];
            [oldController willMoveToParentViewController:nil];
            [oldController removeFromParentViewController];
            self.currentVC = newController;
            
        }else{
            
            self.currentVC = oldController;
            
        }
    }];
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
