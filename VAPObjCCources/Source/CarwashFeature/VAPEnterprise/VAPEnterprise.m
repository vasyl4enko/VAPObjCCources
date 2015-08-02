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

NSString *const kErrorMessage = @"some workers aren't on his position or maybe room is nil";
NSString *const kCarDirty = @"Car is dirty";
NSString *const kWorkerBusy = @"Worker is still busy";

@interface VAPEnterprise ()
@property (nonatomic, retain) NSMutableArray *mutableEmployees;
@property (nonatomic, retain) NSMutableArray *mutableBuildings;



@end

@implementation VAPEnterprise

@dynamic employees;


#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableBuildings = nil;
    
    [super dealloc];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mutableBuildings = [NSMutableArray array];
        self.mutableEmployees = [NSMutableArray array];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)buildings {
    return [[self.mutableBuildings copy] autorelease];
}

- (NSArray *)employees {
    return [[self.mutableEmployees copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementation

- (void)addEmmployye:(VAPEmployee *)object {
    if (nil != object) {
        object.receiver = [self.mutableEmployees firstObject];
        [self.mutableEmployees addObject:object];
        
    }
}

- (void)washCar:(VAPCar *)object {
    if (nil != object) {
        VAPCarwasher *freeCarwasher = (VAPCarwasher *)[self findFreeEmployee:[VAPCarwasher class] withNextEmployee:nil];
        if (nil != freeCarwasher) {
            [freeCarwasher setDelegatingObject:object];
            [freeCarwasher performEmployeeSpecificOperationWithObject:object];
            
        } else {
            NSLog(@"some workers aren't on his position or maybe room is nil");
        }
        
    }
}

#pragma mark -
#pragma mark Extension

- (VAPEmployee *)findFreeEmployee:(Class)employeeType withNextEmployee:(VAPEmployee *)employee{
    VAPEmployee *resultEmployee = nil;
    VAPEmployee *nextEmployee = nil;
    Class classType;
    
    NSArray *employees = self.employees;
    if (nil == employee) {
        for (VAPEmployee *worker in employees) {
            if ([worker isMemberOfClass:employeeType] && NO == worker.isBusy) {
                resultEmployee = worker;
                classType = resultEmployee.classType;
                if (nil == classType) {
                    break;
                }
                nextEmployee = [self findFreeEmployee:classType withNextEmployee:worker];
                break;
            }
        }
        
    } else {
        for (VAPEmployee *worker in employees) {
            if ([worker isMemberOfClass:employeeType] && NO == worker.isBusy) {
                resultEmployee = worker;
                classType = resultEmployee.classType;
                if (nil == classType) {
                    break;
                }
                nextEmployee = [self findFreeEmployee:classType withNextEmployee:worker];
                break;
            }
        }
        
        if ([nextEmployee respondsToSelector:@selector(setDelegatingObject:)]) {
            [nextEmployee performSelector:@selector(setDelegatingObject:) withObject:employee];
        }
        
    }
    
    
    return resultEmployee;
}

@end
