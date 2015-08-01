//
//  VAPEnterprise.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 15.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEnterprise.h"
#import "VAPBuilding.h"
#import "VAPCarwasher.h"
#import "VAPAccountant.h"
#import "VAPDirector.h"
#import "VAPCarwashRoom.h"

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

@dynamic buildings;
@dynamic employees;


#pragma mark -
#pragma mark Class Methods

+ (Class)roomClassForObject:(id)object {
    Class class;
    if ([object isMemberOfClass:[VAPCarwasher class]] || [object isMemberOfClass:[VAPCar class]] ) {
        class = [VAPCarwashRoom class];
    } else  { // if ([object isMemberOfClass:[VAPAccountant class]] || [object isMemberOfClass:[VAPDirector class]])
        class = [VAPRoom class];
    }
    
    return class;
}

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

- (void)addBuilding:(VAPEmployee *)object {
    if (nil != object) {
        [self.mutableBuildings addObject:object];
    }
}

- (void)addRoom:(VAPRoom *)object {
    if (nil != object) {
        NSArray *localBuildings = self.buildings;
        for (VAPBuilding *build in localBuildings) {
            if (0 == [build.rooms count])
            {
                [build addRoom:object];
                break;
            }
            else if (build.maxCount > [build.rooms count]
                       && [[build.rooms firstObject] isKindOfClass:[object class]])
            {
                [build addRoom:object];
                break;
            }
        }
    }
}

- (void)addEmmployye:(VAPEmployee *)object {
    if (nil != object) {
        NSArray *buildings = self.buildings;
        
        object.receiver = [self.mutableEmployees firstObject];
        [self.mutableEmployees addObject:object];
        for (VAPBuilding *build in buildings) {
            if ([build hasEmptyWorkplace]) {
                NSArray *localRooms = build.rooms;
                Class localRoomClass = [VAPEnterprise roomClassForObject:object];
                
                if ([[build.rooms firstObject] isKindOfClass:localRoomClass])
                {
                    [self findFreePlaceForEmployye:object rooms:localRooms];
                    
                    break;
                }
            }
            
        }
    }
}

- (void)washCar:(VAPCar *)object {
    if (nil != object) {
        VAPCarwasher *freeCarwasher = (VAPCarwasher *)[self findFreeWasher];
        VAPCarwashRoom *room = nil;
        for (VAPBuilding *build in self.buildings) {
            room = (VAPCarwashRoom *) [build findRoomWithEmployee:freeCarwasher
                                                            class:[VAPEnterprise roomClassForObject:freeCarwasher]];
        }
        
        if (nil != freeCarwasher && nil != room && room.carsCount > [room.cars count]) {
            [room addCar:object];
            [freeCarwasher performEmployeeSpecificOperationWithObject:object];
        } else {
            NSLog(@"some workers aren't on his position or maybe room is nil");
        }
        if (!object.isDirty && !freeCarwasher.isBusy) {
            [room removeCar:object];
        } else {
            if (object.isDirty) {
                NSLog(@"Car is dirty");
            }
            if (freeCarwasher.isBusy){
                NSLog(@"Worker is still busy");
            }
            
        }
    }
}

#pragma mark -
#pragma mark Extension

- (void)findFreePlaceForEmployye:(id) object rooms:(NSArray *)objects {
    for (VAPRoom *room in objects) {
        if (room.employeesCount != [room.employees count]) {
            [room addEmployee:object];
            
            break;
        }
    }
}

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
