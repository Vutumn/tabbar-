//
//  UIViewController+AOP.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/9/10.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "UIViewController+AOP.h"
#import <objc/runtime.h>

@implementation UIViewController (AOP)

+ (void)load
{
    swizzleMethod([self class], @selector(viewDidAppear:), @selector(swizzled_viewDidAppear:));
}

- (void)swizzled_viewDidAppear:(BOOL)animated
{
    [self swizzled_viewDidAppear:animated];
    NSLog(@"我是AOP----%@", [self class]);
}

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}



@end
