//
//  VAPRoom.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPRoom.h"
#import "VAPEmployee.h"

NSUInteger const kVAPDefaultEmployeesCount = 2;

@interface VAPRoom ()

@property (nonatomic, retain)     NSMutableArray     *mutableEmployees;

@end

@implementation VAPRoom

@dynamic employees;

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc
{
    self.mutableEmployees = nil;
    
    [super dealloc];
}

- (instancetype)initWithEmployeesCount:(NSUInteger) employeesCount {
    self = [super init];
    if (self) {
        self.employeesCount = employeesCount;
        self.mutableEmployees = [[NSMutableArray alloc] initWithCapacity:_employeesCount];
    }
    
    return self;
}

- (instancetype)init {
    self = [self initWithEmployeesCount:kVAPDefaultEmployeesCount];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)employees {
    return [[self.mutableEmployees copy] autorelease];
}



#pragma mark -
#pragma mark Public Implementation

- (void)addEmployee:(id)object {
    if (nil != object
        && NO == [self.mutableEmployees containsObject:object]
        && self.employeesCount > [self.mutableEmployees count])
    {
        [self.mutableEmployees addObject:object];
    }
}

- (void)removeEmployee:(id) object {
    [self.mutableEmployees removeObject:object];
}

- (void)forceToWorkWithObject:(id) object {
    
}
#warning override
- (id)performRoomSpecificOperatiom:(id) object {
    return nil;
}

@end
