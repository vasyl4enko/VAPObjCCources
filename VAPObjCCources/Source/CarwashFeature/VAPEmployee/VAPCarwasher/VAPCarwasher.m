//
//  VAPCarwasher.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPCarwasher.h"
#import "VAPCar.h"

static NSString *const kCarwasherGreeting  = @"I'm a carwasher & I'm slave. I love my master";

@implementation VAPCarwasher

#pragma mark -
#pragma mark Public Methods

//get money

- (id)performEmployeeSpecificOperationWithObject:(id) object {
    NSMutableArray *result;
    if (nil != object && [object isKindOfClass:[NSArray class]]) {
        result = [NSMutableArray array];
        NSLog(kCarwasherGreeting);
        for (VAPCar *car in object) {
            [result addObject: @(car.money)];
        }
       
    }
    return result;
}

@end
