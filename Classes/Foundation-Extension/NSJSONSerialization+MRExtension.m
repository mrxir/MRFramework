//
//  NSJSONSerialization+MRExtension.m
//  MRFramework
//
//  Created by MrXir on 2017/6/27.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import "NSJSONSerialization+MRExtension.h"

@implementation NSJSONSerialization (MRExtension)

@end



#pragma mark - string serialization extension

@implementation NSJSONSerialization (ObjectToString)

+ (NSString *)stringWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError *__autoreleasing *)error
{
    if ([NSJSONSerialization isValidJSONObject:obj]) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:obj options:opt error:error];
        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    } else {
        return nil;
    }
}

@end

