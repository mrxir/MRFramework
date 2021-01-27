//
//  UIControl+MRExtension.h
//  MRFramework
//
//  Created by MrXir on 2017/6/27.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (MRExtension)

@end



#pragma mark - event handler extension

#import <objc/runtime.h>

typedef void(^ControlEventsHandler)(__kindof UIControl *control);

/**
 event handler extension
 */
@interface UIControl (EventsHandler)

/**
 添加事件（覆盖原有的）并在触发时执行 ControlEventHandler
 
 @param events 事件类型
 @param completion 事件block
 */
- (void)handleWithEvents:(UIControlEvents)events completion:(ControlEventsHandler)completion;

/**
 添加事件（不会覆盖原有事件）并在触发时执行 ControlEventHandler
 
 @param events 事件类型
 @param completion 事件block
 */
- (void)addWithEvents:(UIControlEvents)events completion:(ControlEventsHandler)completion;

@end
