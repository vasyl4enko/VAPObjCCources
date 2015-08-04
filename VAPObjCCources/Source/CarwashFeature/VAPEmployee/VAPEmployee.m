//
//  VAPEmployee.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEmployee.h"

@implementation VAPEmployee

#pragma mark -
#pragma mark Accesors

- (void)setWallet:(NSUInteger)wallet {
    if (_wallet != wallet) {
        NSUInteger localWallet = _wallet;
        _wallet = wallet;
        if (_wallet > localWallet) {
            self.state = VAPMoneyStateAdd;
        }
        
    }
}

- (void)setBusyState:(NSUInteger)busyState {
    _busyState = busyState;
    [self delegateWithSelector: [self selectorBusyForState:busyState]];
}

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificOperationWithObject:(id) object {
    
}

- (SEL)selectorBusyForState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (void)delegateWithSelector:(SEL)selector {
    
}

#pragma mark -
#pragma mark VAPEmployeeObserver

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case VAPMoneyStateAdd:
            return @selector(employeeDidReceivedMoney:);
            
        default:
            break;
    }
    return [super selectorForState:state];
}


- (BOOL)isAbleToPay:(NSUInteger)cost {
    return self.wallet >= cost;
}

- (void)moneyTransferTo:(id<VAPMoneyFlowing>)object withCost:(NSUInteger)cost {
    self.wallet -= cost;
    object.wallet += cost;
}


@end
