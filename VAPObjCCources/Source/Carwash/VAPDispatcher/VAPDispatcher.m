//
//  VAPDispatcher.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 26.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPDispatcher.h"
#import "VAPEmployee.h"
#import "VAPCar.h"

#import "VAPCarwasher.h"
#import "VAPAccountant.h"

@interface VAPDispatcher ()
@property (nonatomic, retain)    NSMutableArray  *handlers;
@property (nonatomic, retain)    NSMutableArray  *queue;
@end

@implementation VAPDispatcher

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.handlers = nil;
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.handlers = [NSMutableArray array];
        self.queue = [NSMutableArray array];
    }
    
    return self;
}


#pragma mark -
#pragma mark Public

#pragma mark -
#pragma mark Extension

- (void)enqueue:(id)object {
    @synchronized (self.queue) {
        [self.queue addObject:object];
    }
}

- (id)dequeue {
    id object = nil;
    @synchronized(self.queue) {
        object = [self.queue firstObject];
        [self.queue removeObject:object];
    }
    
    return object;
}

- (VAPEmployee *)freeHandler {
    VAPEmployee *freeHandler = nil;
    NSArray *handlers = self.handlers;
    @synchronized(handlers) {
        for (VAPEmployee *employee in handlers) {
            if (VAPStateFree == employee.state) {
                freeHandler = employee;
                freeHandler.state = VAPStateBeginWork;
            }
        }
    }
    
    return freeHandler;
}

- (void)addHandler:(id)handler {
    @synchronized(self.handlers) {
        [self.handlers addObject:handler];
        [handler addObserver:self];
    }
}

- (void)removeHandler:(id)handler {
    @synchronized(self.handlers) {
        if ([self.handlers containsObject:handler]) {
            [self.handlers removeObject:handler];
        }
    }
}

- (BOOL)isEmptyQueue {
    @synchronized(self.queue) {
        return self.queue.count == 0;
    }
}

#pragma mark -
#pragma mark <VAPEmployeeObserver>

- (void)employeeBecameFree:(VAPEmployee *)employee {
    if (![self isEmptyQueue]) {
        id object = [self dequeue];
        [employee processObject:object];
    }
}

@end
