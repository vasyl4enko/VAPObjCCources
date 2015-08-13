//
//  VAPEmployeesStorage.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 12.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VAPEmployee;

@interface VAPEmployeesStorage : NSObject
@property(nonatomic, readonly)  NSArray     *employees;

- (VAPEmployee *)freeEmployeeWithClass:(Class)classType;

- (void)addEmployee:(VAPEmployee *)employee;
- (void)removeEmployee:(VAPEmployee *)employee;

@end
