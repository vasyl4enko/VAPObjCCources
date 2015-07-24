//
//  VAPBuilding.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VAPEmployee.h"

FOUNDATION_EXTERN NSUInteger const kVAPDefaultCountRooms;

@interface VAPBuilding : NSObject
@property (nonatomic, readonly)     NSArray         *rooms;
@property (nonatomic, assign, readonly)       NSUInteger      maxCount;

- (instancetype)initWithCount:(NSUInteger)count NS_DESIGNATED_INITIALIZER;
- (void)addRoom:(id)object;
- (void)removeRoom:(id)objects;
- (BOOL)hasEmptyWorkplace;

@end
