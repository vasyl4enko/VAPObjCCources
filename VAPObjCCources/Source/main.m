//
//  main.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 06.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VAPCarwashTest.h"
#import "VAPCarwasher.h"
#import "VAPCar.h"
#import "VAPAccountant.h"
#import "VAPDirector.h"
#import "VAPEnterprise.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [VAPCarwashTest performWashingTest];
//        VAPCarwasher *carwasher = [[[VAPCarwasher alloc] init] autorelease];
//        carwasher.busy = NO;
//        VAPAccountant *accountant = [[[VAPAccountant alloc] init] autorelease];
//        VAPCar *car = [[[VAPCar alloc] init] autorelease];
//        VAPEnterprise *enterpise = [[[VAPEnterprise alloc] init] autorelease];
//        [carwasher addObserver:enterpise];
//        [accountant addObserver:enterpise];
//        [accountant setDelegatingObject:carwasher];
//        [carwasher performEmployeeSpecificOperationWithObject:car];
//        [enterpise addEmmployye:director];
//        [enterpise addEmmployye:carwasher];
//        [enterpise addEmmployye:accountant];
//        [enterpise washCar:car];
//        
        
//        car.dirty = YES;
//        [carwasher performEmployeeSpecificOperationWithObject:car];
//        NSLog(@"%money %lu",director.wallet);
////        [carwasher setDelegatingCar:car2];
//        car2.dirty = YES;
//        [carwasher performEmployeeSpecificOperationWithObject:car2];
//        NSLog(@"%money %lu",director.wallet);

        
    }
    return 0;
}
