//
//  VAPEmployee.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEmployee.h"
#import "VAPDirector.h"

@interface VAPEmployee ()

- (void)beginJob;
- (void)finishJob;

- (SEL)selectorForState:(VAPState)state;

@end

@implementation VAPEmployee

#pragma mark -
#pragma mark Accesors


#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificOperationWithObject:(id) object {
//    if (VAPStateFree == self.state) {
    if (nil != object) {
        [self beginJob];
        [self doJobWithObject:(id<VAPMoneyFlowing>)object];
        [self finishJob];
        [self mayBeFree];
    }
}

- (void)doJobWithObject:(id<VAPMoneyFlowing>)object {
   
        [object payTo:self withCost:object.wallet];
        uint rand = arc4random_uniform(10) + 2;
        usleep(rand * 1000);
        
        if ([self isKindOfClass:[VAPDirector class]]) {
            NSLog(kVAPDirectorProffit,self.wallet);
        }
}

- (void)beginJob {
    _state = VAPStateBeginWork;
}

- (void)finishJob {
    _state = VAPStateEndWork;
//    [self notifyObserversWithSelector:[self selectorForState:self.state] withObject:self];
    
    [self notifyObserversOnMainThreadWithSelector:[self selectorForState:self.state] withObject:self];
}

- (void)mayBeFree {
    _state = VAPStateFree;
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
#pragma mark VAPEmployeeObserver

- (void)employeeDidEndJob:(VAPEmployee *)employee {
    [self performEmployeeSpecificOperationWithObject:employee];
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
