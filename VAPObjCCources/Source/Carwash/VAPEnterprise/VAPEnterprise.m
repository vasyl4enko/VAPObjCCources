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
    VAPCarwasher *freeCarwasher = nil;
    while (NO == [self.carwashers isEmptyQueue]
           && nil != (freeCarwasher = (VAPCarwasher *)[self.carwashers freeHandler]))
    {
        @synchronized(freeCarwasher) {
            if (VAPStateFree == freeCarwasher.state) {
                [freeCarwasher processObject:[self.carwashers dequeue]];
            }
        }
        
    }
}

- (void)washCar:(VAPCar *)car {
    
}

#pragma mark -
#pragma mark Private Implementation

- (void)addRandomCountWorkers {
    uint32_t randomNumber = arc4random_uniform(100) + 2;
    randomNumber = 40;
    
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
        [self.carwashers enqueue:[VAPCar object]];
        index++;
    }
}

#pragma mark -
#pragma mark <Employee Observer>

- (void)employeeDidFinishJob:(VAPEmployee *)employee {
//    @synchronized(employee) {
        if ([employee isKindOfClass:[VAPCarwasher class]]) {
            VAPAccountant *freeAccountant = (VAPAccountant *)[self.accountants freeHandler];
            if (nil != freeAccountant && NO == [self.accountants isEmptyQueue]) {
                [freeAccountant processObject:employee];
            } else {
                [self.accountants enqueue:employee];
            }
        } else if ([employee isKindOfClass:[VAPAccountant class]]) {
            VAPDirector *freeDirector = (VAPDirector *)[self.directors freeHandler];
            if (nil != freeDirector && NO == [self.accountants isEmptyQueue]) {
                [freeDirector processObject:employee];
            } else {
                [self.directors enqueue:employee];
            }
        }
//    }
}


@end
