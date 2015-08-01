//
//  VAPEmployee.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VAPObservableObject.h"



typedef NS_ENUM(NSUInteger, VAPEmployeeState) {
    VAPStateAddMoney,
    VAPStateBecomeLessMoney,
};

@class VAPEmployee;

@protocol VAPEmployeeObserver <NSObject>

@optional
- (void)employeeDidAddMoney:(VAPEmployee *)employee;
- (void)employeeDidBecomeLessMoney:(VAPEmployee *)employee;

@end

@interface VAPEmployee : VAPObservableObject

@property(nonatomic, retain)                    VAPEmployee     *receiver;

@property(nonatomic, assign)                    NSUInteger      wallet;
@property(nonatomic, assign, getter = isBusy)   BOOL            busy;


- (void)performEmployeeSpecificOperationWithObject:(id) object;

@end
