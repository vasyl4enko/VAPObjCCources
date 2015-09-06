//
//  VAPDirector.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPDirector.h"




NSString * const kVAPDirectorProffit = @"My proffit %lu";

@implementation VAPDirector

- (void)doJobWithObject:(id<VAPMoneyFlowing>)object {
    @autoreleasepool {
        VAPEmployee *employee = (VAPEmployee *)object;
        [employee payTo:self withCost:employee.wallet];
        uint rand = arc4random_uniform(10) + 2;
        usleep(rand * 1000);
        NSLog(kVAPDirectorProffit, self.wallet);
        employee.state = VAPStateFree;
        [super doJobWithObject:nil];
        self.state = VAPStateFree;
    }
}

@end
