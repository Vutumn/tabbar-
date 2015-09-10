//
//  UITableView+Common.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/26.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "UITableView+Common.h"
#import "UIColor+Common.h"

@implementation UITableView (Common)

- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace
{
    [self addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:leftSpace hasSectionLine:YES];
}

- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace withRightSpace:(CGFloat)rightSpace{
    [self addLineforPlainCell:cell forRowAtIndexPath:indexPath withLeftSpace:leftSpace withRightSpace:rightSpace hasSectionLine:YES];
}

- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace hasSectionLine:(BOOL)hasSectionLine
{
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    CGRect bounds = CGRectInset(cell.bounds, 0, 0);
    
    CGPathAddRect(pathRef, nil, bounds);
    
    layer.path = pathRef;
    
    CFRelease(pathRef);
    
    layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
    
    CGColorRef lineColor = [UIColor colorWithHexString:@"0xdddddd"].CGColor;
    CGColorRef sectionLineColor = lineColor;
    
    if (indexPath.row == 0 && indexPath.row == [self numberOfRowsInSection:indexPath.section] - 1) {
        //只有一个cell，加上长线，下长线
        if (hasSectionLine) {
            [self layer:layer addLineUp:YES andLong:YES andColor:sectionLineColor andBounds:bounds withLeftSpace:0 withRightSpace:0];
        }
        [self layer:layer addLineUp:NO andLong:NO andColor:lineColor andBounds:bounds withLeftSpace:leftSpace withRightSpace:0];
    }else if (indexPath.row == [self numberOfRowsInSection:indexPath.section] - 1){
        // 最后一个cell，加下长线
        if (hasSectionLine) {
            [self layer:layer addLineUp:NO andLong:YES andColor:sectionLineColor andBounds:bounds withLeftSpace:0 withRightSpace:0];
        }
    }else{
        //中间的cell,只加下短线
        [self layer:layer addLineUp:NO andLong:NO andColor:lineColor andBounds:bounds withLeftSpace:leftSpace withRightSpace:0];
    }
    UIView *testView = [[UIView alloc] initWithFrame:bounds];
    [testView.layer insertSublayer:layer above:0];
    cell.backgroundView = testView;
}

- (void)layer:(CALayer *)layer addLineUp:(BOOL)isUp andLong:(BOOL)isLong andColor:(CGColorRef)color andBounds:(CGRect)bounds withLeftSpace:(CGFloat)leftSpace withRightSpace:(CGFloat)rightSpace{
    
    CALayer *lineLayer = [[CALayer alloc] init];
    CGFloat lineHeight = (1.0f / [UIScreen mainScreen].scale);
    CGFloat left, top;
    if (isUp) {
        top = 0;
    }else{
        top = bounds.size.height - lineHeight;
    }
    
    if (isLong) {
        left = 0;
    }else{
        left = leftSpace;
    }
    lineLayer.frame = CGRectMake(CGRectGetMinX(bounds) + left, top, bounds.size.width - left - rightSpace, lineHeight);
    lineLayer.backgroundColor = color;
    [layer addSublayer:lineLayer];
    
}

- (void)addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace withRightSpace:(CGFloat)rightSpace hasSectionLine:(BOOL)hasSectionLine
{
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    CGRect bounds = CGRectInset(cell.bounds, 0, 0);
    
    CGPathAddRect(pathRef, nil, bounds);
    
    layer.path = pathRef;
    
    CFRelease(pathRef);
    
    layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
    
    CGColorRef lineColor = [UIColor colorWithHexString:@"0xdddddd"].CGColor;
    CGColorRef sectionLineColor = lineColor;
    
    if (indexPath.row == 0 && indexPath.row == [self numberOfRowsInSection:indexPath.section] - 1) {
        //只有一个cell，加上长线，下长线
        if (hasSectionLine) {
            [self layer:layer addLineUp:YES andLong:YES andColor:sectionLineColor andBounds:bounds withLeftSpace:0 withRightSpace:0];
        }
        [self layer:layer addLineUp:NO andLong:NO andColor:lineColor andBounds:bounds withLeftSpace:leftSpace withRightSpace:rightSpace];
    }else if (indexPath.row == [self numberOfRowsInSection:indexPath.section] - 1){
        // 最后一个cell，加下长线
        if (hasSectionLine) {
            [self layer:layer addLineUp:NO andLong:YES andColor:sectionLineColor andBounds:bounds withLeftSpace:0 withRightSpace:0] ;
        }
    }else{
        //中间的cell,只加下短线
        [self layer:layer addLineUp:NO andLong:NO andColor:lineColor andBounds:bounds withLeftSpace:leftSpace withRightSpace:rightSpace];
    }
    UIView *testView = [[UIView alloc] initWithFrame:bounds];
    [testView.layer insertSublayer:layer above:0];
    cell.backgroundView = testView;
    
}


@end

