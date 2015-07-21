//
//  VAPEmployee.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VAPEmployee : NSObject
@property(nonatomic, copy)      NSDate      *experience;
@property(nonatomic, assign)    NSUInteger     salary;
@property(nonatomic, assign, getter = isBusy) BOOL busy;


- (id)performEmployeeSpecificOperationWithObject:(id) object;

@end
