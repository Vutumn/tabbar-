//
//  FifthViewController.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/27.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "FifthViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DrawRectView.h"
#import "Header.h"
#import <POP.h>

#define WIDTH 50

@interface FifthViewController ()

@end

@implementation FifthViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"第五个";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

//    CAShapeLayer *layer = [CAShapeLayer new];
//    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    
//    [path moveToPoint:CGPointMake(100, 180)];
//    
//    [path addLineToPoint:CGPointMake(180, 100)];
//    layer.path = path.CGPath;
//    
   // [path addLineToPoint:CGPointMake(60, 80)];
    //[[UIColor blackColor] setStroke];
    //[path closePath];
    
   // [self drawMyLayeer];
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    blueLayer.delegate = self;
    
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
   // testView.backgroundColor = [UIColor redColor];
    testView.center = self.view.center;
    
    [testView.layer addSublayer:blueLayer];
   //DrawRectView *view = [[DrawRectView alloc] initWithFrame:CGRectMake(0, 100, KDeviceWidth, 200)];
   // view.backgroundColor = [UIColor redColor];
    
   [self.view addSubview:testView];
    
   // [blueLayer display];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
    
}

- (void)drawMyLayeer
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    //获得根图层
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor colorWithRed:0 green:146.0 / 255.0 blue:1.0 alpha:1.0].CGColor;
    
    //设置中心点
    layer.position = CGPointMake(size.width / 2, size.height / 2);
    
    //设置大小
    layer.bounds = CGRectMake(0, 0, WIDTH, WIDTH);
    layer.cornerRadius = WIDTH / 2;
    //
    layer.shadowColor = [UIColor grayColor].CGColor;
    layer.shadowOffset = CGSizeMake(2, 2);
    layer.shadowOpacity = .9;
    
    [self.view.layer addSublayer:layer];
    
}

#pragma mark -点击放大
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CALayer *layer = self.view.layer.sublayers[0];
    CGFloat width = layer.bounds.size.width;
    if (width == WIDTH) {
        width = width * 4;
    }else{
        width = WIDTH;
    }
    layer.bounds = CGRectMake(0, 0, width, width);
    layer.position = [touch locationInView:self.view];
    layer.cornerRadius = width / 2;

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
