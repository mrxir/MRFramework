//
//  NSString+Extension.h
//  MRFramework
//
//  Created by MrXir on 2017/6/27.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

@end



#pragma mark - verify extension

/**
 verify extension
 */
@interface NSString (Verify)

/**
 返回这个对象是否是一个有效的字符串, 如果字符串等于 "null" 或 "(null)" 或 "<null>" 则判定为无效字符串.
 
 @return BOOL
 */
+ (BOOL)isValidString:(id)obj;

@end
