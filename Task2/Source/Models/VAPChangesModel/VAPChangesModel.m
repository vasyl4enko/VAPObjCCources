//
//  VAPChangesModel.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 25.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPChangesModel.h"

#import "VAPChangesModelOneIndex.h"
#import "VAPChangesModelTwoIndexes.h"

@implementation VAPChangesModel

@dynamic fromIndex;
@dynamic toIndex;
@dynamic arrayState;

#pragma mark -
#pragma mark Class Methods

+ (id)modelChangesFromIndex:(NSUInteger)fromIndex arrayState:(VAPArrayStates)state {
    return [[VAPChangesModelOneIndex alloc] initWithFromIndex:fromIndex state:state];
}

+ (id)modelChangesFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex arrayState:(VAPArrayStates)state {
    return [[VAPChangesModelTwoIndexes alloc] initWithFromIndex:fromIndex toIndex:toIndex state:state];
}

@end
