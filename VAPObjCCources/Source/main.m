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
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
