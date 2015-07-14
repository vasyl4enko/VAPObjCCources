//
//  VAPOfficeBuilding.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPOfficeBuilding.h"
#import "VAPRoom.h"

static NSUInteger const kVAPDefaultRoomCount = 1;

@implementation VAPOfficeBuilding

- (instancetype)initWithDefaultRoom {
    return [self initWithRoomCount:kVAPDefaultRoomCount];
}

- (instancetype)initWithRoomCount:(NSUInteger) count {
    self = [super init];
    if (self) {
        NSUInteger iterator = 0;
        while (iterator < count) {
            VAPRoom *room = [[[VAPRoom alloc] initWithEmployeesCount:count] autorelease];
            [self addRooms:room];
            iterator++;
        }
    }
    return nil;
}

@end
