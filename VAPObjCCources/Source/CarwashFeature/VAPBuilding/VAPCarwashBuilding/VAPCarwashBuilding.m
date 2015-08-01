//
//  VAPCarwashBuilding.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPCarwashBuilding.h"
#import "VAPCarwashRoom.h"
#import "VAPCar.h"

@implementation VAPCarwashBuilding

- (instancetype)initWithDefaultRoom {
    return [self initWithRoomsCount:kVAPDefaultCountRooms];
}

- (instancetype)initWithRoomsCount:(NSUInteger) count {
    self = [super init];
    self.roomsCount = count;
    return self;
}

- (id)performBuildingSpecificOperatiom:(id) object {
    NSMutableArray *result;
    if (nil != object && [object isKindOfClass:[NSArray class]]) {
        result = [NSMutableArray array];
        uint64_t index = 0;
        for (VAPCarwashRoom *carwashRoom in self.rooms) {
            uint64_t countCars = [object count];
            uint64_t roomsCount = self.roomsCount;
            uint64_t iterator = 0;
            uint64_t countCarsForOneRoom = countCars / roomsCount;
            if (0 != countCars % self.roomsCount && 0 == iterator) {
                countCarsForOneRoom += countCars % roomsCount;
            }
            while (iterator < countCarsForOneRoom) {
                [carwashRoom addCar:[object objectAtIndex:index]];
                if (carwashRoom.carsCount == [carwashRoom.cars count]) {
                    [result addObject:[carwashRoom performRoomSpecificOperatiom:nil]];
                }
                [carwashRoom removeCars];
                iterator++;
                index++;
            }
        }
        
    }
    return result;
}


@end
