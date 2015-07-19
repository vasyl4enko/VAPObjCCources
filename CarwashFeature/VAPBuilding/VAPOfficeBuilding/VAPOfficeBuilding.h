//
//  VAPOfficeBuilding.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPBuilding.h"

@interface VAPOfficeBuilding : VAPBuilding

- (instancetype)initWithDefaultRoom;

- (instancetype)initWithRoomsCount:(NSUInteger) count;

@end
