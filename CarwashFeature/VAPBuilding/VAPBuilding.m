//
//  VAPBuilding.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPBuilding.h"
#import "VAPCarwashBuilding.h"
#import "VAPOfficeBuilding.h"

@interface VAPBuilding ()
@property (nonatomic, retain)     NSMutableArray    *mutableRooms;

+ (Class)buildingForType:(VAPBuildingType) type;

@end

@implementation VAPBuilding
@dynamic rooms;

#pragma mark -
#pragma mark Class Methods

+ (Class)buildingForType:(VAPBuildingType) type {
    return VAPBuildingTypeCarwash == type ? [VAPCarwashBuilding class] : [VAPOfficeBuilding class];
}

#pragma mark -
#pragma mark - init

- (void)dealloc
{
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (id)initWithBuildingType:(VAPBuildingType) type {
    self = [super init];
    Class class = [[self class] buildingForType:type];
    [self release];
    
    return [[class alloc] initWithDefaultRoom];
}



#pragma mark -
#pragma mark Accessors

- (NSSet *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

- (NSMutableArray *)mutableRooms {
    if (!_mutableRooms) {
        _mutableRooms = [[NSMutableArray alloc] init];
    }
    
    return _mutableRooms;
}

#pragma mark -
#pragma mark Public

- (void)addRooms:(id)object {
    if (nil != object && NO == [self.mutableRooms containsObject:object]) {
        [self.mutableRooms addObject:object];
    }
}


@end
