//
//  VAPEnterprise.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 15.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//



#import "VAPEnterprise.h"
#import "VAPCar.h"
#import "VAPCarwasher.h"
#import "VAPAccountant.h"
#import "VAPDirector.h"
#import "NSObject+VAPExtension.h"

NSString *const kVAPErrorMessage = @"some workers aren't on his position or maybe room is nil";

@interface VAPEnterprise ()
@property(nonatomic, retain) NSMutableArray *mutableEmployees;
@property(nonatomic, retain) NSMutableArray *queue;         

- (VAPEmployee *)freeEmployeeWithClass:(Class)classType;
- (void)addRandomCountWorkers;
- (void)addCarsToQueue;         
- (VAPCar *)dequeueCar;
- (BOOL)isEmptyQueue;

@end

@implementation VAPEnterprise

@dynamic employees;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableEmployees = nil;
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mutableEmployees = [[NSMutableArray alloc] init];
        self.queue = [[NSMutableArray alloc] init];
        [self addRandomCountWorkers];
        [self addCarsToQueue];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)employees {
    return [[self.mutableEmployees copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementation

- (void)washCar {
    VAPCarwasher *freeCarwasher = nil;
    while (NO != [self isEmptyQueue]
           && nil != (freeCarwasher = (VAPCarwasher *)[self freeEmployeeWithClass:[VAPCarwasher class]]))
    {
        @synchronized(freeCarwasher) {
            if (VAPStateFree == freeCarwasher.state) {
                [freeCarwasher performEmployeeSpecificOperationWithObjectInBackground:[self dequeueCar]];
            }
        }
    }
}

- (void)addEmployee:(VAPEmployee *)employee {
    @synchronized(self.mutableEmployees) {
        if (nil != employee) {
            [self.mutableEmployees addObject:employee];
            if ([employee isKindOfClass:[VAPCarwasher class]]) {
                [employee addObserver:self];
            }
        }
    }
}

#pragma mark -
#pragma mark Private Implementation

- (VAPEmployee *)freeEmployeeWithClass:(Class)classType {
    __block VAPEmployee *freeEmployee = nil;
    
    @synchronized(self.mutableEmployees) {
        NSArray *array = self.mutableEmployees;
        [array enumerateObjectsUsingBlock: ^(VAPEmployee *employee, NSUInteger index, BOOL *stop) {
            if ([employee isKindOfClass:classType] && VAPStateFree == employee.state) {
                freeEmployee = employee;
                *stop = YES;
            }
        }];
    }
    
    return freeEmployee;
}

- (void)addRandomCountWorkers {
    uint32_t randomNumber = arc4random_uniform(100) + 1;
    VAPDirector *director = [VAPDirector object];
    VAPAccountant *accountant = [VAPAccountant object];
    
    [self addEmployee:director];
    [self addEmployee:accountant];
    
    [accountant addObserver:director];
    for (uint32_t index = 0; index < randomNumber; index++) {
        VAPCarwasher *carwasher = [VAPCarwasher object];
        [self addEmployee:carwasher];
        [carwasher addObserver:accountant];
    }
}

- (void)addCarsToQueue {
    uint index = 0;
    while (index < 400) {
        [self.queue addObject:[VAPCar object]];
        index++;
    }
}

- (VAPCar *)dequeueCar {
    VAPCar *car = nil;
    @synchronized(self.queue) {
        car = [self.queue firstObject];
        [self.queue removeObject:car];
    }
    
    return car;
}

- (BOOL)isEmptyQueue {
    @synchronized(self.queue) {
        return self.queue.count;
    }
}

#pragma mark -
#pragma mark Employee Observer

- (void)didEmployeeFinishJob:(VAPEmployee *)employee {
    @synchronized(employee) {
        if (VAPStateFree == employee.state) {
            [employee performEmployeeSpecificOperationWithObjectInBackground:[self dequeueCar]];
        }
    }
}


@end
