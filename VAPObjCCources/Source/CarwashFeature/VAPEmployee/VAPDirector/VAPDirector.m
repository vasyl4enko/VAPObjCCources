//
//  VAPDirector.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPDirector.h"

static NSString *const kDirectorGreeting  = @"I'm director";

@implementation VAPDirector

#pragma mark -
#pragma mark Public Methods

- (id)performEmployeeSpecificOperationWithObject:(id) object {
    NSLog(kDirectorGreeting);
    NSLog(@"%@",object);
    return [super performEmployeeSpecificOperationWithObject:nil];
}

@end
