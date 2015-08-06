//
//  VAPCar.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPCar.h"


NSUInteger const kVAPDefaultMoneyValue = 300;

@implementation VAPCar

#pragma mark -
#pragma mark Initializations and Dealocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.wallet = kVAPDefaultMoneyValue;
        self.dirty = YES;
    }
    return self;
}

#pragma mark -
#pragma mark VAPMoneyFlowing

- (BOOL)isAbleToPay:(NSUInteger)cost {
    return self.wallet >= cost;
}

- (void)moneyTransferTo:(id<VAPMoneyFlowing>)object withCost:(NSUInteger)cost {
    if ([self isAbleToPay:cost]) {
        self.wallet -= cost;
        object.wallet += cost;
    }
}

@end
