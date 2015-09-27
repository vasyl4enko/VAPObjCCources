//
//  VAPChangesModelTwoIndexes.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 27.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPChangesModel.h"

@interface VAPChangesModelTwoIndexes : VAPChangesModel

- (instancetype)initWithFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex state:(VAPArrayStates)state;

@end
