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

- (void) setLongString:(NSString *)str withFitWidth:(CGFloat)width maxHeight:(CGFloat)maxHeight{
    self.numberOfLines = 0;
    CGSize resultSize = [str getSizeWithFont:self.font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)];
    CGFloat resultHeight = resultSize.height;
    if (maxHeight > 0 && resultHeight > maxHeight) {
        resultHeight = maxHeight;
    }
    CGRect frame = self.frame;
    frame.size.height = resultHeight;
    [self setFrame:frame];
    self.text = str;
}

- (void) setLongString:(NSString *)str withVariableWidth:(CGFloat)maxWidth{
    self.numberOfLines = 0;
    self.text = str;
    
    CGSize resultSize = [str getSizeWithFont:self.font constrainedToSize:CGSizeMake(maxWidth, CGFLOAT_MAX)];
    CGRect frame = self.frame;
    frame.size.height = resultSize.height;
    frame.size.width = resultSize.height;
    [self setFrame:frame];
    
}


//CGSize  actualsize =[str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;


@end
