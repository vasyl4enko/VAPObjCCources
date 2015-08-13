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
        uint64_t i = 0;
        self.mutableEmployees = [NSMutableArray array];
        while(i < 10) {
            [self.mutableEmployees addObject:[VAPCarwasher object]];
            NSLog(@"add");
            i++;
        }
        i = 0;
        
        while(i < 10) {
            [self.mutableEmployees addObject:[VAPAccountant object]];
            NSLog(@"acc");
            i++;
        }
        NSLog(@"count %lu",self.mutableEmployees.count);
        
        VAPEmployee *acc = [self freeEmployeeWithClass:[VAPAccountant class]];
//        [acc beginJob];
        
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

- (VAPEmployee *)freeEmployeeWithClass:(Class)classType {
    __block VAPEmployee *freeEmployee = nil;
    NSArray *array = self.mutableEmployees;
    [array enumerateObjectsUsingBlock: ^(VAPEmployee *employee, NSUInteger index, BOOL *stop) {
        if ([employee isKindOfClass:classType] && VAPStateFree == employee.state) {

            freeEmployee = employee;
            *stop = YES;
        }
    }];
    
    return freeEmployee;
}

- (void)addEmployee:(VAPEmployee *)employee {
    [self.mutableEmployees addObject:employee];
}

- (void)removeEmployee:(VAPEmployee *)employee {
    [self.mutableEmployees removeObject:employee];
}


@end
