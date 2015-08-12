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
//        [self finishJob];
        [self mayBeFree];
    }
}

- (void)doJobWithObject:(id<VAPMoneyFlowing>)object {
        [object payTo:self withCost:object.wallet];
    
        [self finishJob];
    
    if ([self isKindOfClass:[VAPDirector class]]) {
        NSLog(kVAPDirectorProffit,self.wallet);
    }
}


- (void)beginJob {
    _state = VAPStateBeginWork;
//    [self notifyObserversWithSelector:[self selectorForState:self.state] withObject:self];
}

- (void)finishJob {
    _state = VAPStateEndWork;
    [self notifyObserversWithSelector:[self selectorForState:self.state] withObject:self];
}

- (void)mayBeFree {
    _state = VAPStateFree;
}

#pragma mark -
#pragma mark Extension

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
