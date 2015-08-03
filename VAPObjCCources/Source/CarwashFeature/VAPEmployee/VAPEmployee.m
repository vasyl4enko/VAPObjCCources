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
        _wallet += wallet;
        if (_wallet > localWallet) {
            self.state = VAPMoneyStateAdd;
        }
        
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificOperationWithObject:(id) object {
    
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



@end
