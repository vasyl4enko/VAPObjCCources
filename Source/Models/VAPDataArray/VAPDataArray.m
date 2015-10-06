//
//  VAPDataArray.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPDataArray.h"

#import "VAPData.h"

static NSUInteger const kVAPCountRows = 10;

@interface VAPDataArray ()

- (void)fillDataArray;

@end

@implementation VAPDataArray

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
   
    return [self initWithCount:kVAPCountRows];
}

- (instancetype)initWithCount:(NSUInteger)count {
    self = [super init];
    if (self) {
        [self fillDataArray];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private Methods

- (void)fillDataArray {
    for (NSUInteger index = 0; index < kVAPCountRows; index++) {
        [self addObject:[VAPData new]];
    }
}

@end
