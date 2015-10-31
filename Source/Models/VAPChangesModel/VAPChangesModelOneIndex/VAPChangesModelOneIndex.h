//
//  VAPChangesModelOneIndex.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 27.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPChangesModel.h"

@interface VAPChangesModelOneIndex : VAPChangesModel
@property (nonatomic, readonly) NSUInteger targetIndex;

+ (instancetype)modelWithIndex:(NSUInteger)targetIndex state:(VAPArrayStates)state;

@end

@interface VAPChangesModelOneIndex (VAPIndexPath)

- (NSIndexPath *)targetIndexPath;

@end
