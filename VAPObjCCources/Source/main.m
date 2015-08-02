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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        [VAPCarwashTest performWashingTest];
        VAPCarwasher *carwasher = [[[VAPCarwasher alloc] init] autorelease];
        VAPAccountant *acc = [[[VAPAccountant alloc] init] autorelease];
        VAPDirector *director = [[[VAPDirector alloc] init] autorelease];
        VAPCar *car = [[[VAPCar alloc] init] autorelease];
        [carwasher addObserver:acc];
        [acc addObserver:director];
        car.dirty = YES;
        [carwasher performEmployeeSpecificOperationWithObject:car];
        NSLog(@"%money %lu",director.wallet);

        
    }
    return 0;
}
