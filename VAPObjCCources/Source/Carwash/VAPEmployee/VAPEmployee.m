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

@synthesize state = _state;
#pragma mark -
#pragma mark Accessors

- (void)setState:(VAPState)state {
    @synchronized(self) {
        if (VAPStateBeginWork == state) {
            _state = VAPStateBeginWork;
        } else if (VAPStateEndWork == state) {
            
            _state = VAPStateEndWork;
            [self notifyObserversWithSelector:[self selectorForState:self.state]];
        } else if (VAPStateFree == state) {
            
            _state = VAPStateFree;
            [self notifyObserversWithSelector:[self selectorForState:self.state]];
        }
    }
}

- (VAPState)state {
    @synchronized(self) {
        return _state;
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)processObject:(id) object {
    self.state = VAPStateBeginWork;
    [self performSelectorInBackground:@selector(doJobWithObject:) withObject:object];
}

- (void)doJobWithObject:(id<VAPMoneyFlowing>)object {
    self.state = VAPStateEndWork;
//    if (0 == self.wallet) {
//        NSLog(@"HUINYA HUINYA HUINYA HUINYA");
//    }
    [self notifyObserversOnMainThreadWithSelector:[self selectorForState:self.state] withObject:self];
}

#pragma mark -
#pragma mark Extension

- (SEL)selectorForState:(VAPState)state {
    switch (state) {
        case VAPStateEndWork:
            return @selector(employeeDidFinishJob:);
            
        case VAPStateFree:
            return @selector(employeeBecameFree:);
            
        default:
            break;
    }
    return nil;
}

#pragma mark -
#pragma mark <VAPMoneyFlowing>

- (BOOL)isAbleToPay:(NSUInteger)cost {
    return self.wallet >= cost;
}

- (void)payTo:(id<VAPMoneyFlowing>)object withCost:(NSUInteger)cost {
    
    @synchronized(self) {
        self.wallet = self.wallet - cost;
    }
    
    @synchronized(object) {
        object.wallet = object.wallet + cost;
    }

}

@end
