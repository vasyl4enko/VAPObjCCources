//
//  VAPCarwasher.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPCarwasher.h"
#import "VAPCar.h"

@interface VAPCarwasher ()

@end

@implementation VAPCarwasher

#pragma mark -
#pragma mark Public Methods

- (id)performEmployeeSpecificOperationWithObject:(id) object {
    NSMutableArray *result;
    if (nil != object && [object isKindOfClass:[NSArray class]]) {
        result = [NSMutableArray array];
        NSLog(@"I'm a carwasher & i'm washing car");
        for (VAPCar *car in object) {
            [result addObject: @(car.money)];
        }
       
    }
    return result;
}

@end
