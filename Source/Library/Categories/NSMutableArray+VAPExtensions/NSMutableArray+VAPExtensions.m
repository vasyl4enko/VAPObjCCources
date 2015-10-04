//
//  NSMutableArray+VAPExtensions.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 30.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "NSMutableArray+VAPExtensions.h"

@implementation NSMutableArray (VAPExtensions)

- (void)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    id object = [self objectAtIndex:fromIndex];
    [self removeObjectAtIndex:fromIndex];
    [self insertObject:object atIndex:toIndex];
}

@end
