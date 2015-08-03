//
//  VAPCarwashTest.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 22.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPCarwashTest.h"
#import "VAPEnterprise.h"
#import "NSObject+VAPExtension.h"
#import "VAPCarwasher.h"
#import "VAPDirector.h"
#import "VAPCar.h"
#import "VAPAccountant.h"



@implementation VAPCarwashTest

+ (void)performWashingTest {
    VAPEnterprise *enterprise = [VAPEnterprise object];
//    VAPCar *car = [VAPCar object];
//    VAPCar *car2 = [VAPCar object];
//    [enterprise washCar:car];
//    [enterprise washCar:car2];
    
    VAPCarwasher *carwasher = [VAPCarwasher object];
    VAPCar *car = [VAPCar object];
    VAPAccountant *accountant = [VAPAccountant object];
    
    [accountant setDelegatingObject:carwasher];
    [carwasher performEmployeeSpecificOperationWithObject:car];
    
    
    
}

@end
