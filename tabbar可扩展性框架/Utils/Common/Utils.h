//
//  Utils.h
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/1.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//


/**
 *  这里主要放通用的工具类，杂七杂八的东西
 *  放置那些无所安顿的方法
 */

#import <UIKit/UIKit.h>


@interface Utils : NSObject

//把表情等文本转换成普通的NSString类型
+ (NSString *)convertRichTextToRawText:(UITextView *)textField;

//把nsstring类型转换成认识的表情
+ (NSAttributedString *)emojiStringFromRawString:(NSString *)rawString;

@end
