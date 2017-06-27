//
//  NSObject+Extension.m
//  MRFramework
//
//  Created by MrXir on 2017/6/27.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)

@end


#import <objc/runtime.h>

@implementation NSObject (Property)

@dynamic objectIndexPath;

- (NSIndexPath *)objectIndexPath
{
    return objc_getAssociatedObject(self, @"objectIndexPath");
}

- (void)setObjectIndexPath:(NSIndexPath *)objectIndexPath
{
    objc_setAssociatedObject(self, @"objectIndexPath", objectIndexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end


@implementation NSObject (ModelConverter)

+ (NSDictionary *)propertyWithObject:(__kindof NSObject *)object
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    unsigned int propertyCount;
    
    objc_property_t *properties = class_copyPropertyList([object class], &propertyCount);
    
    for (int i=0; i<propertyCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        id value = [self getObjectInternalValue:[object valueForKey:propertyName]];
        dictionary[propertyName] = value;
    }
    
    free(properties);
    return dictionary;
}

- (id)getObjectInternalValue:(id)obj
{
    if (!obj
        || [obj isKindOfClass:[NSNull class]]
        || [obj isKindOfClass:[NSNumber class]]
        || [obj isKindOfClass:[NSString class]]) {
        
        return obj;
    }
    
    if ([obj isKindOfClass:[NSArray class]]) {
        NSArray *arrayObj = obj;
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:arrayObj.count];
        for (int i=0; i<arrayObj.count; i++) {
            [array setObject:[self getObjectInternalValue:[arrayObj objectAtIndex:i]] atIndexedSubscript:i];
        }
        
        return array;
    }
    
    if ([obj isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dictionaryObj = obj;
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithCapacity:[dictionaryObj count]];
        for (NSString *key in dictionaryObj.allKeys) {
            [dictionary setObject:[self getObjectInternalValue:[dictionaryObj objectForKey:key]] forKey:key];
        }
        
        return dictionary;
    }
    
    return obj;
    
}

@end
