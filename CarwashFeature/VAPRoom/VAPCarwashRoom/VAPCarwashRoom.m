//
//  VAPCarwashRoom.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPCarwashRoom.h"

NSUInteger const kVAPDefaultCarsCount = 1;

@interface VAPCarwashRoom ()
@property (nonatomic, retain)       NSMutableArray      *mutableCars;

@end

@implementation VAPCarwashRoom
@dynamic cars;

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc
{
    self.mutableCars = nil;
    
    [super dealloc];
}

- (instancetype)initWithEmployeesCount:(NSUInteger) employeesCount
                             carsCount:(NSUInteger) carsCount
{
    self = [super initWithEmployeesCount:employeesCount];
    if (self) {
        self.carsCount = carsCount;
        self.mutableCars = [[NSMutableArray alloc] initWithCapacity:_carsCount];
    }
    
    return self;
}

- (instancetype)init {
    return [self initWithEmployeesCount:kVAPDefaultEmployeesCount carsCount:kVAPDefaultCarsCount];
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)cars {
    return [[self.mutableCars copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementation

- (void)addCar:(id) object {
    
}

- (void)removeCar:(id) object {
    [self.mutableCars removeObject:object];
}

- (void)addCars:(NSArray *) objects {
    [self.mutableCars addObjectsFromArray:objects];
}

- (void)removeCars {
    [self.mutableCars removeAllObjects];
}

- (id)firstCar {
    id object = [self.mutableCars firstObject];
    [self.mutableCars removeObject:object];
    
    return object;
}

@end
