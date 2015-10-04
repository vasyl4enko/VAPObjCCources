//
//  VAPChangesModelOneIndex.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 27.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPChangesModelOneIndex.h"

@interface VAPChangesModelOneIndex ()
@property (nonatomic, assign)   NSUInteger  index;

@end

@implementation VAPChangesModelOneIndex

+ (instancetype)modelWithIndex:(NSUInteger)index state:(VAPArrayStates)state {
    VAPChangesModelOneIndex *model = [self modelWithState:state];
    model.index = index;
    
    return model;
}

@end
