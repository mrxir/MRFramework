//
//  NSString+Extension.m
//  MRFramework
//
//  Created by MrXir on 2017/6/27.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

@end



#pragma mark - verify extension

@implementation NSString (Verify)

+ (BOOL)isValidString:(id)obj
{
    BOOL isValid = NO;
    
    NSString *someString = (NSString *)obj;
    
    if ([someString respondsToSelector:@selector(isEqualToString:)]) {
        
        if (![someString isEqualToString:@"null"]
            && ![someString isEqualToString:@"(null)"]
            && ![someString isEqualToString:@"<null>"])
        {
            isValid = YES;
        }
        
    }
    
    return isValid;
}

@end
