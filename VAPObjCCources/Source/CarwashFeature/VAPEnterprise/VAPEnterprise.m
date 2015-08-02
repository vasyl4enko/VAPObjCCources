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

+ (Class)roomClassForObject:(id)object;

- (void)findFreePlaceForEmployye:(id) object rooms:(NSArray *)objects;

@end

@implementation VAPEnterprise

@dynamic employees;


#pragma mark -
#pragma mark Class Methods


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
        VAPCarwasher *freeCarwasher = (VAPCarwasher *)[self findFreeWasher];
        if (nil != freeCarwasher) {
            [freeCarwasher performEmployeeSpecificOperationWithObject:object];
        } else {
            NSLog(@"some workers aren't on his position or maybe room is nil");
        }
        
    }
}

#pragma mark -
#pragma mark Extension



- (VAPEmployee *)findFreeWasher {
    VAPDirector *reciverDirector = nil;
    VAPAccountant *reciverAccountant = nil;
    VAPCarwasher *freeCarwasher = nil;
    NSArray *employees = self.employees;
    for (VAPEmployee *employee in employees) {
        if ([employee isKindOfClass:[VAPDirector class]]) {
            reciverDirector = (VAPDirector *) employee;
        }
        
        if ([employee isKindOfClass:[VAPAccountant class]] && NO == employee.busy) {
            reciverAccountant = (VAPAccountant *) employee;
        }
        
        if ([employee isKindOfClass:[VAPCarwasher class]] && NO == employee.busy) {
            freeCarwasher = (VAPCarwasher *) employee;
            freeCarwasher.busy = YES;
        }
        
        if (nil != reciverAccountant && nil != reciverDirector && nil != freeCarwasher) {
            break;
        }
    }
    
    if (nil != reciverAccountant && nil != reciverDirector && nil != freeCarwasher) {
        freeCarwasher.receiver = reciverAccountant;
        reciverAccountant.receiver = reciverDirector;
        reciverDirector.receiver = nil;
    }
    
    
    return freeCarwasher;
}



@end
