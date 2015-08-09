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

NSUInteger const kVAPDefualtCost = 200;


@implementation VAPCarwasher

#pragma mark -
#pragma mark Public Methods

- (void)doJobWithObject:(id<VAPMoneyFlowing>)object {
    if (nil != object && [object isKindOfClass:[VAPCar class]]) {
        VAPCar *car = (VAPCar *)object;
        if ([car isAbleToPay:kVAPDefualtCost]) {
            car.dirty = NO;
            [object moneyTransferTo:self withCost:kVAPDefualtCost];
        }
        [self setEndWorkState:VAPStateEndWork];
    }
}

@end
