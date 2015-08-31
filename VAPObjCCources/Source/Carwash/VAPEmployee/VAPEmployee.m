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
@property(nonatomic, retain) NSRecursiveLock *lock;

- (SEL)selectorForState:(VAPState)state;

@end

@implementation VAPEmployee


- (void)dealloc {
    self.lock = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.lock = [[NSRecursiveLock alloc] init];
    }
    return self;
}



#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificOperationWithObject:(id) object {
    if (VAPStateFree == self.state) {
        [self beginJob];
        [self performSelectorInBackground:@selector(doJobWithObject:) withObject:object];
    }
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

#pragma mark -
#pragma mark VAPMoneyFlowProtocol

- (BOOL)isAbleToPay:(NSUInteger)cost {
    return self.wallet >= cost;
}

- (void)payTo:(id<VAPMoneyFlowing>)object withCost:(NSUInteger)cost {
//    NSRecursiveLock *lock = self.lock;
//    [lock lock];
    
    self.wallet -= cost;
    object.wallet += cost;
    
//    [lock unlock];
}

@end
