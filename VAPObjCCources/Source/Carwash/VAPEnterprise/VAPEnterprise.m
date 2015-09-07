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

NSString * const kVAPErrorMessage = @"some workers aren't on his position or maybe room is nil";

@interface VAPEnterprise ()

@property(nonatomic, retain) VAPDispatcher *carwashers;
@property(nonatomic, retain) VAPDispatcher *accountants;
@property(nonatomic, retain) VAPDispatcher *directors;

- (void)addRandomCountWorkers;
- (void)addCarsToQueue;
@end

@implementation VAPEnterprise

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.carwashers = [VAPDispatcher object];
        self.accountants = [VAPDispatcher object];
        self.directors = [VAPDispatcher object];
        
        [self addRandomCountWorkers];
        [self addCarsToQueue];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Implementation


- (void)washCar {
    VAPEmployee *freeCarwasher = nil;
    while (NO == [self.carwashers isEmptyQueue]
           && nil != (freeCarwasher = [self.carwashers freeHandler]))
    {
        [freeCarwasher processObject:[self.carwashers dequeue]];
    }
}

- (void)washCar:(VAPCar *)car {
    VAPEmployee *freeCarwasher = nil;
    if (YES == [self.carwashers isEmptyQueue] && nil != (freeCarwasher = [self.carwashers freeHandler])) {
        [freeCarwasher processObject:car];
    } else {
        [self.carwashers enqueue:car];
    }
}

#pragma mark -
#pragma mark Private Implementation

- (void)addRandomCountWorkers {
    uint32_t randomNumber = arc4random_uniform(100) + 2;
    randomNumber = 40;
    
    VAPDirector *director = [VAPDirector object];
    [self.directors addHandler:director];
    [director addObserver:self];
    
    for (uint32_t index = 0; index < randomNumber / 2; index++) {
        VAPAccountant *acountant = [VAPAccountant object];
        [self.accountants addHandler:acountant];
        [acountant addObserver:self];
        
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
        [self.carwashers enqueue:[VAPCar object]];
        index++;
    }
}

#pragma mark -
#pragma mark <Employee Observer>

- (void)employeeDidFinishJob:(VAPEmployee *)employee {
    if ([employee isKindOfClass:[VAPCarwasher class]]) {
        VAPEmployee *freeEmployee = [self.accountants freeHandler];
        if (nil != freeEmployee && YES == [self.accountants isEmptyQueue]) {
            [freeEmployee processObject:employee];
        } else {
            [self.accountants enqueue:employee];
        }
    }

    if ([employee isKindOfClass:[VAPAccountant class]]) {
        VAPEmployee *freeEmployee = [self.directors freeHandler];
        if (nil != freeEmployee && YES == [self.directors isEmptyQueue]) {
            [freeEmployee processObject:employee];
        } else {
            [self.directors enqueue:employee];
        }
    }
}

@end
