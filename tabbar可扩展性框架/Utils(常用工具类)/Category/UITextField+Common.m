//
//  UITextField+Common.m
//  tabbar可扩展性框架
//
//  Created by zzxcc on 15/8/1.
//  Copyright (c) 2015年 Vutumn. All rights reserved.
//

#import "UITextField+Common.h"
#import <objc/runtime.h>

@implementation UITextField (Common)

- (NSString *)convertRichTextToRawText
{
    NSMutableString *rawText = [[NSMutableString alloc] initWithString:self.text];
    [self.attributedText enumerateAttribute:NSAttachmentAttributeName
                                         inRange:NSMakeRange(0, self.attributedText.length)
                                         options:NSAttributedStringEnumerationReverse
                                      usingBlock:^(NSTextAttachment *attachment, NSRange range, BOOL *stop) {
                                          if (!attachment) {return;}
                                          
                                          NSString *emojiStr = objc_getAssociatedObject(attachment, @"emoji");
                                          [rawText insertString:emojiStr atIndex:range.location];
                                      }];
    NSString *pattern = @"[\ue000-\uf8ff]|[\\x{1f300}-\\x{1f7ff}]|\\x{263A}\\x{FE0F}|☺";
    NSError *error = nil;
    NSRegularExpression *re = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSArray *resultsArray = [re matchesInString:self.text options:0 range:NSMakeRange(0, self.text.length)];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"emojiToText" ofType:@"plist"];
    NSDictionary *emojiToText = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    for (NSTextCheckingResult *match in [resultsArray reverseObjectEnumerator]) {
        NSString *emoji = [self.text substringWithRange:match.range];
        [rawText replaceCharactersInRange:match.range withString:emojiToText[emoji]];
    }
    
    return [rawText stringByReplacingOccurrencesOfString:@"\U0000fffc" withString:@""];
    
}


@end
