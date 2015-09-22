//
//  VAPDataArray.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPDataArray.h"
#import "VAPData.h"

static const NSUInteger kVAPCountRows = 10;

@interface VAPDataArray ()
@property (nonatomic, strong, readwrite)   NSMutableArray     *mutableData;

@end

@implementation VAPDataArray

@dynamic data;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        
        NSMutableArray *localData = [NSMutableArray new];
        for (NSUInteger index = 0; index < kVAPCountRows; index++) {
            [localData addObject:[VAPData new]];
        }
        self.mutableData = [NSMutableArray new];
        self.mutableData = localData;
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
    if (self.count > index) {
       result = [self.data objectAtIndex:index];
    }
    
    return result;
}
- (id)objectAtIndexedSubscript:(NSUInteger)index {
    id result = nil;
    if (self.count > index) {
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

- (NSUInteger)count {
    return self.mutableData.count;
}

@end
