//
//  VAPEnterprise.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 15.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEnterprise.h"
#import "VAPBuilding.h"

@interface VAPEnterprise ()
@property (nonatomic, retain) NSMutableArray *mutableBuildings;

@end

@implementation VAPEnterprise

@dynamic buildings;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableBuildings = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)departments {
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
            else if (build.roomsCount > [build.rooms count]
                       && [[build.rooms firstObject] isKindOfClass:[object class]])
            {
                [build addRoom:object];
            }
        }
    }
}

@end
