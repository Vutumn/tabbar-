//
//  DrawRectView.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/11/26.
//  Copyright © 2015年 Vutumn. All rights reserved.
//

#import "DrawRectView.h"

@interface DrawRectView()
@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) NSMutableArray *objectArr;

@end

@implementation DrawRectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _objectArr = [NSMutableArray array];
        UIGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuTapped:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    //写文字
//    CGContextSetRGBFillColor(context, 1, 0, 0, 1.0); //设置填充颜色
//    UIFont *font = [UIFont boldSystemFontOfSize:15.0];
//    [@"画图:", drawInRect:CGRectMake(10, 20, 80, 20) withFont:font];
//    
//    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1.0);
//    CGContextSetLineWidth(context, 1.0);
//    CGContextAddArc(context, 100, 20, 15, 0, 2*pi, 0);
//    CGContextDrawPath(context, kCGPathStroke);
//    
//    //填充圆，无边框
//    CGContextAddArc(context, 150, 30, 30, 0, 2*pi, 0);
//    CGContextDrawPath(context, kCGPathFill);
//    
    //画贝赛尔曲线
    //二次曲线
//    CGContextMoveToPoint(context, 120, 300);//设置path的起点
//    CGContextAddQuadCurveToPoint(context, 140, 310, 160, 300);//设置贝赛尔曲线的控制点左边和终点坐标
//    CGContextAddLines(<#CGContextRef  _Nullable c#>, <#const CGPoint * _Nullable points#>, <#size_t count#>)
//    CGContextStrokePath(context);
    
//    CGPoint sPoints[3];//坐标点
//    sPoints[0] =CGPointMake(100, 220);//坐标1
//    sPoints[1] =CGPointMake(130, 220);//坐标2
//    sPoints[2] =CGPointMake(130, 160);//坐标3
//    CGContextAddLines(context, sPoints, 3);
//    CGContextDrawPath(context, kCGPathFillStroke);
    CAShapeLayer *layer = [CAShapeLayer new];
    self.path = [UIBezierPath bezierPath];
    
    [self.path moveToPoint:CGPointMake(10, 5)];
    [self.path addLineToPoint:CGPointMake(13, 7)];
    [self.path addLineToPoint:CGPointMake(16, 5)];
    
    
    //layer.path = _path.CGPath;
    
    // [path addLineToPoint:CGPointMake(60, 80)];
    //[[UIColor blackColor] setStroke];
    //[path closePath];
    layer.lineWidth = 1.0;

    [self.path stroke];
    
 
    //[self.layer addSublayer:layer];
//    
}

- (void)menuTapped:(UITapGestureRecognizer *)paramSender {
    CGPoint touchPoint = [paramSender locationInView:self];
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.25];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithControlPoints:0.4 :0.0 :0.2 :1.0]];
    BOOL forward = YES;
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    anim.values = forward ? @[ @0, @(M_PI) ] : @[ @(M_PI), @0 ];
    anim.path = self.path.CGPath;
    if (!anim.removedOnCompletion) {
        [self.layer addAnimation:anim forKey:anim.keyPath];
    } else {
        [self.layer addAnimation:anim forKey:anim.keyPath];
        [self.layer setValue:anim.values.lastObject forKeyPath:anim.keyPath];
    }
    
    [CATransaction commit];
    

    
    
}
@end
