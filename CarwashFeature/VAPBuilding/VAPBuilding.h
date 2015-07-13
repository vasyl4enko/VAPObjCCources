//
//  VAPBuilding.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, VAPBuildingType) {
    VAPBuildingTypeCarwash,
    VAPBuildingTypeOffice
};

@interface VAPBuilding : NSObject

@property (nonatomic, retain, readonly) NSArray *rooms;

- (id)initWithBuildingType:(VAPBuildingType) type NS_DESIGNATED_INITIALIZER;

@end
