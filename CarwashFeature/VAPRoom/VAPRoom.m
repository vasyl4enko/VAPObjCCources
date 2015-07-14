//
//  VAPRoom.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPRoom.h"

static NSUInteger const kVAPDefaultEmployeesCount = 1;

@interface VAPRoom ()

@property (nonatomic, retain)     NSMutableArray     *mutableEmployees;

@end

@implementation VAPRoom

@dynamic employees;

#pragma mark -
#pragma mark Initi

- (void)dealloc
{
    self.mutableEmployees = nil;
    
    [super dealloc];
}

- (instancetype)initWithEmployeesCount:(NSUInteger) employeesCount {
    self = [super init];
    if (self) {
        _employeesCount = employeesCount;
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
#pragma mark Public

- (void)addEmployee:(id)object {
    if (nil != object && NO == [self.mutableEmployees containsObject:object]) {
        [self.mutableEmployees addObject:object];
    }
}

@end
