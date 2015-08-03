//
//  VAPDirector.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPDirector.h"


static NSString *const kDirectorGreeting  = @"I'm director";
NSString *const kDirectorProffit = @"My proffit %lu";

@implementation VAPDirector

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.delegatingObject = nil;
    
    [super dealloc];
}


#pragma mark -
#pragma mark Accessors 

- (void)setDelegatingObject:(VAPAccountant *)delegatingObject {
    if (_delegatingObject != delegatingObject) {
        
        _delegatingObject = nil;
        [_delegatingObject release];
        _delegatingObject = [delegatingObject retain];
        
        _delegatingObject.delegate = self;
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificOperationWithObject:(id) object {
    NSLog(kDirectorGreeting);
    id<VAPMoneyFlowingDelegate> delegate = self.delegate;
    [delegate delegatingEmployeeDidAddMoney: self];
}

- (void)employeeDidAddMoney:(VAPEmployee *)employee {
    self.wallet = employee.wallet;
    employee.wallet = 0;
    employee.busy = NO;
}

#pragma mark -
#pragma mark VAPCarwasherDelegate


- (void)delegatingEmployeeDidAddMoney:(VAPEmployee *)employee {
    self.wallet += employee.wallet;
    employee.wallet = 0;
    NSLog(@"I have %lu",self.wallet);
}


@end
