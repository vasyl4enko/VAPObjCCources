//
//  VAPChangesModelTwoIndexes.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 27.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPChangesModelTwoIndexes.h"

@interface VAPChangesModelTwoIndexes ()
@property (nonatomic, assign)     NSUInteger  fromIndex;
@property (nonatomic, assign)     NSUInteger  toIndex;

@end

@implementation VAPChangesModelTwoIndexes

+ (instancetype)modelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex state:(VAPArrayStates)state {
    VAPChangesModelTwoIndexes *model = [self modelWithState:state];
    model.fromIndex = fromIndex;
    model.toIndex = toIndex;
    
    return model;
}

@end
