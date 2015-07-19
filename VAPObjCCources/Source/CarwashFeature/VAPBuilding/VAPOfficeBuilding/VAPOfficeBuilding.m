//
//  VAPOfficeBuilding.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPOfficeBuilding.h"
#import "VAPRoom.h"
#import "VAPEmployee.h"
#import "VAPAccountant.h"
#import "VAPDirector.h"

@implementation VAPOfficeBuilding

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
    if (nil != object) {
        result = [NSMutableArray array];
        VAPRoom *room = [self.rooms firstObject];
        for (VAPEmployee *employee in room.employees) {
            if ([employee isMemberOfClass:[VAPAccountant class]]) {
                [result addObject:[employee performEmployeeSpecificOperationWithObject:object]];
                return result;
            } else {
                [result addObject:[employee performEmployeeSpecificOperationWithObject:object]];
                return result;
            }
        }
        return result;
    }
    
    return nil;
}

- (id)performBuildingSpecificOperatiomWithTypeEmployee:(VAPEmployeeType) type object:(id) object {
    NSMutableArray *result;
    if (nil != object) {
        result = [NSMutableArray array];
        VAPRoom *room = [self.rooms firstObject];
        for (VAPEmployee *employee in room.employees) {
            if ([employee isMemberOfClass:[VAPAccountant class]] && VAPAccountantType == type) {
                [result addObject:[employee performEmployeeSpecificOperationWithObject:object]];
                return result;
            } else if(([employee isMemberOfClass:[VAPDirector class]] && VAPDirectorType == type) ) {
                [employee performEmployeeSpecificOperationWithObject:object];
                return result;
            }
        }
        return result;
    }
    
    return nil;
}

@end
