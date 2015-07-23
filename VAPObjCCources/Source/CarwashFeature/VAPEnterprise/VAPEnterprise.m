//
//  VAPEnterprise.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 15.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEnterprise.h"
#import "VAPBuilding.h"
#import "VAPCarwasher.h"
#import "VAPCarwashRoom.h"

@interface VAPEnterprise ()
@property (nonatomic, retain) NSMutableArray *mutableBuildings;

- (void)findFreePlaceForEmployye:(id) object rooms:(NSArray *)objects;
@end

@implementation VAPEnterprise

@dynamic buildings;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableBuildings = nil;
    
    [super dealloc];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mutableBuildings = [NSMutableArray array];
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)buildings {
    return [[self.mutableBuildings copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementation

- (void)addBuilding:(VAPEmployee *)object {
    if (nil != object) {
        [self.mutableBuildings addObject:object];
    }
}

- (void)addRoom:(VAPRoom *)object {
    if (nil != object) {
        NSArray *localBuildings = self.buildings;
        for (VAPBuilding *build in localBuildings) {
            if (0 == [build.rooms count])
            {
                [build addRoom:object];
            }
            else if (build.maxCount > [build.rooms count]
                       && [[build.rooms firstObject] isKindOfClass:[object class]])
            {
                [build addRoom:object];
            }
        }
    }
}

- (void)addEmmployye:(VAPEmployee *)object {
    if (nil != object) {
        NSArray *buildings = self.buildings;
        for (VAPBuilding *build in buildings) {
            if ([build hasEmptyWorkplace]) {
                NSArray *localRooms = build.rooms;
                if ([object isKindOfClass: [VAPCarwasher class]]
                    && [[build.rooms firstObject] isKindOfClass:[VAPCarwashRoom class]])
                {
                    [self findFreePlaceForEmployye:object rooms:localRooms];
                    
                    break;
                } else
                {
                    [self findFreePlaceForEmployye:object rooms:localRooms];
                    
                    break;
                }
            }
            
        }
    }
}

- (void)findFreePlaceForEmployye:(id) object rooms:(NSArray *)objects {
    for (VAPRoom *room in objects) {
        if (room.employeesCount != [room.employees count]) {
            [room addEmployee:object];
            
            break;
        }
    }
}

@end
