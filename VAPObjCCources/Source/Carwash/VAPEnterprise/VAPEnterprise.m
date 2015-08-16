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

- (void)washCar {
    VAPCar *car = nil;
    while (nil != (car = [self.queue dequeue])) {
        @autoreleasepool {
            [self performSelectorInBackground:@selector(beginWash:)withObject:car];
//            [self beginWash:car];
        }
    
    }
}

- (void)beginWash:(VAPCar *)car {
    VAPCarwasher *freeCarwasher;
    while (nil == (freeCarwasher = (VAPCarwasher *)[self.employee freeEmployeeWithClass:[VAPCarwasher class]])) {}
    
    if (freeCarwasher == nil) {
        NSLog(kVAPErrorMessage);
    }
    [freeCarwasher performEmployeeSpecificOperationWithObject:car];
}

@end
