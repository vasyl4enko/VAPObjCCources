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
        if (_wallet <= wallet) {
            _wallet = wallet;
            self.state = VAPStateAddMoney;
        } else {
            _wallet = wallet;
            self.state = VAPStateBecomeLessMoney;
        }
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificOperationWithObject:(id) object {
    
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case VAPStateAddMoney:
            return @selector(employeeDidAddMoney:);
            
        case VAPStateBecomeLessMoney:
            return @selector(employeeDidBecomeLessMoney:);
            
        default:
            break;
            
    }
  return  [super selectorForState:state];
}



@end
