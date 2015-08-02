//
//  VAPDirector.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPDirector.h"

static NSString *const kDirectorGreeting  = @"I'm director";
NSString *const kDirectorProffit = @"My proffit %lu";

@implementation VAPDirector

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificOperationWithObject:(id) object {
    NSLog(kDirectorGreeting);
    self.wallet += [object integerValue];
    NSLog(kDirectorProffit, self.wallet);
}

- (void)employeeDidAddMoney:(VAPEmployee *)employee {
    self.wallet = employee.wallet;
    employee.wallet = 0;
    employee.busy = NO;
}

@end
