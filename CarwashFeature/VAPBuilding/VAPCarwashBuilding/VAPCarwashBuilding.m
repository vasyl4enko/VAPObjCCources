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
    
    // rooms count
    // NSArray         *rooms;
    NSMutableArray *result;
    if (nil != object && [object isKindOfClass:[NSArray class]]) {
        result = [NSMutableArray array];
        for (VAPCarwashRoom *carwashRoom in self.rooms) {
            uint64_t localCountCars = carwashRoom.carsCount;
            uint64_t iterator = 0;
            for (VAPCar *car in object) {
                if (localCountCars > iterator) {
                    [carwashRoom addCar:car];
                    iterator++;
                } else {
                    break;
                }
            }
            
            for (; iterator < localCountCars; iterator++) {
                [carwashRoom addCar:[object objectAtIndex:iterator]];
                [result addObject:[carwashRoom performRoomSpecificOperatiom:nil]];
                [carwashRoom removeCars];
                localCountCars = 0;
            }
            
        }
        
    }
    return result;
}

//if (nil != object && [object isKindOfClass:[NSArray class]]) {
//    uint64_t iterator = 0;
//    result = [NSMutableArray array];
//    for (VAPCar *car in object) {
//        [self.mutableCars addObject:car];
//        iterator++;
//        if (iterator == kVAPDefaultCarsCount) {
//            iterator = 0;
//            VAPCarwasher *worker = [self.employees firstObject]; // at the task we have one worker but
//            //we can add cycle
//            [result addObjectsFromArray:[worker performEmployeeSpecificOperationWithObject:self.cars]];
//            [self removeCars];
//        }
//        
//        
//    }
//    
//    return result;
//}
//
//return result;

@end
