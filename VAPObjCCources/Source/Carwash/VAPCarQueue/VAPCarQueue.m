//
//  VAPCarQueue.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 12.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPCarQueue.h"
#import "VAPCar.h"
#import "NSObject+VAPExtension.h"

@interface VAPCarQueue ()
@property(nonatomic, retain)  NSMutableArray     *mutableCars;
@end

@implementation VAPCarQueue
//@dynamic cars;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableCars = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableCars = [[NSMutableArray alloc] init];
        uint i = 0;
        while (i < 2000) {
            [self.mutableCars addObject:[VAPCar object]];
            i++;
        }
    }
    return self;
}

#pragma mark -
#pragma mark Public Implementation

- (VAPCar *)dequeue {
    VAPCar *car = nil;
    @synchronized(_mutableCars) {
        car = [self.mutableCars firstObject];
//        NSLog(@"count %lu", self.mutableCars.count);
        [self.mutableCars removeObject:car];
    }
    return car;
}

@end
