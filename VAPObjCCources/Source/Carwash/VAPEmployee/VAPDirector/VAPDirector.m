//
//  VAPDirector.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPDirector.h"

NSString *const kVAPDirectorProffit = @"My proffit %lu";

@implementation VAPDirector

#pragma mark -
#pragma mark Public Implementation

- (void)doJobWithObject:(id<VAPMoneyFlowing>)object {
    [object moneyTransferTo:self withCost:object.wallet];
    [self setEndWorkState:VAPStateEndWork];
    NSLog(kVAPDirectorProffit,self.wallet);
}

@end
