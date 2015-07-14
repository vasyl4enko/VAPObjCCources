//
//  VAPRoom.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VAPRoom : NSObject

//директоры
//бухгалетра
//мойщики
@property (nonatomic, retain, readonly)     NSArray     *employees;
@property (nonatomic, assign, readonly)     NSUInteger  employeesCount;

- (instancetype)initWithEmployeesCount:(NSUInteger) employeesCount NS_DESIGNATED_INITIALIZER;

- (void)addEmployee:(id) object;

@end
