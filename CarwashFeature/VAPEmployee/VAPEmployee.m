//
//  VAPEmployee.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEmployee.h"
#import "VAPDirector.h"
#import "VAPCarwasher.h"
#import "VAPAccountant.h"

@implementation VAPEmployee

#pragma mark -
#pragma mark Class Methods

+ (Class)employeeClassForType:(VAPEmployeeType) type {
    Class class;
    switch (type) {
        case VAPAccountantType:
            class = [VAPAccountant class];
            break;
        case VAPCarwasherType:
            class = [VAPCarwasher class];
            break;
        case VAPDirectorType:
            class = [VAPDirector class];
            break;
            
        default:
            break;
    }
    
    return class;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)initWithEmployeeType:(VAPEmployeeType)type {
    self = [super init];
    Class class = [[self class] employeeClassForType:type];
    [self release];
    
    return [[class alloc] init];
}

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificOperation {
    
}


@end
