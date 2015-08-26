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

- (SEL)selectorForState:(VAPState)state;

@end

@implementation VAPEmployee



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
    self.wallet -= cost;
    object.wallet += cost;
}

@end
