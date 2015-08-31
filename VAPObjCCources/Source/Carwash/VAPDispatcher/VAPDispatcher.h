//
//  VAPDispatcher.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 26.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VAPEmployee;

@interface VAPDispatcher : NSObject

- (void)enqueue:(id)object;
- (id)dequeue;

- (VAPEmployee *)freeHandler;
- (void)addHandler:(id)handler;

- (BOOL)isEmptyQueue;

@end
