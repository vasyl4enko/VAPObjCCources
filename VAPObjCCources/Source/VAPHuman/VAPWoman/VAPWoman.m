//
//  VAPWoman.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 07.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPWoman.h"
#import "VAPMan.h"

//static NSString *const kBabyBirth = @"Baby-birth";

@implementation VAPWoman

#pragma mark -
#pragma mark Initializations and Deallocations


#pragma mark -
#pragma mark Public Implementation

- (id)performGenderSpecificOperation {
//    NSLog(kBabyBirth);
    
    return [[[VAPWoman alloc] initWithGender:arc4random_uniform(2)] autorelease];
}

@end
