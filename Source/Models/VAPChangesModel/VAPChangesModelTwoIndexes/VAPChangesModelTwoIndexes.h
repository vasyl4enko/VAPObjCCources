//
//  VAPChangesModelTwoIndexes.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 27.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPChangesModel.h"

@interface VAPChangesModelTwoIndexes : VAPChangesModel
@property (nonatomic, readonly)     NSUInteger  sourceIndex;
@property (nonatomic, readonly)     NSUInteger  targetIndex;

+ (instancetype)modelFromIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)targetIndex state:(VAPArrayStates)state;

@end

@interface VAPChangesModelTwoIndexes (VAPIndexPaths)

- (NSIndexPath *)targetIndexPath;
- (NSIndexPath *)sourceIndexPath;

@end
