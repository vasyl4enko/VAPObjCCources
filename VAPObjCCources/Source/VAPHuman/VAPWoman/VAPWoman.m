//
//  VAPWoman.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 07.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPWoman.h"

@implementation VAPWoman

- (id)performGenderSpecificOperation {
    return [[self VAPHumanBirthChild] autorelease];
}

@end
