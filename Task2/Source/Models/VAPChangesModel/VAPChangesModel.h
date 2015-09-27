//
//  VAPChangesModel.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 25.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, VAPArrayStates) {
    VAPArrayStatesInsert,
    VAPArrayStatesDelete,
    VAPArrayStatesMove
};

@interface VAPChangesModel : NSObject
@property (nonatomic, readonly)   NSIndexPath     *fromIndex;
@property (nonatomic, readonly)   NSIndexPath     *toIndex;
@property (nonatomic, readonly)   VAPArrayStates  arrayState;

+ (id)modelChangesFromIndex:(NSUInteger)fromIndex arrayState:(VAPArrayStates)state;
+ (id)modelChangesFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex arrayState:(VAPArrayStates)state;

@end
