//
//  VAPMan.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 07.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPMan.h"

static NSString *const kGoToWar = @"I go to war";

@implementation VAPMan

#pragma mark -
#pragma mark Public Implementation

- (id)performGenderSpecificOperation {
    NSLog(kGoToWar);
    
    return [super performGenderSpecificOperation];
}

@end
