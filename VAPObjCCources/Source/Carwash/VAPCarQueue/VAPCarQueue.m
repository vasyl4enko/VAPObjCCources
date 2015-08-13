//
//  VAPCarQueue.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 12.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPCarQueue.h"
#import "VAPCar.h"

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
    }
    return self;
}

#pragma mark -
#pragma mark Public Implementation

- (VAPCar *)dequeue {
    VAPCar *car = [self.mutableCars firstObject];
    [self.mutableCars removeObject:car];

    return car;
}

@end
