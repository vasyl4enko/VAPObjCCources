//
//  VAPTestTarget.m
//  VAPTestTarget
//
//  Created by Aleksandr Vasylchenko on 22.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "VAPEnterprise.h"
#import "VAPCar.h"


SPEC_BEGIN(VAPCarwash)

describe(@"Test carwash", ^{
    context(@"nsobject", ^{
        VAPEnterprise *enterprise = [VAPEnterprise new];
        VAPCar *car = [VAPCar new];
        VAPCar *car2 = [VAPCar new];
        car.dirty = YES;
        car2.dirty = YES;
        
        [enterprise washCar:car];
        [enterprise washCar:car2];
        
    });
});

SPEC_END