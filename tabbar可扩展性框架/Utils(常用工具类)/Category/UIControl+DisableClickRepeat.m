//
//  UIControl+DisableClickRepeat.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/14.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "UIControl+DisableClickRepeat.h"
#import <objc/runtime.h>

@implementation UIControl (DisableClickRepeat)

//- (NSTimeInterval)zs_acceptEventInterval
//{
//    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
//}
//- (void)setzs_acceptEventInterval:(NSTimeInterval)zs_acceptEventInterval
//{
//    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(zs_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//+ (void)load
//{
//    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
//    Method b = class_getInstanceMethod(self, @selector(zs_sendAction:to:forEvent:));
//    method_exchangeImplementations(a, b);
//}
//
//- (void)zs_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
//{
//   
//}

@end
