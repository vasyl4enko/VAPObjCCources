//
//  VAPDataArray.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPObservable.h"

@interface VAPDataArray : VAPObservable
@property (nonatomic, readonly)     NSArray     *data;

- (void)addDataObject:(id)object;
- (void)removeObject:(id)object;
- (BOOL)containsObject:(id)object;

- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (NSUInteger)count;

@end
