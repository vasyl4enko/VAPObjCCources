//
//  VAPAccountant.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPAccountant.h"

@implementation VAPAccountant

- (void)doJobWithObject:(id<VAPMoneyFlowing>)object {
    VAPEmployee *employee = (VAPEmployee *)object;
    [employee payTo:self withCost:employee.wallet];
    uint rand = arc4random_uniform(10) + 2;
    usleep(rand * 1000);
    [employee mayBeFree];
}

@end
