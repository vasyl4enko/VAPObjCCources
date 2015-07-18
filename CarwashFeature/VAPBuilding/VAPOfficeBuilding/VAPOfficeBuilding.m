//
//  VAPOfficeBuilding.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPOfficeBuilding.h"
#import "VAPRoom.h"

@implementation VAPOfficeBuilding

- (instancetype)initWithDefaultRoom {
    return [self initWithRoomsCount:kVAPDefaultCountRooms];
}

- (instancetype)initWithRoomsCount:(NSUInteger) count {
    self = [super init];
    self.roomsCount = count;
    return self;
}

@end
