//
//  VAPChangesModelTwoIndexes.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 27.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPChangesModelTwoIndexes.h"

#import "NSIndexPath+VAPExtensions.h"

@interface VAPChangesModelTwoIndexes ()
@property (nonatomic, assign)     NSUInteger  sourceIndex;
@property (nonatomic, assign)     NSUInteger  targetIndex;

@end

@implementation VAPChangesModelTwoIndexes

+ (instancetype)modelFromIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)targetIndex state:(VAPArrayStates)state {
    VAPChangesModelTwoIndexes *model = [self modelWithState:state];
    model.sourceIndex = sourceIndex;
    model.targetIndex = targetIndex;
    
    return model;
}

@end

@implementation VAPChangesModelTwoIndexes (VAPIndexPaths)

- (NSIndexPath *)targetIndexPath {
    return [NSIndexPath indexPathForRow:self.targetIndex];
}

- (NSIndexPath *)sourceIndexPath {
    return [NSIndexPath indexPathForRow:self.sourceIndex];
}

@end
