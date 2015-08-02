//
//  VAPAccountant.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPAccountant.h"
#import "VAPCarwasher.h"
#import "VAPDirector.h"

NSString *const kAccuntantGreeting = @"I'm an accountan";
NSUInteger const kDefualtSendingToDirector = 200;

@implementation VAPAccountant

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.delegatingObject = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.classType = [VAPDirector class];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors


- (void)setDelegatingObject:(VAPCarwasher *)delegatingObject {
    if (_delegatingObject != delegatingObject) {
        
        _delegatingObject = nil;
        [_delegatingObject release];
        _delegatingObject = [delegatingObject retain];
        
        _delegatingObject.delegate = self;
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
