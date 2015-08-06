//
//  VAPAccountant.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPAccountant.h"

@implementation VAPAccountant

#pragma mark -
#pragma mark VAPEmployeeObserver

- (void)employeeDidEndJob:(VAPEmployee *)employee {
    [employee moneyTransferTo:self withCost:employee.wallet];
    [self performEmployeeSpecificOperationWithObject:nil];
}


@end
