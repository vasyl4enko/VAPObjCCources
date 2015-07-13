//
//  VAPBuilding.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPBuilding.h"

@interface VAPBuilding ()
@property (nonatomic, retain)               NSMutableArray      *mutableRooms;

@end

@implementation VAPBuilding

#pragma mark -
#pragma mark

- (void)dealloc
{
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (id)initWithBuildingType:(VAPBuildingType) type {
    self = [super init];
    if (self) {
        
    }
    return self;
}

#warning make init mutable rooms
@dynamic rooms;

-(NSArray *)rooms {
    return [[self.mutableRooms copy] autorelease];
}

@end
