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
#pragma mark Public Methods

- (void)performEmployeeSpecificOperationWithObject:(id) object {
    if (nil != object && [object isKindOfClass:[VAPCar class]]) {
        if ([object isPayable:kDefualtCost]) {
            if ([object respondsToSelector:@selector(setDirty:)]){
                [object performSelector:@selector(setDirty:) withObject:NO]; //У машины деньги пока не отнимаешь!!!!!!
            }
            
            self.wallet += kDefualtCost;
            
            id<VAPMoneyFlowingDelegate> delegate = self.delegate;
            [delegate delegatingEmployeeDidAddMoney: self];
            [delegate performSelector:@selector(performEmployeeSpecificOperationWithObject:) withObject:nil];
            
            self.busy = NO;
        }
    }
}

//#pragma mark -
//#pragma mark VAPCarDelegate

//- (void)delegatingEmployeeDidAddMoney:(VAPEmployee *)employee {
//    self.wallet = employee.wallet;
//    employee.wallet = 0;
//    employee.busy = NO;
//}

@end
