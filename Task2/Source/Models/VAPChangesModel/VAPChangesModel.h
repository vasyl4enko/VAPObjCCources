//
//  VAPChangesModel.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 25.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, VAPArrayStates) {
    VAPArrayStatesInsert,
    VAPArrayStatesDelete,
    VAPArrayStatesMove,
};

@interface VAPChangesModel : NSObject

@end
