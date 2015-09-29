//
//  VAPChangesModelTwoIndexes.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 27.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPChangesModel.h"

@interface VAPChangesModelTwoIndexes : VAPChangesModel
@property (nonatomic, readonly)     NSUInteger  fromIndex;
@property (nonatomic, readonly)     NSUInteger  toIndex;

+ (instancetype)modelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex state:(VAPArrayStates)state;

@end
