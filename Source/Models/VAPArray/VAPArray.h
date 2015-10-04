//
//  VAPArray.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 26.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPObservable.h"

@interface VAPArray : VAPObservable <NSCoding>
@property (nonatomic, readonly)     NSArray         *data;
@property (nonatomic, readonly)     NSUInteger      count;

- (void)addObject:(id)object;
- (void)removeObject:(id)object;
- (BOOL)containsObject:(id)object;

- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)insertObject:(id)object atIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object;
- (void)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
