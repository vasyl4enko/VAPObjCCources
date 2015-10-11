//
//  VAPChangesModel.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 25.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VAPChangesModelOneIndex;
@class VAPChangesModelTwoIndexes;

typedef NS_ENUM(NSUInteger, VAPArrayStates) {
    VAPArrayStatesInsert,
    VAPArrayStatesDelete,
    VAPArrayStatesMove,
    VAPArrayStatesAdd
};

@interface VAPChangesModel : NSObject
@property (nonatomic, readonly)     VAPArrayStates  state;

+ (instancetype)modelWithState:(VAPArrayStates)state;

@end

@interface VAPChangesModel (VAPInitializationModels)

+ (VAPChangesModelOneIndex *)insertModelWithIndex:(NSUInteger)index;
+ (VAPChangesModelOneIndex *)deleteModelWithIndex:(NSUInteger)index;
+ (VAPChangesModelTwoIndexes *)moveModelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
