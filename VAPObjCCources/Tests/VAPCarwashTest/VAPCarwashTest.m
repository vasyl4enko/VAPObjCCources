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
    [enterprise washCar];
    
}

@end
