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

@interface VAPChangesModel ()
@property (nonatomic, assign)     VAPArrayStates  state;

@end

@implementation VAPChangesModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithState:(VAPArrayStates)state {
    VAPChangesModel *model = [self new];
    model.state = state;
    
    return model;
}

@end

@implementation VAPChangesModel (VAPInitializationModels)

+ (instancetype)insertModelWithIndex:(NSUInteger)index {
    return [VAPChangesModelOneIndex modelWithIndex:index state:VAPArrayStatesInsert];
}
+ (instancetype)deleteModelWithIndex:(NSUInteger)index {
    return [VAPChangesModelOneIndex modelWithIndex:index state:VAPArrayStatesDelete];
}
+ (instancetype)moveModelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    return [VAPChangesModelTwoIndexes modelFromIndex:fromIndex toIndex:toIndex state:VAPArrayStatesMove];
}

@end
