//
//  main.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 06.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VAPHumanTests.h"
#import "VAPCarwashRoom.h"
#import "VAPCarwashBuilding.h"
#import "VAPCar.h"
#import "VAPEmployee.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        [VAPHumanTests VAPHumanBehavourTest];
        VAPCarwashRoom *room = [[[VAPCarwashRoom alloc] init] autorelease];
        VAPEmployee *carwasher = [[VAPEmployee alloc] initWithEmployeeType:VAPCarwasherType];
        [room addEmployee:carwasher];
        VAPBuilding *house = [[[VAPBuilding alloc] initWithBuildingType:VAPBuildingTypeCarwash] autorelease];
        [house addRoom:room];
        VAPCar *car = [[[VAPCar alloc] init] autorelease];
        VAPCar *car1 = [[[VAPCar alloc] init] autorelease];
        VAPCar *car2 = [[[VAPCar alloc] init] autorelease];
//        [room performRoomSpecificOperatiom:@[car, car1, car2]];
        [house performBuildingSpecificOperatiom:@[car, car1, car2]];
        NSString *key = [NSString stringWithFormat:@"%@",[house class]];
        NSLog(@"%@",key);
        
        
    }
    return 0;
}
