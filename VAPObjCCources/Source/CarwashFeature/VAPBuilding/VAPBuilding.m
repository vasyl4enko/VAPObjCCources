//
//  VAPBuilding.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPBuilding.h"
#import "VAPCarwashRoom.h"
#import "VAPEmployee.h"

NSUInteger const kVAPDefaultCountRooms = 1;

@interface VAPBuilding ()
@property (nonatomic, retain)     NSMutableArray    *mutableRooms;

@end

@implementation VAPBuilding

@dynamic rooms;

#pragma mark -
#pragma mark Class Methods


#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc
{
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (instancetype)initWithCount:(NSUInteger)count {
    self = [super init];
    if (self) {
        _maxCount = count;
        self.mutableRooms = [NSMutableArray array];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithCount:kVAPDefaultCountRooms];
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

- (NSMutableArray *)mutableRooms {
    return _mutableRooms;
}

#pragma mark -
#pragma mark Public Implementation

- (void)addRoom:(id)object {
    if (nil != object
        && NO == [self.mutableRooms containsObject:object]
        && self.maxCount > [self.mutableRooms count])
    {
        [self.mutableRooms addObject:object];
    }
}

- (void)removeRoom:(id)objects {
    [self.mutableRooms removeObject:objects];
}

- (BOOL)hasEmptyWorkplace {
    NSArray *localRooms =self.rooms;
    for (VAPRoom *room in localRooms) {
        if (room.employeesCount != [room.employees count]) {
            return YES;
        }
    }
    return NO;
}

- (VAPRoom *)findRoomWithEmployee:(VAPEmployee *)employee class:(Class)roomType {
    NSArray *rooms = self.rooms;
    VAPRoom *resultRoom = nil;
    for (VAPRoom *room in rooms) {
        if ([room isKindOfClass:roomType]) {
            NSArray *employees = room.employees;
            for (VAPEmployee *localEmployee in employees) {
                if (employee == localEmployee) {
                    return room;
                }
            }
        }
    }
    return resultRoom;
}

@end
