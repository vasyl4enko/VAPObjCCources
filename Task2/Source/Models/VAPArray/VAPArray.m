//
//  VAPArray.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 26.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPArray.h"

@interface VAPArray ()
@property (nonatomic, strong)     NSMutableArray     *mutableData;

@end

@implementation VAPArray

@dynamic data;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableData = [NSMutableArray new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)data {
    return [self.mutableData copy];
}

#pragma mark -
#pragma mark Public methods

- (void)addDataObject:(id)object {
    if (object) {
        [self.mutableData addObject:object];
    }
}

- (void)removeObject:(id)object {
    [self.mutableData removeObject:object];
}

- (BOOL)containsObject:(id)object {
    return [self.mutableData containsObject:object];
}

- (id)objectAtIndex:(NSUInteger)index {
    id result = nil;
    if ([self count] > index) {
        result = [self.data objectAtIndex:index];
    }
    
    return result;
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    id result = nil;
    if ([self count] > index) {
        result = [self.data objectAtIndex:index];
    }
    
    return result;
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.mutableData removeObjectAtIndex:index];
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    [self.mutableData insertObject:object atIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object {
    [self.mutableData replaceObjectAtIndex:index withObject:object];
}

- (void)moveObjectFromIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex withObject:(id)object {
    [self.mutableData removeObjectAtIndex:index];
    [self.mutableData insertObject:object atIndex:index];
}

- (NSUInteger)count {
    return self.mutableData.count;
}

@end
