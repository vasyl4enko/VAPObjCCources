//
//  VAPEmployee.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEmployee.h"

@implementation VAPEmployee

#pragma mark -
#pragma mark Class Methods



#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificOperationWithObject:(id) object {
    
}

- (BOOL)isObjectAbleToPay:(NSUInteger)money {
    return NO;
}
- (void)payMoneyToReciver:(id<VAPMoneyFlowing>)object price:(NSUInteger)money {
    
}

@end
