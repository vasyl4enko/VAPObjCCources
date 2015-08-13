//
//  VAPEnterprise.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 15.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEmployeesStorage.h"
#import "VAPCarQueue.h"
#import "VAPEnterprise.h"
#import "VAPCar.h"
#import "VAPCarwasher.h"
#import "VAPAccountant.h"
#import "VAPDirector.h"
#import "NSObject+VAPExtension.h"

NSString *const kVAPErrorMessage = @"some workers aren't on his position or maybe room is nil";

@implementation VAPEnterprise

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.employee = nil;
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.queue = [VAPCarQueue object];
        self.employee = [VAPEmployeesStorage object];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Implementation

- (void)addEmmployye:(VAPEmployee *)object {
    if (nil != object) {
        [self.employee addEmployee:object];
        [object addObserver:self];
    }
}

- (void)washCar:(VAPCar *)object {
    VAPCar *car = [self.queue dequeue];
    if (nil != car) {
        VAPCarwasher *freeCarwasher = (VAPCarwasher *)[self.employee freeEmployeeWithClass:[VAPCarwasher class]];
        if (nil != freeCarwasher) {
            [freeCarwasher performEmployeeSpecificOperationWithObject:car];
        } else {
            NSLog(kVAPErrorMessage);
        }
    }
}

@end
