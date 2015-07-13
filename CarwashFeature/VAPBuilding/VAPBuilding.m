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
@property (nonatomic, retain) NSMutableArray *mutableRooms;

@end

@implementation VAPBuilding

#pragma mark -
#pragma mark

+ (Class)buildingClassForGender:(VAPBuildingType) type {
    return VAPBuildingTypeCarwash == type ? [VAPCarwashBuilding class] : [VAPOfficeBuilding class];
}

#pragma mark -
#pragma mark

- (void)dealloc
{
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (id)initWithBuildingType:(VAPBuildingType) type {
    self = [super init];
    Class class = [[self class] buildingClassForGender:type];
    [self release];
    return [[class alloc] init];
}

#warning make init mutable rooms
@dynamic rooms;

-(NSArray *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

@end
