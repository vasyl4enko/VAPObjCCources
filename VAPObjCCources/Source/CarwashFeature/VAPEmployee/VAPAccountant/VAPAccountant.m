//
//  VAPAccountant.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPAccountant.h"
#import "VAPCarwasher.h"

NSString *const kAccuntantGreeting = @"I'm an accountan";
NSUInteger const kDefualtSendingToDirector = 200;

@implementation VAPAccountant

#pragma mark -
#pragma mark Accessors


- (void)setDelegatingCarwasher:(VAPCarwasher *)delegatingCarwasher {
    if (_delegatingCarwasher != delegatingCarwasher) {
        
        _delegatingCarwasher = nil;
        [_delegatingCarwasher release];
        _delegatingCarwasher = [delegatingCarwasher retain];
        
        _delegatingCarwasher.delegate = self;
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificOperationWithObject:(id) object { // unusued with delegate
    NSLog(kAccuntantGreeting);
    

}

#pragma mark -
#pragma mark VAPCarwasherDelegate
//- (void)delegatingEmployeeDidAddMoney:(VAPEmployee *)employee;
- (void)delegatingEmployeeDidAddMoney:(VAPEmployee *)employee {
    self.wallet = employee.wallet;
    employee.wallet = 0;
    employee.busy = NO;
}



@end
