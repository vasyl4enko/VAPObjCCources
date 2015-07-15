//
//  VAPCarwashRoom.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPRoom.h"
#import "VAPCar.h"

extern NSUInteger const kVAPDefaultCarsCount;

@interface VAPCarwashRoom : VAPRoom
@property (nonatomic, retain, readonly)     NSArray     *cars;
@property (nonatomic, assign, readonly)     NSUInteger  carsCount;

- (instancetype)initWithEmployeesCount:(NSUInteger) employeesCount
                             carsCount:(NSUInteger) carsCount;

- (void)addCar:(id) object;

- (void)removeCar:(id) object;

- (void)addCars:(NSArray *) objects;

- (void)removeCars;

- (id)firstCar;

@end
