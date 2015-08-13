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
@property (nonatomic, retain) NSMutableArray *mutableEmployees;

- (void)addRandomCountWorkers;

@end

@implementation VAPEnterprise

@dynamic employees;


#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableEmployees = nil;
    self.storage = nil;
    
    [super dealloc];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mutableEmployees = [NSMutableArray array];
        self.storage = [VAPEmployeesStorage object];
        [self addRandomCountWorkers];
        
        
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

- (void)addEmmployye:(VAPEmployee *)object {
    if (nil != object) {
        [self.mutableEmployees addObject:object];
        [object addObserver:self];
    }
}

- (void)washCar:(VAPCar *)object {
    if (nil != object) {
        VAPCarwasher *freeCarwasher = (VAPCarwasher *)[self findFreeEmployee:[VAPCarwasher class]];
        if (nil != freeCarwasher) {
            [freeCarwasher performEmployeeSpecificOperationWithObject:object];
            
        } else {
            NSLog(kVAPErrorMessage);
        }
        
    }
}

#pragma mark -
#pragma mark Extension

- (VAPEmployee *)findFreeEmployee:(Class)employeeType {
    VAPEmployee *resultEmployee = nil;
    NSArray *employees = self.employees;
    for (VAPEmployee *worker in employees) {
        if ([worker isMemberOfClass:employeeType] && VAPStateFree == worker.state){
            resultEmployee = worker;
            
            break;
        }
    }
    
    return resultEmployee;
}

- (void)addRandomCountWorkers {
    uint32_t randomNumber = arc4random_uniform(100);
    VAPDirector *director = [VAPDirector object];
    VAPAccountant *accountant = [VAPAccountant object];
    [self addEmmployye:director];
    [self addEmmployye:accountant];
    [accountant addObserver:director];
    for (uint32_t index = 0; index < randomNumber; index++) {
        VAPCarwasher *carwasher = [VAPCarwasher object];
        [self addEmmployye:carwasher];
        [carwasher addObserver:accountant];
    }
}

@end
