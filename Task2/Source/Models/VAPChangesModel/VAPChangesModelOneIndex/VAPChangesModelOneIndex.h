//
//  VAPChangesModelOneIndex.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 27.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPChangesModel.h"

@interface VAPChangesModelOneIndex : VAPChangesModel
@property (nonatomic, readonly) NSUInteger index;

+ (instancetype)modelWithIndex:(NSUInteger)index state:(VAPArrayStates)state;

@end
