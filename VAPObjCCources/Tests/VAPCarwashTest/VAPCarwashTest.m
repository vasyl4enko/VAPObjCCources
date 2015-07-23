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
#import "VAPBuilding.h"
#import "VAPCarwasher.h"
#import "VAPDirector.h"
#import "VAPAccountant.h"
#import "VAPRoom.h"
#import "VAPCarwashRoom.h"

@implementation VAPCarwashTest

+ (void)performWashingTest {
    VAPEnterprise *enterprise = [VAPEnterprise object];
    
    uint64_t i = 0;
    while (i < 2) {
        [enterprise addBuilding:[VAPBuilding object]];
        i++;
    }
    ;
    [enterprise addRoom:[VAPRoom object]];
    [enterprise addRoom:[[[VAPCarwashRoom alloc] initWithEmployeesCount:2 carsCount:2] autorelease]];
    
    [enterprise addEmmployye:[VAPDirector object]];
    [enterprise addEmmployye:[VAPCarwasher object]];
    [enterprise addEmmployye:[VAPAccountant object]];
}

@end
