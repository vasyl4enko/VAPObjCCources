//
//  VAPCarwasher.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPCarwasher.h"
#import "VAPCar.h"
#import "VAPAccountant.h"


NSString *const kCarwasherGreeting  = @"I'm a carwasher, let's wash it";
NSString *const kCarWasWashed = @"Car was washed";
NSUInteger const kDefualtCost = 200;
NSUInteger const kDefualtSendingToAccountant = kDefualtCost*2;

@implementation VAPCarwasher

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.delegatingObject = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.classType = [VAPAccountant class];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors 

- (void)setDelegatingObject:(VAPCar *)delegatingObject {
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
    if (nil != object && [object isKindOfClass:[VAPCar class]]) {
        if ([object isPayable:kDefualtCost]) {
            NSLog(kCarwasherGreeting);
            NSLog(kCarWasWashed);
            if ([object respondsToSelector:@selector(setDirty:)]){
                [object performSelector:@selector(setDirty:) withObject:NO];
            }
        }
    }
}

#pragma mark -
#pragma mark VAPCarDelegate 

- (void)delegatingCarShouldBecameCleaner:(VAPCar *)car {
    car.wallet -= kDefualtCost;
    self.wallet += kDefualtCost;
}

- (void)delegatingEmployeeDidAddMoney:(VAPEmployee *)employee {
    self.wallet = employee.wallet;
    employee.wallet = 0;
    employee.busy = NO;
}

@end
