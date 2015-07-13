//
//  NSObject+VAPExtension.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "NSObject+VAPExtension.h"

@implementation NSObject (VAPExtension)

+ (id)object{
    return [[[self alloc] init] autorelease];
}

@end
