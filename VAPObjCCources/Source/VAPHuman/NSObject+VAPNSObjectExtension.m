//
//  NSObject+VAPNSObjectExtension.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 09.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "NSObject+VAPNSObjectExtension.h"

@implementation NSObject (VAPNSObjectExtension)

+ (id)object{
    return [[[self alloc] init] autorelease];
}

@end
