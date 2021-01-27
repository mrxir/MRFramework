//
//  UIControl+MRExtension.m
//  MRFramework
//
//  Created by MrXir on 2017/6/27.
//  Copyright © 2017年 MrXir. All rights reserved.
//

#import "UIControl+MRExtension.h"

@implementation UIControl (MRExtension)

@end



#pragma mark - event handler extension

@implementation UIControl (EventsHandler)

- (void)setControlEventsHandler:(ControlEventsHandler)controlEventsHandler
{
    objc_setAssociatedObject(self, @"controlEventHandler", controlEventsHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ControlEventsHandler)controlEventsHandler
{
    return objc_getAssociatedObject(self, @"controlEventHandler");
}

- (void)performControlEventsHandler
{
    if (self.controlEventsHandler) self.controlEventsHandler(self);
}

- (void)handleWithEvents:(UIControlEvents)events completion:(ControlEventsHandler)completion
{
    if (completion) {
        
        [self setControlEventsHandler:completion];
        
        if ([[self actionsForTarget:self forControlEvent:events] count] > 0) {
            
            [self removeTarget:self action:@selector(performControlEventsHandler) forControlEvents:events];
        }
        
        [self addTarget:self action:@selector(performControlEventsHandler) forControlEvents:events];
        
    }
    
}

- (void)addWithEvents:(UIControlEvents)events completion:(ControlEventsHandler)completion
{
    if (completion) {
        
        [self setControlEventsHandler:completion];
        
        [self addTarget:self action:@selector(performControlEventsHandler) forControlEvents:events];
        
    }
}


@end
