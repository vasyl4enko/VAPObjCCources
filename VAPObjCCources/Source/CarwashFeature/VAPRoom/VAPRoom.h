//
//  VAPRoom.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSUInteger const kVAPDefaultEmployeesCount;

@interface VAPRoom : NSObject
@property (nonatomic, retain, readonly)     NSArray     *employees;
@property (nonatomic, assign)               NSUInteger  employeesCount;

- (instancetype)initWithCount:(NSUInteger) employeesCount NS_DESIGNATED_INITIALIZER;

- (void)addEmployee:(id) object;

- (void)removeEmployee:(id) object;

- (void)forceToWorkWithObject:(id) object;

- (id)performRoomSpecificOperatiom:(id) object;



@end
