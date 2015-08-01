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
#import "VAPAccountant.h"



@implementation VAPCarwashTest

+ (void)performWashingTest {
    VAPEnterprise *enterprise = [VAPEnterprise object];
    
    uint64_t i = 0;
   
    
    
    [enterprise addEmmployye:[VAPDirector object]];
    [enterprise addEmmployye:[VAPCarwasher object]];
    [enterprise addEmmployye:[VAPAccountant object]];
    i = 0;
    
    
}

@end
