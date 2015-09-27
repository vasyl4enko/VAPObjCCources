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
@property (nonatomic, strong)   NSMutableArray     *mutableData;

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
        
        self.mutableData = localData;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)data {
    return [self.mutableData copy];
}

@end
