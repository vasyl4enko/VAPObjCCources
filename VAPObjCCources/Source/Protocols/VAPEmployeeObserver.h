//
//  VAPEmployeeObserver.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 03.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VAPEmployee;

@protocol VAPEmployeeObserver <NSObject>

@optional
- (void)employeeDidEndJob:(VAPEmployee *)employee;
- (void)didEmployeeFinishJob:(VAPEmployee *)employee;
@end

