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

FOUNDATION_EXTERN NSString *const kErrorMessage;

@interface VAPEnterprise : NSObject <VAPEmployeeObserver>

- (void)washCar;
- (void)washCar:(VAPCar *)car;



@end
