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
#pragma mark Public Methods

- (NSNumber *)performEmployeeSpecificOperationWithObject:(id) object {
    if (nil != object && [object isMemberOfClass:[NSNumber class]]) {
        NSLog(@"counting money");
        
//        return @([object money]);
    }
    return nil;
}

@end
