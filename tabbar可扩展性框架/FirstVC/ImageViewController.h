//
//  ImageViewController.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/7/28.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@interface ImageViewController : BBaseViewController
@property (nonatomic, strong)NSMutableArray *imageArr;
@property (nonatomic, assign)NSUInteger currentIndex;


- (instancetype)initWithImage:(UIImage *)image;
- (instancetype)initWithImageUrl:(NSURL *)imageUrl;

- (instancetype)initWithArr:(NSArray *)imageArr
                   andIndex:(NSInteger)index;

@end
