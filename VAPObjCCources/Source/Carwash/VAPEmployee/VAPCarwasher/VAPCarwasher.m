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

NSUInteger const kVAPDefualtCost = 100;


@implementation VAPCarwasher

#pragma mark -
#pragma mark Public Methods

- (void)doJobWithObject:(id<VAPMoneyFlowing>)object {
    if (nil != object && [object isKindOfClass:[VAPCar class]]) {
        VAPCar *car = (VAPCar *)object;
        uint rand = arc4random_uniform(10) + 2;
        usleep(rand * 1000);
        if ([car isAbleToPay:kVAPDefualtCost]) {
            car.dirty = NO;
            [object payTo:self withCost:kVAPDefualtCost];
        }
//        [self performSelectorOnMainThread:@selector(finishJob) withObject:nil waitUntilDone:YES];
    }
}

- (void)mayBeFree {
    [super mayBeFree];
    [self notifyObserversWithSelector:[self selectorForState:self.state] withObject:self];
}
//- (void)finishJob {
//    [super finishJob];
//    [self notifyObserversOnMainThreadWithSelector:[self selectorForState:self.state] withObject:self];
//}


@end
