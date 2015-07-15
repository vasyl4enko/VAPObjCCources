//
//  VAPBuilding.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSUInteger const kVAPDefaultCountRooms;

typedef NS_ENUM(NSUInteger, VAPBuildingType) {
    VAPBuildingTypeCarwash,
    VAPBuildingTypeOffice
};

@interface VAPBuilding : NSObject
@property (nonatomic, readonly)     NSArray         *rooms;
@property (nonatomic, assign)       NSUInteger      roomsCount;

- (id)initWithBuildingType:(VAPBuildingType) type roomsCount:(NSUInteger) count NS_DESIGNATED_INITIALIZER;

- (id)initWithBuildingType:(VAPBuildingType) type;

- (void)addRoom:(id)object;

- (void)removeRoom:(id)objects;

@end
