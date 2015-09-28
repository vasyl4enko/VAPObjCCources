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

@implementation VAPDataArray

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        for (NSUInteger index = 0; index < kVAPCountRows; index++) {
            [self addObject:[VAPData new]];
        }
    }
    
    return self;
}

@end
