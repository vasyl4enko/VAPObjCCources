//
//  VAPEmployee.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEmployee.h"

@interface VAPEmployee ()

- (void)beginJob;
- (void)mayBeFree;

- (SEL)selectorForState:(VAPState)state;

@end

@implementation VAPEmployee

#pragma mark -
#pragma mark Accesors

- (void)setWallet:(NSUInteger)wallet {
    if (_wallet != wallet) {
        NSUInteger localWallet = _wallet;
        _wallet = wallet;
        if (_wallet > localWallet) {
            
        }
        
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificOperationWithObject:(id) object {
    if (VAPStateFree == self.state) {
        [self beginJob];
        [self doJobWithObject:(id<VAPMoneyFlowing>)object];
        [self mayBeFree];
    }
}

- (void)doJobWithObject:(id<VAPMoneyFlowing>)object {
    
}

- (void)setFreeState:(VAPState)state {
    if (_state != state) {
        _state = state;
    }
}
- (void)setBeginWorkState:(VAPState)state {
    if (VAPStateBeginWork != self.state && VAPStateEndWork != state) {
        _state = state;
        [self notifyObserversWithSelector:[self selectorForState:state] withObject:self];
    }
}
- (void)setEndWorkState:(VAPState)state {
    if (VAPStateBeginWork != self.state && VAPStateEndWork != state) {
        _state = state;
        [self notifyObserversWithSelector:[self selectorForState:state] withObject:self];
    }
}

#pragma mark -
#pragma mark Extension 

- (void)beginJob {
    [self setBeginWorkState:VAPStateBeginWork];
}

- (void)mayBeFree {
    [self setFreeState:VAPStateFree];
}

- (SEL)selectorForState:(VAPState)state {
    switch (state) {
        case VAPStateBeginWork:
            return @selector(employeeDidBeganJob:);
        case VAPStateEndWork:
            return @selector(employeeDidEndJob:);
        default:
            break;
    }
    return nil;
}

#pragma mark -
#pragma mark VAPEmployeeObserver

- (BOOL)isAbleToPay:(NSUInteger)cost {
    return self.wallet >= cost;
}

- (void)moneyTransferTo:(id<VAPMoneyFlowing>)object withCost:(NSUInteger)cost {
    self.wallet -= cost;
    object.wallet += cost;
}


@end
