//
//  VAPArray.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 26.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPArray.h"

#import "VAPChangesModel.h"
#import "VAPArrayObserver.h"

#import "NSMutableArray+VAPExtensions.h"

static NSString * const kVAPMutableDataKey  = @"mutableData";
static NSString * const kVAPArchiveFileName = @"data.plist";

@interface VAPArray ()
@property (nonatomic, strong)     NSMutableArray        *mutableData;

- (void)notifyWithChangesModel:(id)model;

@end

@implementation VAPArray

@dynamic data;
@dynamic count;

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

- (NSUInteger)count {
    return self.mutableData.count;
}

#pragma mark -
#pragma mark Public methods

- (void)addObject:(id)object {
    if (object) {
        [self.mutableData addObject:object];
    }
    
    [self notifyWithChangesModel:[VAPChangesModel insertModelWithIndex:self.count]];
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
    
    [self notifyWithChangesModel:[VAPChangesModel deleteModelWithIndex:index]];
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    [self.mutableData insertObject:object atIndex:index];
    
    [self notifyWithChangesModel:[VAPChangesModel insertModelWithIndex:index]];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object {
    [self.mutableData replaceObjectAtIndex:index withObject:object];
}

- (void)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    [self.mutableData moveObjectFromIndex:fromIndex toIndex:toIndex];
    
    [self notifyWithChangesModel:[VAPChangesModel moveModelFromIndex:fromIndex toIndex:toIndex]];
}

- (void)notifyWithChangesModel:(id)model {
    [self notifyObserversWithSelector:@selector(dataArray:didChangeWithChangesModel:)
                           withObject:self
                           withObject:model];
}


- (void)save {
    [NSKeyedArchiver archiveRootObject:self toFile:kVAPMutableDataKey];
}

- (id)loadWithPath:(NSString *)path {
    id array = [NSKeyedUnarchiver unarchiveObjectWithFile:path];;
    if (!array) {
        array = self;
    }

    return array;
}

#pragma mark -
#pragma mark NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.mutableData = [coder decodeObjectForKey:kVAPMutableDataKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.mutableData forKey:kVAPMutableDataKey];
}


@end
