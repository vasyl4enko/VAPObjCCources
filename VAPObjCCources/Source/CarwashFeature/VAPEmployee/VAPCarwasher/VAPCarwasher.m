//
//  VAPCarwasher.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPCarwasher.h"
#import "VAPCar.h"


NSString *const kCarwasherGreeting  = @"I'm a carwasher, let's wash it";
NSString *const kCarWasWashed = @"Car was washed";
NSUInteger const kDefualtCost = 200;
NSUInteger const kDefualtSendingToAccountant = kDefualtCost*2;

@implementation VAPCarwasher

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificOperationWithObject:(id) object {
    if (nil != object && [object isKindOfClass:[VAPCar class]]) {
        if ([object isPayable:kDefualtCost]) {
            [object addObserver:self];
            NSLog(kCarwasherGreeting);
            NSLog(kCarWasWashed);
            if ([object respondsToSelector:@selector(setDirty:)]){
                [object performSelector:@selector(setDirty:) withObject:NO];
            }
        }
    }
}

#pragma mark -
#pragma mark VAPCarObserver

- (void)carDidBecomeCleaner:(VAPCar *)car {
    car.wallet -= kDefualtCost;
    self.wallet += kDefualtCost;
    
    [car removeObserver:self];
}



@end
