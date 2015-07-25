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
        if ([object isObjectAbleToPay:kDefualtCost]) {
            NSLog(kCarwasherGreeting);
            NSLog(kCarWasWashed);
            if ([object respondsToSelector:@selector(setDirty:)]){
                [object performSelector:@selector(setDirty:) withObject:NO];
            }
            [object payMoneyToReciver:self price:kDefualtCost];
            if ([self isObjectAbleToPay:kDefualtSendingToAccountant] && NO == self.receiver.isBusy) {
                self.receiver.busy = YES;
                [self payMoneyToReciver:self.receiver price:self.wallet];
                self.wallet = 0;
                self.busy = NO;
            } else if (![self isObjectAbleToPay:kDefualtSendingToAccountant]) {
                self.busy = NO;
            }
        }
    }
}

#pragma mark -
#pragma mark Money Flowing

- (BOOL)isObjectAbleToPay:(NSUInteger)money {
    return self.wallet >= money;
}
- (void)payMoneyToReciver:(id<VAPMoneyFlowing>)object price:(NSUInteger)money {
    NSNumber *objectMoney = [[[NSNumber alloc] initWithInteger:money] autorelease];
    if ([object respondsToSelector:@selector(performEmployeeSpecificOperationWithObject:)]){
        [object performSelector:@selector(performEmployeeSpecificOperationWithObject:) withObject:objectMoney];
    }
     
}

@end
