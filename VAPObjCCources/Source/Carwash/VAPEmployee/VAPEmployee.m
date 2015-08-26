//
//  VAPEmployee.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEmployee.h"
#import "VAPDirector.h"
#import "VAPCarwasher.h"
#import "VAPAccountant.h"

@interface VAPEmployee ()
@property(nonatomic, retain) NSMutableArray *queue;

- (SEL)selectorForState:(VAPState)state;
- (id)firstEmployee;

@end

@implementation VAPEmployee

- (void)dealloc {
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.queue = [NSMutableArray array];
    }
    
    return self;
}



#pragma mark -
#pragma mark Accesors


#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificOperationWithObject:(id) object {
    if (VAPStateFree == self.state) {
        [self beginJob];
        [self performEmployeeSpecificOperationWithObjectInBackground:object];
    }
}

- (void)performEmployeeSpecificOperationWithObjectInBackground:(id<VAPMoneyFlowing>)object {
    [self performSelectorInBackground:@selector(doJobWithObject:) withObject:object];
}

- (void)doJobWithObject:(id<VAPMoneyFlowing>)object {
    [self performSelectorOnMainThread:@selector(finishJob) withObject:nil waitUntilDone:YES];
}

- (void)beginJob {

    _state = VAPStateBeginWork;
}

- (void)finishJob {
    _state = VAPStateEndWork;
    [self notifyObserversWithSelector:[self selectorForState:self.state]];
}

- (void)mayBeFree {
    _state = VAPStateFree;
    if (0 != self.queue.count) {
        [self performEmployeeSpecificOperationWithObject:[self firstEmployee]];
    }
    [self notifyObserversWithSelector:[self selectorForState:self.state]];
}

#pragma mark -
#pragma mark Extension

- (SEL)selectorForState:(VAPState)state {
    switch (state) {
        case VAPStateEndWork:
            return @selector(employeeDidEndJob:);
            
        case VAPStateFree:
            return @selector(didEmployeeFinishJob:);
            
        default:
            break;
    }
    return nil;
}

- (id)firstEmployee {
    id employee = nil;
    @synchronized(self.queue) {
        employee = [self.queue firstObject];
        [self.queue removeObject:employee];
    }
    
    return employee;
}

#pragma mark -
#pragma mark VAPEmployeeObserver

- (void)employeeDidEndJob:(VAPEmployee *)employee {
    if (VAPStateFree == self.state && 0 == self.queue.count) {
        [self performEmployeeSpecificOperationWithObject:employee];
    } else {
        @synchronized(self.queue) {
            [self.queue addObject:employee];
        }
    }
}

#pragma mark -
#pragma mark VAPMoneyFlowProtocol

- (BOOL)isAbleToPay:(NSUInteger)cost {
    return self.wallet >= cost;
}

- (void)payTo:(id<VAPMoneyFlowing>)object withCost:(NSUInteger)cost {
    self.wallet -= cost;
    object.wallet += cost;
}

@end
