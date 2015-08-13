//
//  VAPEnterprise.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 15.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VAPEmployee.h"
#import "VAPEmployeeObserver.h"

@class VAPEmployee;
@class VAPCar;
@class VAPCarQueue;
@class VAPEmployeesStorage;

FOUNDATION_EXTERN NSString *const kErrorMessage;

@interface VAPEnterprise : NSObject<VAPEmployeeObserver>
//@property(nonatomic, retain, readonly)  NSArray *employees;
@property(nonatomic, retain)            VAPCarQueue         *queue;
@property(nonatomic, retain)            VAPEmployeesStorage *employee;

- (void)addEmmployye:(VAPEmployee *)object;
- (void)washCar:(VAPCar *)object;


@end
