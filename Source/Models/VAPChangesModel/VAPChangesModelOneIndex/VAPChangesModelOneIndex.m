//
//  VAPChangesModelOneIndex.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 27.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPChangesModelOneIndex.h"

#import "NSIndexPath+VAPExtensions.h"

@interface VAPChangesModelOneIndex ()
@property (nonatomic, assign)   NSUInteger  targetIndex;

@end

@implementation VAPChangesModelOneIndex

+ (instancetype)modelWithIndex:(NSUInteger)targetIndex state:(VAPArrayStates)state {
    VAPChangesModelOneIndex *model = [self modelWithState:state];
    model.targetIndex = targetIndex;
    
    return model;
}

@end

@implementation VAPChangesModelOneIndex (VAPIndexPath)

- (NSIndexPath *)targetIndexPath {
   return [NSIndexPath indexPathForRow:self.targetIndex];
}

@end
