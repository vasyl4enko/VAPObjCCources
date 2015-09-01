//
//  VAPEnterprise.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 15.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//



#import "VAPEnterprise.h"
#import "VAPDispatcher.h"
#import "VAPCar.h"
#import "VAPCarwasher.h"
#import "VAPAccountant.h"
#import "VAPDirector.h"
#import "NSObject+VAPExtension.h"

NSString *const kVAPErrorMessage = @"some workers aren't on his position or maybe room is nil";

@interface VAPEnterprise ()
@property(nonatomic, retain) NSMutableArray *mutableEmployees;
@property(nonatomic, retain) NSMutableArray *queue;

@property(nonatomic, retain) VAPDispatcher *carwashers;
@property(nonatomic, retain) VAPDispatcher *accountants;
@property(nonatomic, retain) VAPDispatcher *directors;

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
        self.queue = [[NSMutableArray alloc] init];
        
        self.carwashers = [VAPDispatcher object];
        self.accountants = [VAPDispatcher object];
        self.directors = [VAPDispatcher object];
        
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
    while (NO != [self isEmptyQueue]) {
        if (nil != (freeCarwasher = (VAPCarwasher *)[self.carwashers freeHandler])
            && NO != [self.carwashers isEmptyQueue])
        {
            @synchronized(freeCarwasher) {
                if (VAPStateFree == freeCarwasher.state) {
                    [freeCarwasher performEmployeeSpecificOperationWithObject:[self dequeueCar]];
                }
            }
        } else
        {
            [self.carwashers enqueue:[self dequeueCar]];
        }
        
    }
}

#pragma mark -
#pragma mark Private Implementation

- (void)addRandomCountWorkers {
    uint32_t randomNumber = arc4random_uniform(100) + 2;
        randomNumber = 10;
    
    VAPDirector *director = [VAPDirector object];
    [director addObserver:self];
    [self.directors addHandler:director];
    
    for (uint32_t index = 0; index < randomNumber / 2; index++) {
        VAPAccountant *acountant = [VAPAccountant object];
        [acountant addObserver:self];
        [self.accountants addHandler:acountant];
        
    }
    
    for (uint32_t index = 0; index < randomNumber; index++) {
        VAPCarwasher *carwasher = [VAPCarwasher object];
        [carwasher addObserver:self];
        [self.carwashers addHandler:carwasher];
    }
}

- (void)addCarsToQueue {
    uint index = 0;
    while (index < 4000) {
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
        return self.queue.count > 0;
    }
}

#pragma mark -
#pragma mark Employee Observer

- (void)employeeDidEndJob:(VAPEmployee *)employee {
    if ([employee isKindOfClass:[VAPCarwasher class]]) {
        VAPAccountant *freeAccountant = (VAPAccountant *)[self.accountants freeHandler];
        if (nil != freeAccountant && NO == [self.accountants isEmptyQueue]) {
            [freeAccountant performEmployeeSpecificOperationWithObject:employee];
        } else {
            [self.accountants enqueue:employee];
            
        }
        
        
    } else if ([employee isKindOfClass:[VAPAccountant class]]) {
        
        VAPDirector *freeDirector = (VAPDirector *)[self.directors freeHandler];
        
        if (nil != freeDirector && NO == [self.accountants isEmptyQueue]) {
            [freeDirector performEmployeeSpecificOperationWithObject:employee];
        } else {
            [self.directors enqueue:employee];
        }
        
        
    }
    
}


@end
