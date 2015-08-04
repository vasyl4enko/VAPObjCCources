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

NSString *const kErrorMessage = @"some workers aren't on his position or maybe room is nil";
NSString *const kCarDirty = @"Car is dirty";
NSString *const kWorkerBusy = @"Worker is still busy";

@interface VAPEnterprise ()
@property (nonatomic, retain) NSMutableArray *mutableEmployees;

- (void)addRandomCountWorkers:(Class) class;

@end

@implementation VAPEnterprise

@dynamic employees;


#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    
    [super dealloc];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mutableEmployees = [NSMutableArray array];
        [self addRandomCountWorkers:[VAPCarwasher class]];
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
        object.receiver = [self.mutableEmployees firstObject];
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
            NSLog(@"some workers aren't on his position or maybe room is nil");
        }
        
    }
}

#pragma mark -
#pragma mark Extension

- (VAPEmployee *)findFreeEmployee:(Class)employeeType {
    VAPEmployee *resultEmployee = nil;
    NSArray *employees = self.employees;
    for (VAPEmployee *worker in employees) {
        if ([worker isMemberOfClass:employeeType] && NO == worker.busy) {
            resultEmployee = worker;
            break;
        }
    }
    
    return resultEmployee;
}

- (void)addRandomCountWorkers:(Class) class {
    uint32_t randomNumber = arc4random_uniform(100);
    [self addEmmployye:[VAPDirector object]]; // delete in future version
    [self addEmmployye:[VAPAccountant object]];  // delete in future version
    for (uint32_t index = 0; index < randomNumber; index++) {
        [self addEmmployye:[class object]];
    }
}

#pragma mark -
#pragma mark VAPEmployeeObserver


- (void)employeeDidReceivedMoney:(VAPEmployee *)employee {
    Class delegateClassType = employee.classType;
    VAPEmployee *object = [self findFreeEmployee:delegateClassType];
    if ([object respondsToSelector:@selector(setDelegatingObject:)]) {
        [object performSelector:@selector(setDelegatingObject:) withObject:employee];
    }
    
}

@end
