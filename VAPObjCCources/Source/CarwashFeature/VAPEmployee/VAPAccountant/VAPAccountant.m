//
//  VAPAccountant.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPAccountant.h"

static NSString *const kAccuntantGreeting  = @"I'm an accountan & money money money, there no my money, i'm so sad :(";

@implementation VAPAccountant

#pragma mark -
#pragma mark Public Methods

- (id)performEmployeeSpecificOperationWithObject:(id) object {
    NSNumber *result;
    if (nil != object && [object isKindOfClass:[NSArray class]]) {
        CGFloat localValue = 0;
        NSLog(kAccuntantGreeting);
        for (id money in object) {
            NSNumber *number = [money firstObject];
            localValue += [number doubleValue];
            
        }
        return [[NSNumber alloc] initWithDouble:localValue];
    }
    return result;
}

@end
