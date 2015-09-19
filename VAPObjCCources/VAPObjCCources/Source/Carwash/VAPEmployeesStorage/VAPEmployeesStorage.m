//
//  VAPEmployeesStorage.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 12.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEmployeesStorage.h"
#import "VAPEmployee.h"
#import "VAPCarwasher.h"
#import "VAPAccountant.h"
#import "VAPDirector.h"
#import "NSObject+VAPExtension.h"


@interface VAPEmployeesStorage ()
@property(nonatomic, retain) NSMutableArray *mutableEmployees;

@end

@implementation VAPEmployeesStorage

@dynamic employees;

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.mutableEmployees = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableEmployees = [[NSMutableArray alloc] init];
        uint32_t randomNumber = arc4random_uniform(100) + 1;
        randomNumber = 10;
        VAPDirector *director = [VAPDirector object];
        VAPAccountant *accountant = [VAPAccountant object];
        
        [self addEmployee:director];
        [self addEmployee:accountant];
        
        [accountant addObserver:director];
        for (uint32_t index = 0; index < randomNumber; index++) {
            VAPCarwasher *carwasher = [VAPCarwasher object];
            [self addEmployee:carwasher];
            [carwasher addObserver:accountant];
        }
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)employees {
    @synchronized(_mutableEmployees) {
        return [[self.mutableEmployees copy] autorelease];
    }
}

#pragma mark -
#pragma mark Public Implementation

- (VAPEmployee *)freeEmployeeWithClass:(Class)classType {
    __block VAPEmployee *freeEmployee = nil;
    @synchronized(_mutableEmployees) {
        NSArray *array = self.mutableEmployees;
        [array enumerateObjectsUsingBlock: ^(VAPEmployee *employee, NSUInteger index, BOOL *stop) {
            if ([employee isKindOfClass:classType] && VAPStateFree == employee.state) {
                
                freeEmployee = employee;
                *stop = YES;
            }
        }];
    }
    return freeEmployee;
}

- (void)addEmployee:(VAPEmployee *)employee {
    @synchronized(_mutableEmployees) {
        [self.mutableEmployees addObject:employee];
    }
}

- (void)removeEmployee:(VAPEmployee *)employee {
    @synchronized (_mutableEmployees) {
        [self.mutableEmployees removeObject:employee];
    }
}


@end
