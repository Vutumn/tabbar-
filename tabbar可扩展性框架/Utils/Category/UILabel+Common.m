//
//  UILabel+Common.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/3.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "UILabel+Common.h"

@implementation UILabel (Common)

- (void)setString:(NSString *)str  WithMaxWidth:(CGFloat)MaxWidth
{
    self.numberOfLines = 0;
   
    CGSize actualsize = [str getSizeWithFont:self.font constrainedToSize:CGSizeMake(320, 2000)];
    
    CGRect frame = self.frame;
    frame.size.height = actualsize.height;
    frame.size.width = actualsize.width;
 
    self.frame = frame;
    self.text = str;

}



//CGSize  actualsize =[str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;


@end
