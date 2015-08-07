//
//  VAPAccountant.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPAccountant.h"

@implementation VAPAccountant

#pragma mark -
#pragma mark Public Implimentation

- (void)doJobWithObject:(id<VAPMoneyFlowing>)object {
    [object moneyTransferTo:self withCost:object.wallet];
    [self setEndWorkState:VAPStateEndWork];
}

@end
