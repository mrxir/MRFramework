//
//  NSObject+Extension.h
//  MRFramework
//
//  Created by MrXir on 2017/6/27.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

@end


/**
 property extension
 */
@interface NSObject (Property)

@property (nonatomic, strong) NSIndexPath *objectIndexPath;

- (NSIndexPath *)objectIndexPath;

- (void)setObjectIndexPath:(NSIndexPath *)objectIndexPath;

@end


/**
 object to dictionary converter
 */
@interface NSObject (ModelConverter)

/**
 返回该对象的属性和值的字典
 
 @return NSDictionary
 */

+ (NSDictionary *)propertyWithObject:(__kindof NSObject *)object;


@end
